From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Netfilter meets PBR - I'm starting to tear my hairs out...
Date: Fri, 13 Aug 2004 00:46:26 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90641DA@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C480F0.FD094FDF"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: hps@intermeta.de, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C480F0.FD094FDF
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

i think this is a known issue that appeared in 2.4.23--check out:

http://lists.netfilter.org/pipermail/netfilter-devel/2004-January/013687.=
html

for more details...

and here:

http://seclists.org/lists/linux-kernel/2004/Jan/2211.html

for an apparent fix: using MARK in mangle, and fwmark in your ip rules.

HTH...

-j

-----Original Message-----
From: netfilter-admin@lists.netfilter.org on behalf of Henning =
Schmiedehausen
Sent: Thu 8/12/2004 6:33 AM
To: netfilter@lists.netfilter.org
Subject: Netfilter meets PBR - I'm starting to tear my hairs out...
=20
Hi,

I have a question concerning the interaction between iptables and
iproute2. I seem to miss some crucial point in the concepts... Let me
explain:

I have a router with four interfaces:


ppp0  - 	DSL uplink with dynamic IP address
eth0  - 	regular uplink with fixed IP address
eth1  -		network with official ip addresses
eth2  -		network with private addresses and official
                addreses

The idea is now that everything that has an official ip address
is routed through the eth0 link (the addresses are from the range of
this ISP) and the private addresses are NATed and routed through ppp0.

for illustration:

ppp0:	dynamic
eth0:	100.100.100.1/30
eth1:	100.100.101.1/24
eth2:	100.100.102.1/24
	192.168.8.1/24

This is a regular Fedora Core 1 box with all updates installed. It
reports itself as

Linux router 2.4.22-1.2199.nptl #1 Wed Aug 4 12:21:48 EDT 2004 i686 i686 =
i386 GNU/Linux

I use iptables-1.2.9-1.0 and iproute-2.4.7-13.2 as delivered by the =
Fedora Project.

I did the following thing with /sbin/iproute

# /sbin/ip route show
<DSL Provider Address> dev ppp0  proto kernel  scope link  src <dynamic =
DSL address>

100.100.100.1/30 dev eth0  scope link
100.100.101.1/24 dev eth1  scope link
100.100.102.1/24 dev eth2  scope link
192.168.8.0/24 dev eth2  proto kernel  scope link  src 192.168.8.1
127.0.0.0/8 dev lo  scope link
default via 100.100.100.2 dev eth0

Now I added PBR:

echo "200 VLAN2" >> /etc/iproute2/rt_tables

/sbin/ip route add default dev ppp0 table VLAN2
/sbin/ip rule add from 192.168.8.0/24 table VLAN2

which seems to work:

/sbin/ip route list table VLAN2
default dev ppp0  scope link

/sbin/ip rule list
0:      from all lookup local
32765:  from 192.168.8.0/24 lookup VLAN2
32766:  from all lookup main
32767:  from all lookup default

When I ping from a host attached to eth2:

# tcpdump -i eth0
100.100.102.2 > internet_host: icmp: echo request
internet_host > 100.100.102.2: icmp: echo reply
100.100.102.2 > internet_host: icmp: echo request
internet_host > 100.100.102.2: icmp: echo reply

# tcpdump -i ppp0
192.168.8.2 > internet_host: icmp: echo request
192.168.8.2 > internet_host: icmp: echo request

(obviously no answer yet)

Now I add masquerading:

/sbin/iptables  -t nat -A POSTROUTING -o ppp0  -s 192.168.8.0/24 -j =
MASQUERADE
/sbin/iptables  -t nat -A POSTROUTING -j ACCEPT

After this, there is silence on ppp0. No more packets pass through the
link.

Instead, the kernel starts to spit out:

Aug 12 12:19:36 router kernel: MASQUERADE: Route sent us somewhere else.
Aug 12 12:19:41 router kernel: NET: 4 messages suppressed.
Aug 12 12:19:41 router kernel: MASQUERADE: Route sent us somewhere else.
Aug 12 12:19:46 router kernel: NET: 4 messages suppressed.
Aug 12 12:19:46 router kernel: MASQUERADE: Route sent us somewhere else.
Aug 12 12:19:51 router kernel: NET: 4 messages suppressed.
Aug 12 12:19:51 router kernel: MASQUERADE: Route sent us somewhere else.
Aug 12 12:19:56 router kernel: NET: 4 messages suppressed.
Aug 12 12:19:56 router kernel: MASQUERADE: Route sent us somewhere else.

The fun thing now is, that if I flush the chain again and do

/sbin/iptables  -t nat -A POSTROUTING -o ppp0 -s 192.168.8.0/24 -j SNAT =
--to-source=3D<dynamic DSL address>
/sbin/iptables  -t nat -A POSTROUTING -j ACCEPT

then the PBR works. I see the packets going out the ppp0 link:

# tcpdump -i ppp0
<dynamic dsl address> > internet_host: icmp: echo request
internet_host > <dynamic dsl address>: icmp: echo reply
<dynamic dsl address> > internet_host: icmp: echo request
internet_host > <dynamic dsl address>: icmp: echo reply

Unfortunately I cannot use this in production, because the link will
have to go up and down and I cannot rewrite the configuration scripts
(which use masquerade).

So, what am I doing wrong? As far as I can understand, the MASQUERADE
target is equal to the SNAT target, except that it takes the ip address
for NATing from the interface and tears down the connections if the
interface loses its link. Or not? Or have I simply stumbled over a well
known bug in the RedHat kernel (which seems to be 2.4.22 + lots of
patches from post-2.4.22)? Or am I just missing some concept that I need
to add to my tables?

I'd appreciate Cc'ing me as I am not a regular subscriber to this list.

	Regards
		Henning

--=20
Dipl.-Inf. (Univ.) Henning P. Schmiedehausen          INTERMETA GmbH
hps@intermeta.de        +49 9131 50 654 0   http://www.intermeta.de/
=20
RedHat Certified Engineer -- Jakarta Turbine Development  -- hero for =
hire
   Linux, Java, perl, Solaris -- Consulting, Training, Development

"Fighting for one's political stand is an honorable action, but re-
 fusing to acknowledge that there might be weaknesses in one's
 position - in order to identify them so that they can be remedied -
 is a large enough problem with the Open Source movement that it
 deserves to be on this list of the top five problems."
                       --Michelle Levesque, "Fundamental Issues with
                                    Open Source Software Development"




------_=_NextPart_001_01C480F0.FD094FDF
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DISO-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.7226.0">
<TITLE>RE: Netfilter meets PBR - I'm starting to tear my hairs =
out...</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>i think this is a known issue that appeared in =
2.4.23--check out:<BR>
<BR>
<A =
HREF=3D"http://lists.netfilter.org/pipermail/netfilter-devel/2004-January=
/013687.html">http://lists.netfilter.org/pipermail/netfilter-devel/2004-J=
anuary/013687.html</A><BR>
<BR>
for more details...<BR>
<BR>
and here:<BR>
<BR>
<A =
HREF=3D"http://seclists.org/lists/linux-kernel/2004/Jan/2211.html">http:/=
/seclists.org/lists/linux-kernel/2004/Jan/2211.html</A><BR>
<BR>
for an apparent fix: using MARK in mangle, and fwmark in your ip =
rules.<BR>
<BR>
HTH...<BR>
<BR>
-j<BR>
<BR>
-----Original Message-----<BR>
From: netfilter-admin@lists.netfilter.org on behalf of Henning =
Schmiedehausen<BR>
Sent: Thu 8/12/2004 6:33 AM<BR>
To: netfilter@lists.netfilter.org<BR>
Subject: Netfilter meets PBR - I'm starting to tear my hairs out...<BR>
<BR>
Hi,<BR>
<BR>
I have a question concerning the interaction between iptables and<BR>
iproute2. I seem to miss some crucial point in the concepts... Let =
me<BR>
explain:<BR>
<BR>
I have a router with four interfaces:<BR>
<BR>
<BR>
ppp0&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DSL uplink with =
dynamic IP address<BR>
eth0&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; regular uplink =
with fixed IP address<BR>
eth1&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; network with =
official ip addresses<BR>
eth2&nbsp; - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; network with =
private addresses and official<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; addreses<BR>
<BR>
The idea is now that everything that has an official ip address<BR>
is routed through the eth0 link (the addresses are from the range of<BR>
this ISP) and the private addresses are NATed and routed through =
ppp0.<BR>
<BR>
for illustration:<BR>
<BR>
ppp0:&nbsp;&nbsp; dynamic<BR>
eth0:&nbsp;&nbsp; 100.100.100.1/30<BR>
eth1:&nbsp;&nbsp; 100.100.101.1/24<BR>
eth2:&nbsp;&nbsp; 100.100.102.1/24<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 192.168.8.1/24<BR>
<BR>
This is a regular Fedora Core 1 box with all updates installed. It<BR>
reports itself as<BR>
<BR>
Linux router 2.4.22-1.2199.nptl #1 Wed Aug 4 12:21:48 EDT 2004 i686 i686 =
i386 GNU/Linux<BR>
<BR>
I use iptables-1.2.9-1.0 and iproute-2.4.7-13.2 as delivered by the =
Fedora Project.<BR>
<BR>
I did the following thing with /sbin/iproute<BR>
<BR>
# /sbin/ip route show<BR>
&lt;DSL Provider Address&gt; dev ppp0&nbsp; proto kernel&nbsp; scope =
link&nbsp; src &lt;dynamic DSL address&gt;<BR>
<BR>
100.100.100.1/30 dev eth0&nbsp; scope link<BR>
100.100.101.1/24 dev eth1&nbsp; scope link<BR>
100.100.102.1/24 dev eth2&nbsp; scope link<BR>
192.168.8.0/24 dev eth2&nbsp; proto kernel&nbsp; scope link&nbsp; src =
192.168.8.1<BR>
127.0.0.0/8 dev lo&nbsp; scope link<BR>
default via 100.100.100.2 dev eth0<BR>
<BR>
Now I added PBR:<BR>
<BR>
echo &quot;200 VLAN2&quot; &gt;&gt; /etc/iproute2/rt_tables<BR>
<BR>
/sbin/ip route add default dev ppp0 table VLAN2<BR>
/sbin/ip rule add from 192.168.8.0/24 table VLAN2<BR>
<BR>
which seems to work:<BR>
<BR>
/sbin/ip route list table VLAN2<BR>
default dev ppp0&nbsp; scope link<BR>
<BR>
/sbin/ip rule list<BR>
0:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from all lookup local<BR>
32765:&nbsp; from 192.168.8.0/24 lookup VLAN2<BR>
32766:&nbsp; from all lookup main<BR>
32767:&nbsp; from all lookup default<BR>
<BR>
When I ping from a host attached to eth2:<BR>
<BR>
# tcpdump -i eth0<BR>
100.100.102.2 &gt; internet_host: icmp: echo request<BR>
internet_host &gt; 100.100.102.2: icmp: echo reply<BR>
100.100.102.2 &gt; internet_host: icmp: echo request<BR>
internet_host &gt; 100.100.102.2: icmp: echo reply<BR>
<BR>
# tcpdump -i ppp0<BR>
192.168.8.2 &gt; internet_host: icmp: echo request<BR>
192.168.8.2 &gt; internet_host: icmp: echo request<BR>
<BR>
(obviously no answer yet)<BR>
<BR>
Now I add masquerading:<BR>
<BR>
/sbin/iptables&nbsp; -t nat -A POSTROUTING -o ppp0&nbsp; -s =
192.168.8.0/24 -j MASQUERADE<BR>
/sbin/iptables&nbsp; -t nat -A POSTROUTING -j ACCEPT<BR>
<BR>
After this, there is silence on ppp0. No more packets pass through =
the<BR>
link.<BR>
<BR>
Instead, the kernel starts to spit out:<BR>
<BR>
Aug 12 12:19:36 router kernel: MASQUERADE: Route sent us somewhere =
else.<BR>
Aug 12 12:19:41 router kernel: NET: 4 messages suppressed.<BR>
Aug 12 12:19:41 router kernel: MASQUERADE: Route sent us somewhere =
else.<BR>
Aug 12 12:19:46 router kernel: NET: 4 messages suppressed.<BR>
Aug 12 12:19:46 router kernel: MASQUERADE: Route sent us somewhere =
else.<BR>
Aug 12 12:19:51 router kernel: NET: 4 messages suppressed.<BR>
Aug 12 12:19:51 router kernel: MASQUERADE: Route sent us somewhere =
else.<BR>
Aug 12 12:19:56 router kernel: NET: 4 messages suppressed.<BR>
Aug 12 12:19:56 router kernel: MASQUERADE: Route sent us somewhere =
else.<BR>
<BR>
The fun thing now is, that if I flush the chain again and do<BR>
<BR>
/sbin/iptables&nbsp; -t nat -A POSTROUTING -o ppp0 -s 192.168.8.0/24 -j =
SNAT --to-source=3D&lt;dynamic DSL address&gt;<BR>
/sbin/iptables&nbsp; -t nat -A POSTROUTING -j ACCEPT<BR>
<BR>
then the PBR works. I see the packets going out the ppp0 link:<BR>
<BR>
# tcpdump -i ppp0<BR>
&lt;dynamic dsl address&gt; &gt; internet_host: icmp: echo request<BR>
internet_host &gt; &lt;dynamic dsl address&gt;: icmp: echo reply<BR>
&lt;dynamic dsl address&gt; &gt; internet_host: icmp: echo request<BR>
internet_host &gt; &lt;dynamic dsl address&gt;: icmp: echo reply<BR>
<BR>
Unfortunately I cannot use this in production, because the link will<BR>
have to go up and down and I cannot rewrite the configuration =
scripts<BR>
(which use masquerade).<BR>
<BR>
So, what am I doing wrong? As far as I can understand, the =
MASQUERADE<BR>
target is equal to the SNAT target, except that it takes the ip =
address<BR>
for NATing from the interface and tears down the connections if the<BR>
interface loses its link. Or not? Or have I simply stumbled over a =
well<BR>
known bug in the RedHat kernel (which seems to be 2.4.22 + lots of<BR>
patches from post-2.4.22)? Or am I just missing some concept that I =
need<BR>
to add to my tables?<BR>
<BR>
I'd appreciate Cc'ing me as I am not a regular subscriber to this =
list.<BR>
<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Regards<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Henning<BR>
<BR>
--<BR>
Dipl.-Inf. (Univ.) Henning P. =
Schmiedehausen&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
INTERMETA GmbH<BR>
hps@intermeta.de&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +49 9131 50 =
654 0&nbsp;&nbsp; <A =
HREF=3D"http://www.intermeta.de/">http://www.intermeta.de/</A><BR>
<BR>
RedHat Certified Engineer -- Jakarta Turbine Development&nbsp; -- hero =
for hire<BR>
&nbsp;&nbsp; Linux, Java, perl, Solaris -- Consulting, Training, =
Development<BR>
<BR>
&quot;Fighting for one's political stand is an honorable action, but =
re-<BR>
&nbsp;fusing to acknowledge that there might be weaknesses in one's<BR>
&nbsp;position - in order to identify them so that they can be remedied =
-<BR>
&nbsp;is a large enough problem with the Open Source movement that =
it<BR>
&nbsp;deserves to be on this list of the top five problems.&quot;<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --Michelle =
Levesque, &quot;Fundamental Issues with<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Open =
Source Software Development&quot;<BR>
<BR>
<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C480F0.FD094FDF--

