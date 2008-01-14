From: sa@streaming-networks.com
Subject: iptables
Date: Mon, 14 Jan 2008 12:45:56 +0500
Message-ID: <053001c85681$7f96ac50$5505a8c0@stream.net>
References: <25397.63399.qm@web51912.mail.re2.yahoo.com> <Pine.LNX.4.58.0801132243230.5870@mail3.jubileegroup.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


i am planning to setup an internet gateway machine (for my LAN having
private LAN IP address scheme) with proxy server so that all web traffic
goes through it.
plus need to allow internal LAN machine, some limited ports to access
outside the LAN (e.g POP3, DNS, SMTP, FTP etc).

how should i setup iptables to accomplish this?

probably NAT and/or forwading need to implemented, but in which sequence? or
am i mixing them?



