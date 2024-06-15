/*
Copyright 2021 Splunk Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import SwiftUI
import webfunny_otel_ios
import webfunny_otel_ios_crashreporting

@main
struct TestAppApp: App {
    init() {
        SplunkRumBuilder(beaconUrl: "https://cloud.webfunny.com/wfMonitor/otel/trace", rumAuth: "")
            .allowInsecureBeacon(enabled: true)
            .debug(enabled: true)
            .globalAttributes(globalAttributes: 
                                ["userId": "手机号",
                                 "userTag": "用户表情",
                                 "projectVersion": "0.0.1",
                                 "env": "dev、pro",
                                 "customrKey": "生成内置id(uuid)"])
            .enableDiskCache(enabled: true)
            .setApplicationName("TestApp")
            .build()
        
        // Initialize crash reporting module after the iOS agent
        SplunkRumCrashReporting.start()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
