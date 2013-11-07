From: Jim Mellander <jmellander@lbl.gov>
Subject: iptables as landmine subnet rejector
Date: Thu, 7 Nov 2013 15:14:28 -0800
Message-ID: <CADju=b7zs7uGryLgM-R9_zSohh7Vknr52LL75Xx28dQyeEXgGw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all:

I'm working on replacing a freebsd box with custom C code with a linux box.

The code has a configured pcap filter, and does the following with
traffic that matches the pcap filter.  BTW, the pcap filter is not
complex, basically 'tcp and (net a.b.c.d/xx or net e.f.g.h/xx)', so
the equivalent should be easily mappable to iptables rules.

1. If TCP sends RST back as response (obviously not RST in response to RST)
2. Responds to pings, ICMP echo response sent in response to icmp echo request.

I starting porting the code, but it occurred to me that perhaps the
entire job could be done in iptables using DNAT

1. Nat the tcp connection and issue a -j REJECT, or redirect to a
closed port on the the responder host, which will send a RST.
2. NAT the icmp echo request

With a bit of experimentation, I'm fairly certain I could work this
out, but some pointer to get me in the right direction would be
appreciated.

Thanks in advance.
