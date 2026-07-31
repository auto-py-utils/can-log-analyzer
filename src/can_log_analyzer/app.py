"""App entrypoint: wires UI and Core modules together."""

from nicegui import ui

from can_log_analyzer.ui.app_ui import create_ui


def main(reload: bool = False) -> None:
    ui.run(create_ui, title='CAN Log Analyzer', port=8080, reload=reload)


if __name__ in {"__main__", "__mp_main__"}:
    main(reload=True)
