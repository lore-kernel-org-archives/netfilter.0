From: shawn wilson <ag4ve.us@gmail.com>
Subject: Hardware benchmark list (was: Recommended hardware for iptables based firewall/router)
Date: Sun, 9 Nov 2014 15:39:35 -0500
Message-ID: <CAH_OBic9zg25y16HKhkHqBCvujrHXoGhb8E4tY+Z99CO0WrEAw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=RTUdwYByMQUk8szAbL/HJi3hJSIsT78Up1c8uH1aR7M=;
        b=HvHKeg21Cr7iZiQz6EiYVjVpvj3zkXRioxjGEB7f8nH3gFskXuwWEGer3HRZRgiGsh
         iMtpL55CGq2DIhV3dbkNO77axNlmTZBltxjZ2H7k5QIkDDZJ6OT4zJJ0NxtEOBitv2dI
         cw9O5xUWFhLbVYeTZ8zbg8z0urZvDrIMqA7Jdj/GlIUpkbppc6huOPZYg7Q0zZtBAwsc
         ggXrjxjGJe/iI45yEKGK3M7iSOcoTrJmKMEul8CRHE5lGc/sBOEiBb1KL22/H/eioXUG
         N5mtd9/gvlBGZr5hUTkBjZQcwstRGS1gyziejSddpIYxNnZ03VMH93OEJmyep5bsvvtB
         3bzg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

(I include the original email subjec to show what spawned this)

What would be cool is to have a hardware benchmark list for network
cards and processors (similar to JTR's list for hashes per second
[1]).

What I've been thinking for a while is how to benchmark network
hardware. Obviously there's issues with doing this and in order for
this to work everyone would need to be on the same page (or there'd
need to be a link showing settings used that someone could revise if
they found something that was off).

I think the biggest issue with this idea is figuring out affordable
hardware to test cards with. I'm unsure if this is possible so just
figured I'd throw this out there. Though since most machines have two
stacked interfaces, a decent benchmark might just be to plug one
interface into the other as that should shoe hardware noise issues,
PCI bus limitations (on that board), and driver issue.

1. http://openwall.info/wiki/john/benchmarks
