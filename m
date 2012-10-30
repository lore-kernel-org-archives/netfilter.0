From: valerio balbi <valerio.balbi@gmail.com>
Subject: SYNACK not generated
Date: Tue, 30 Oct 2012 14:21:15 +0100
Message-ID: <CABA9q+Pa8eaGnYxfxqFnOvp9WCFPGEshG4Cb4JwXHqtmMvjJ=w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=3TGQHoMZJ+UVStBk3xxC7stjIdw2x5nHJZmsEQvHM/w=;
        b=L94y+Icbb/OmxEOE26YkrYy9ManvIHtMhCXeXINKPd6rOTmlNrWIUQDo2s/JmMqKCR
         Q3v+pjeyy7ZjJhEJX13kIfzoUWet6bawLjZGZWULpyzlqDGgymjqkhpqhAAwcjgpnM+N
         IIaFYOKhH6axpxp/M0MokPbJYyJmzBxm2tF3bTMtHldaJ6vUcWdl9i3ZRITTHaifS0Qk
         yQgzQ92F2Vh+RsOI/YkPpTGM0CflgVMTixMUfZj8Gci9gO/qv6APnRyXlnRQq4ykF1wO
         khYWMTkPlEOuZlPlD0gzi/y/jypBPnXWvUKFrhW+tHcVaI0qcCFFGFyXgwsO9FvN17i9
         RKzg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I noticed a strange behaviour on my linux box
My linux box is located inside a campus network topology
My linux box have a local ip ipA and everyone located in a logical
campus network
can happily create a socket to tcp port 22 and 10040.
My linux box have 2 nic configurated (eth0 and eth1) but the only gw configured
is on eth0 in the same network class of ipA.

This machine need also to be reached through a destination nat appliance
Outside the campus my linux box is seen as ipB
But, in this env I can't be able to connect to port 22 or 10040.

Well, my friend tcpdump running on all the interfaces can only show
the SYN packets.
The destination ip is correctly changed in ipA, but the stack seems
to NOT generate the SYNACK packet expected.

Can someone help me?

than's in advance.
