From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: verifying set-mark
Date: Sat, 23 Feb 2008 20:23:59 +0100
Message-ID: <00cb01c87651$a432f290$ec98d7b0$@info>
References: <1203720563.27608.55.camel@grateful.d.umn.edu> <25498998.61203790461346.JavaMail.root@tomcat.phantombsd.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <25498998.61203790461346.JavaMail.root@tomcat.phantombsd.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> Is there a way with tcpdump to verify that the marks are actually
> getting set though?

However, I was under the impression that tc is able to use the flags set by iptables.

Man tc:

tc filters
If  tc  filters are attached to a class, they are consulted first for relevant instructions. Filters can match on all fields of a packet header, as well as on the firewall mark applied by ipchains or iptables.
See tc-filters(8).

Now, I don't seem to have a man page for tc-filters, I can't find it on the internet, nor can I find it in the source (I looked in iproute2-2.6.19-061214), so I'm afraid nobody's got it which makes this a dead end.

There surely must be examples around that show how to work with tc and iptables' mark. Perhaps this will get you going: http://www.szabilinux.hu/bandwidth/index.html


Grts,
Rob


