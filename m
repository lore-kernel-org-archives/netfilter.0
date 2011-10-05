From: "Netravali Ganesh" <gnetravali@sonusnet.com>
Subject: How to block ssh on specific ethernet interface
Date: Wed, 5 Oct 2011 09:54:10 +0530
Message-ID: <A5D3AC0FAABBF34A9FD613C14AAC59B71F8AFF@sonusinmail02.sonusnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi..

I have multiple Ethernet =A0interface on the system. I need to enable t=
he ssh on eth0 and block the ssh on all the other interfaces. Below is =
the iptables rules I am using. This is not working form pls lls let me =
know what is wrong. I am using RHEL6.1 system.

=A0[root@localhost ~]# iptables -A INPUT -i eth1 -p tcp -m tcp --dport =
22 -j DROP
=A0[root@localhost ~]# iptables -L -v -n
Chain INPUT (policy ACCEPT 40 packets, 5240 bytes)
=A0pkts bytes target=A0=A0=A0=A0 prot opt in=A0=A0=A0=A0 out=A0=A0=A0=A0=
 source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 destination
=A0=A0=A0 0=A0=A0=A0=A0 0 DROP=A0=A0=A0=A0=A0=A0 tcp=A0 --=A0 eth1=A0=A0=
 *=A0=A0=A0=A0=A0=A0 0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0.0.0.0=
/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tcp dpt:22

Thanks
Ganesh

