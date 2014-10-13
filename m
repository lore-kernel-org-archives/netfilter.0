From: =?UTF-8?Q?Rapha=C3=ABl_Berlamont?= <raphael.berlamont@raphux.com>
Subject: conntrack-tools[]: can't get kernel conntrack table
Date: Mon, 13 Oct 2014 18:37:07 +0200
Message-ID: <CANNOT2BvZxngo7=OY8_vrHEVTuadqhSs3dL=oUSPZs+x+r4N3g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello list,

I can't make conntrack-tool work on my system.
Tried with vanilla kernels 2.6.39.4, 3.0.99, 3.6.11.

I compiled/install those tools/libs :
- libnetfilter_queue/libnetfilter_queue-1.0.2
- libnfnetlink/libnfnetlink-1.0.1
- libmnl-1.0.3
- libnetfilter_cttimeout-1.0.0
- libnetfilter_cthelper-1.0.0
- libnetfilter_conntrack-1.0.4
- conntrack-tools-1.4.2

My kernel config is available here :
http://pastebin.com/8tjVuRVT

My conntrackd config :
http://pastebin.com/wLZF3TZ9

When I launch conntrackd, I have the following message in the log :
-----
[Mon Oct 13 16:49:20 2014] (pid=3D5388) [ERROR] can't get kernel conntr=
ack table
-----

I don't know what to do now=E2=80=A6 I tried to read the sources, but I=
'm not
fluent with C, at-all.

As you'll see in the kernel configuration, allmost all *CONN* options
were enabled.

Any idea ? Anyone ?
--=20
Rapha=C3=ABl Berlamont
