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

struct ContentView: View {
    func networkRequest() {
        print("network (req)!")
        let url = URL(string: "http://127.0.0.1:7878/data")!
        var req = URLRequest(url: url)
        req.httpMethod = "HEAD"
        let task = URLSession.shared.dataTask(with: req) {(data, _: URLResponse?, _) in
            guard let data = data else { return }
            print("got some data")
            print(data)

        }
        task.resume()
    }
    func downloadRequest() {
        print("download!")
        let url = URL(string: "https://www.webfunny.com")!
        var req = URLRequest(url: url)
        let task = URLSession.shared.downloadTask(with: url) {(_: URL?, _: URLResponse?, _) in
            print("download finished")
        }
        task.resume()
    }
    func hideKeyboard() {
        print("hideKeyboard")
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

    }

    func throwy() {
        NSException(name: NSExceptionName(rawValue: "IllegalFormatError"), reason: "Could not parse input", userInfo: nil).raise()
        print("should not reach here")
    }
    func throwyBackgroundThread() {
        DispatchQueue.global(qos: .background).async {
            NSException(name: NSExceptionName(rawValue: "IllegalFormatError"), reason: "Could not parse input", userInfo: nil).raise()
        }
    }
    func hardCrash() {
        let null = UnsafePointer<UInt8>(bitPattern: 0)
        let derefNull = null!.pointee
    }

    @State var text = ""
    @State var toggle = true
    @State var isShowingModal = false

    var body: some View {
        VStack {
            Button(action: {
                self.throwy()
            }) {
                Text("测试exception崩溃!")
            }
            Button(action: {
                self.throwyBackgroundThread()
            }) {
                Text("测试后台线程崩溃!")
            }
            Button(action: {
                self.hardCrash()
            }) {
                Text("测试崩溃越界")
            }
            Button(action: {
                self.networkRequest()
            }) {
                Text("测试网络请求!")
            }
            Button(action: {
                self.downloadRequest()
            }) {
                Text("测试下载")
            }
        }
        HStack {
            TextField("输入文字", text: $text)
                .padding()
                .keyboardType(.numberPad)
            Button(action: self.hideKeyboard, label: {
                Text("确定")
            })
        }
        HStack {
            // Perhaps add a button to dismiss it
            Button("present新页面") {
                isShowingModal.toggle()
            }.sheet(isPresented: $isShowingModal, content: {
                VStack {
                    Text("标题")
                    Text("描述")
                    Button("关闭") {
                        isShowingModal.toggle()
                    }
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
