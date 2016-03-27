From: Kris <soulkris@gmail.com>
Subject: Fwd: NAT cgroup not working after cgclassify?
Date: Mon, 28 Mar 2016 00:41:37 +0200
Message-ID: <CAApZ_xBrtQM7D3QxxniWHk8RCPWeyq5xh0ZDFTw7w-EE=HwZOw@mail.gmail.com>
References: <CAApZ_xC4wNoouqFfa8R8u+Do_mfwtg523oakvih_Gj08Lf_9xg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to;
        bh=tXWkzGBdy41nmtAMxFeCniXPuE/v4W0iG4AgahwS1HA=;
        b=hrgcMYQCK4YgS97eWA9c8ChniVtNvXFYbUoxd6L9qk2lfxjszHfkoW2Vkt3+BevY+9
         XQ0/UKXa0H/ZaxUXF5GjJ43Swx4PVJtF8TFH6PQ8i0sm/Sq10l8t1YI6X74wlbtNmqYJ
         K2QO22WtMJT1v9uivE8q6j0sw4f/1MHwvAtqKN99+Mqgd1oT5Hy5xrkNKOXibfiqnXzq
         p2FjTO8w5xCBMV4A4SVLkAUx2z1kj9BVV8mkrhNM9g46r8wQOQ4GJxefncrJsL20OrZR
         9G9+zpBPC+aR3lf8jTtTbhY5edqBuZP/tMfQC7jVyvKVZEhj3ooQDAhKkaTLERryiAgT
         jqKg==
In-Reply-To: <CAApZ_xC4wNoouqFfa8R8u+Do_mfwtg523oakvih_Gj08Lf_9xg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I'm trying to bypass OpenVPN tunnel (with --redirect-gateway enabled)
for specific processes.
I've described a solution here: http://serverfault.com/a/761780/341010

In summary, that's what I do:
- Assign the process to a Linux net_cls control group
- Mark the trafic with iptables, based on control group classid:
iptables -t mangle -A OUTPUT -m cgroup --cgroup 0x00110011 -j MARK --set-mark 11
- Route the marked trafic on a routing table with a default gateway to
the real (non-tunnel) interface
- NAT the output IP of the trafic with iptables, based on control group classid:
iptables -t nat -A POSTROUTING -m cgroup --cgroup 0x00110011 -o eth0
-j MASQUERADE
- Disable reverse path filtering

It works well for processes started directly on the control group:
cgexec -g net_cls:novpn ping www.google.com

However, if a process is moved to the control group, it stops working:
ping www.google.com
echo $(pidof ping) > /sys/fs/cgroup/net_cls/novpn

Unlike the MANGLE rule, the NAT rule doesn't match anymore.
Hence, the trafic exits with the bad (tunnel) IP...

Any help appreciated.
Even if you have other better ways to reach the same goal.

Regards,
Kris
