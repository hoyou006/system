cmake_minimum_required(VERSION 3.16)

project(system VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS Core Sql)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appsystem
    main.cpp
)

qt_add_qml_module(appsystem
    URI system
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES Bubble.qml Button_normal.qml Custom_textinput.qml manager_page.qml sign_in.qml sign_up.qml user_page.qml
        RESOURCES image.qrc
        QML_FILES CustomButton.qml history_page.qml NavigationState.qml return_page.qml search_page.qml
        QML_FILES user_management.qml
        QML_FILES book_management.qml
        SOURCES user.h user.cpp
        SOURCES database.h database.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appsystem PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appsystem
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appsystem
    PRIVATE Qt6::Quick
)
target_link_libraries(appsystem PRIVATE Qt6::Core Qt6::Sql)
include(GNUInstallDirs)
install(TARGETS appsystem
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
