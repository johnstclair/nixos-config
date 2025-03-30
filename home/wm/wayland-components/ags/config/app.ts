import { App } from "astal/gtk3"
import style from "./styles/main.scss"
import SidePanel from "./modules/SidePanel/SidePanel.tsx"
// import OSD from "./modules/OSD/OSD.tsx"

App.start({
    css: style,
    main() {
        App.get_monitors().map(SidePanel)
        // App.get_monitors().map(OSD)
    },
})
