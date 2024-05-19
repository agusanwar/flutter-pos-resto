Design Pattern State Managemant

Architecture BLoc
    - Struktur Folder
        . lib
            - core
                - components
                - constants
                - extentions
            - data
            - presentation
                - pages
Create Bloc Step by Step
    - create new BLoC
    - add & update event
        const factory LogoutEvent.logout() = _Logout;
    - add & update state
        const factory LoginState.loading() = _Loading;
        const factory LoginState.success() = _Success;
        const factory LoginState.error(String message) = _Error
    - running build freezed
        flutter pub run build_runner build --delete-conflicting-outputs
    - add & edit in bloc
    - add bloc provider in main.dart

Integrasi API
    - lib/data
        . connection to server

        step by step
        1. model => response model => reperensati dari request dan respon API (Quicktype sofware)
            . create response model

        2. datasource => dari server
            . create remote datasouce, domain dari backend
            . install dartz untuk handle response API untuk kondisi success dan failed
                - either for kondisi left = error right = success

            . if install package sqflite for data local by phone database local in device
                -   sqflite: ^2.3.2


        3. BLoC state managemnt = peraantara UI dengan data
            . install flutter bloc
            . install bloc
                - create new bloc
                - connet to breezed aautomaitc
                    -  update bloc event, state
                    . running for build => flutter pub run build_runner build --delete-conflicting-outputs (for genreate bloc)
                    . if running for watch => flutter pub run build_runner watch --delete-conflicting-outputs (for genreate bloc) run setiap pakai

                    - create / update bloc bloc
                        . create clas svariable =>  final AuthRemoteDatasource authRemoteDatasource;
                        . geerate cuntrostor for create variable
                        . fold sintak untuk mengelurkan dari Either

                - Regiter flutter BLoC login in Main.dart
                    . inject flutter bloc in materialapp in main
                    . BlocProvider
                        - bloc layer
                        - AuthRemoteDatasource
                    . initilaisasi flutter bloc in pages
                        - BlocBuilder
                        - Bloc listener  for next to pages or layer or view button or view pop up 
                    
                    . local datasiuce
                        - instal  shared_preferences: ^2.2.2
                        -   save local
                            remove data local by key (auth_data)
                            logout in local
                            cek auth data exists check by key
                        - simpan di position login succcess in first
                            .  AuthLocalDataSource().saveAuthData(authResponseModel);

        4. add BLoc to main in blocprovider





Library Flutter
    carousel_slider: ^4.2.1
    cupertino_icons: ^1.0.2
    # google_font
    google_fonts: ^6.0.1
    #lottie
    lottie: ^2.7.0
    dartz: ^0.10.1
    esc_pos_utils_plus: ^2.0.3
    flutter_bloc: ^8.1.3
    flutter_svg: ^2.0.9
    freezed: ^2.4.6
    freezed_annotation: ^2.4.1
    google_fonts: ^6.1.0
    http: ^1.2.0
    image_picker: ^1.0.4
    intl: ^0.18.1
    print_bluetooth_thermal: ^1.0.9
    qr_flutter: ^4.1.0
    shared_preferences: ^2.2.2
    // flutter gen for generate image
    flutter_gen:
        output: lib/core/assets/
        integrations:
            flutter_svg: true

flutter pub get -v
