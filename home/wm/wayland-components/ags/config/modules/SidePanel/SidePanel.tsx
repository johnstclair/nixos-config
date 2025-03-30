import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable } from "astal"

const time = Variable("").poll(1000, "date")

export default function Bar(gdkmonitor: Gdk.Monitor) {
    const { TOP, BOTTOM, RIGHT } = Astal.WindowAnchor

    return <window
        className="SidePanel"
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | BOTTOM | RIGHT}
        application={App}>
        <centerbox>
            <button
                onClicked="echo hello"
                halign={Gtk.Align.CENTER}
            >
                side panel 
            </button>
            <box />
            <button
                onClicked={() => print("hello")}
                halign={Gtk.Align.CENTER}
            >
                <label label={"yooo"} />
            </button>
        </centerbox>
    </window>
}
