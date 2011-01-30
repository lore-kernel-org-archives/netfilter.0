From: Jim Webster <jwebster@ilstechnology.com>
Subject: DCERPC - does an add-on exist for netfilter
Date: Sun, 30 Jan 2011 12:07:50 +0100
Message-ID: <AANLkTimMiM=NWeDvhPn_wKfab_sta89wxffMPcX2hMSO@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi.=A0 I am new to the list and also fairly new to iptables and
netfilter.=A0 Linux and programming - am familiar with.
Have been tasked to provide a way to move MSMQ (DCERPC?) traffic thru
our firewall.
The firewall is a CentOS iptables based box.

Unfortunately, I do not zet have the customer Wireshark trace showing
the traffic, specificallz where the=A0 address (and port) is supposedlz
sent in the pazload.

A knowledgeable iptables/firewall person on our team has suggested we
require a netfilter helper routine (ala the ftp connection tracking).

It seems to me however that instead, some tzpe of adaptive firewall
technique is required to do this - opening a new NAT for the IP/port
sent in the pazload and closing it when done.

If so, can this be done by a simple user app - perhaps a proxy, or
should it be in the loadable kernel modules as the ftp connection
tracker is?

Have been unable to find verz much info on this zet - altho I see
references to some commercial firewalls (e.g. Cisco 5500) doing this.

Is this something that has been done already with netfilter or will I
be blazing a new trail?

Pls excuse the mixing of the y and z, am using a German computer in Ger=
many.

Thank zou verz much,

Jim
