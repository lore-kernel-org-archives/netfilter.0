From: =?iso-8859-1?Q?DSI=2ENET_-_Arvid_Z=F6bisch?= <zoebisch@dsi.net>
Subject: ip accounting with centos 6
Date: Wed, 28 Sep 2011 12:06:44 +0200
Message-ID: <509ABFBD82E8B740BC211E8B93E28F71B2475F5A55@server2.dsi.intra>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi there. 

I have a problem on a centos 6 server running KVM. I want to account traffic per IP. I am using the same rules on an Ubuntu 10.04 LTS-Server where my accounting is working.  
These are my rules: 


iptables -N INET_OUT
iptables -N INET_IN
iptables -A FORWARD -j INET_IN
iptables -A FORWARD -j INET_OUT

/sbin/iptables -A INET_OUT -s x.x.x.x
/sbin/iptables -A INET_IN -s 0.0.0.0/0 -d x.x.x.x

Kernel is 2.6.32.x86_64
iptables is v 1.4.7

Thank you in advance
Arvid
