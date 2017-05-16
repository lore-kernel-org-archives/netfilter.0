From: i.chudov@volga.ttk.ru
Subject: nf_conntrack_max values
Date: Tue, 16 May 2017 15:44:00 +0400
Message-ID: <OFDC21F1C1.C9EDFB23-ON44258122.003D4D7A-44258122.0040745E@volga.ttk.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello all!

I'm working for a small ISP and we have a questionable situation here.=20
Hope anybody will be able to help us.

We have a machine (one white IPv4) which does IPv4 masquerading for=20
clients in 192.168.0.0/16 subnetworks. Recently we noticed a growth of=20
/proc/net/nf_conntrack NAT translations table from about 5k lines to 40k=20
lines (30k translations to 1e100.net, port 5228). Okay, let the Google spy =

users, fine but the situation has raised the following questions:

# grep ESTABLISHED /proc/net/nf_conntrack | wc -l
29560
# sysctl net.ipv4.ip_local_port_range
net.ipv4.ip_local_port_range =3D 32768 61000=20
# bc
61000-32768
28232
# sysctl net.netfilter.nf_conntrack_max
net.netfilter.nf_conntrack_max =3D 65536

1) How is that possible that number of ESTABLISHED connections is greater=20
than ephemeral post range?
2) Is net.ipv4.ip_local_port_range used for NAT translations?
3) I found suggestions that net.netfilter.nf_conntrack_max might be=20
greater than local port range count (greater than 65536). How the new=20
connections will be established in that case and is it even possible to=20
set it greater than 65536?

# cat /proc/net/nf_conntrack | awk '{print $9}' | grep sport=3D1
sport=3D1425
sport=3D1341
sport=3D1086

And no other ports below the 32768 value.

4) So, how is it possible for the system to use ports below 32768 in that=20
case?
5) Is there any way to see the entries in conntrack _expectations_ table?

Any help will be appreciated.

P. S.: I'm sorry if any HTML will leak. Lotus is really awful.
--
With best regards/Mit freundlichen Gr=FC=DFen, Igor Chudov
TransTelecom-Volga JSC, Russian Federation
Leading Engineer/Network Maintainance Department,
Tel. (24/7/365): +7 937 266-51-34
