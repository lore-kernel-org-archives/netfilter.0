From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: NAT help needed
Date: Thu, 2 Oct 2003 09:34:51 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A019344@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: sathishnet@hotmail.com, netfilter@lists.samba.org

if you want round robin then use DNS (only if DNS lookups are used eg. =
www.yourdomain.com ).

You will need to assign all IPs to eth0 or you can HOST route all the =
available IPs to go to your eth0 IP if you unfortunately have a router =
in front of you, this makes it easier to managed since you don't have to =
worry about adding heaps of IPs to your external NIC..

If you want IP round robin then you'll need to use the patch-o-matic =
module called "nth" patch. Though I haven't seen much success with this =
as someone had problems getting it working..

Here's a snippet of his email and rules he was TRYING to get working...


<snip>
iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source =
<ppp0-ip-addr>
iptables -t nat -A POSTROUTING -o ppp1 -j SNAT --to-source =
<ppp1-ip-addr>
iptables -t nat -A POSTROUTING -o ppp2 -j SNAT --to-source =
<ppp2-ip-addr>
iptables -t nat -A POSTROUTING -o ppp3 -j SNAT --to-source =
<ppp3-ip-addr>

iptables -t mangle -A PREROUTING -m nth --every 4 --packet 1 -m state =
--state new  -j CONNMARK --set-mark 1
iptables -t mangle -A PREROUTING -m nth --every 4 --packet 2 -m state =
--state new  -j CONNMARK --set-mark 2
iptables -t mangle -A PREROUTING -m nth --every 4 --packet 3 -m state =
--state new  -j CONNMARK --set-mark 3
iptables -t mangle -A PREROUTING -m nth --every 4 --packet 0 -m state =
--state new  -j CONNMARK --set-mark 4

iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 1 -m state =
--state new  -j CONNMARK --set-mark 1
iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 2 -m state =
--state new  -j CONNMARK --set-mark 2
iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 3 -m state =
--state new  -j CONNMARK --set-mark 3
iptables -t mangle -A OUTPUT     -m nth --every 4 --packet 0 -m state =
--state new  -j CONNMARK --set-mark 4

iptables -t mangle -A POSTROUTING -m connmark --mark 1 -j ROUTE --oif =
ppp1
iptables -t mangle -A POSTROUTING -m connmark --mark 2 -j ROUTE --oif =
ppp2
iptables -t mangle -A POSTROUTING -m connmark --mark 3 -j ROUTE --oif =
ppp3
iptables -t mangle -A POSTROUTING -m connmark --mark 4 -j ROUTE --oif =
ppp0
</snip>



Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: Sathish Net [mailto:sathishenet@yahoo.com]
Sent: Tuesday, 30 September 2003 7:33 PM
To: netfilter@lists.samba.org
Subject: NAT help needed


Hello Sir,

I have installed REDHAT LINUX 9.0. I want to do
NATTING. We are having the leased line from our ISP.
Our ISP provider has assgined 12 IP Address for our
office use. I want to do NATTING.=20

I have installed 2 NIC in the LINUX system. eth0 and
eth1. I assigned the eth0 to the ISP provider and eth1
- for our LAN addres. (Internal)

Now i want to do like eth0 is for ISP provider link.
(in that i want to nat 12 ip address like
203.129...... .......) it should work like round robin
in that 12 ip address.

How to do ???

Thanking you,

Looking forward to a favorable response.

With regards,

Sathish



=3D=3D=3D=3D=3D

=20

=20

=20

 Sathish

=20


__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com


