const std = @import("std");

fn Different(comptime T: type, comptime uniq: type) type {
    _ = uniq;
    return @Type(@typeInfo(T));
}

const A = struct {
    a: u32,

    // pub fn inc(self: @This()) @This() {
    //     return @This(){
    //         .a = self.a + 1,
    //     };
    // }
};
const Thing = struct {};
const B = Different(A, Thing);
const C = Different(A, struct {});

const Q = struct {
    a: u32,

    pub fn inc(self: @This()) @This() {
        return @This(){
            .a = self.a + 1,
        };
    }
};
const R = struct {
    a: u32,

    pub fn onc(self: @This()) @This() {
        return @This(){
            .a = self.a + 1,
        };
    }
};

pub fn main() anyerror!void {
    // std.log.info("Equal? {}", .{B == C});
    // std.log.info("A,B,C: {}, {}, {}", .{ A, B, C });
    var b = B{ .a = 42 };
    var a = @ptrCast(*A, &b);
    std.log.info("a val {}", .{a});
}
