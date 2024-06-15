/*
 * Copyright The OpenTelemetry Authors
 * SPDX-License-Identifier: Apache-2.0
 */

import Foundation

public class MillisClock: Clock {
    ///  Returns a MillisClock
    public init() {}

    public var now: Date {
        return Date()
    }
}
