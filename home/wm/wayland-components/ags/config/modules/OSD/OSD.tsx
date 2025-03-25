import { App, Astal, Gdk, Gtk } from "astal/gtk3"
import { timeout } from "astal/time"
import Variable from "astal/variable"
import Wp from "gi://AstalWp"

function OnScreenProgress({ visible }: { visible: Variable<boolean> }) {
    const volume = Variable(.75)
      .watch(["bash", "-c", "wpctl get-volume @DEFAULT_SOURCE@ | sed 's|[^0-9]||g'"], (out, prev) => parseInt(out))

    const iconName = Variable("")
    const value = Variable(0)

    let count = 0
    function show(v: number, icon: string) {
        visible.set(true)
        value.set(v)
        iconName.set(icon)
        count++
        timeout(2000, () => {
            count--
            if (count === 0) visible.set(false)
        })
    }

    return (
        <revealer
            setup={(self) => {
              volume.subscribe((value: number) => {
                  console.log(value)
              })
            }}
            revealChild={visible()}
            transitionType={Gtk.RevealerTransitionType.SLIDE_UP}
        >
            <box className="OSD">
                <icon icon={iconName()} />
                <levelbar valign={Gtk.Align.CENTER} widthRequest={100} value={value()} />
                <label label={value(v => `${Math.floor(v * 100)}%`)} />
            </box>
        </revealer>
    )
}

export default function OSD(monitor: Gdk.Monitor) {
    const visible = Variable(false)

    return (
        <window
            gdkmonitor={monitor}
            className="OSD"
            namespace="osd"
            application={App}
            layer={Astal.Layer.OVERLAY}
            keymode={Astal.Keymode.ON_DEMAND}
            anchor={Astal.WindowAnchor.BOTTOM}
        >
            <eventbox onClick={() => visible.set(false)}>
                <OnScreenProgress visible={visible} />
            </eventbox>
        </window>
    )
}
