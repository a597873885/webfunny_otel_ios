# Webfunny RUM agent for iOS

The Webfunny RUM agent for iOS provides a Swift package that captures:

- HTTP requests, using `URLSession` instrumentation
- Application startup information
- UI activity - screen name (typically ViewController name), actions, and PresentationTransitions
- Crashes/unhandled exceptions using [webfunny_otel_ios_crashreporting](https://github.com/a597873885/webfunny_otel_ios_crashreporting)

> :construction: This project is currently in **BETA**. It is **officially supported** by Webfunny. However, breaking changes **MAY** be introduced.

## Requirements

Webfunny RUM agent for iOS supports iOS 11 and higher, including iPadOS 13 and higher.
