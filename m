From: "tanuki" <phake@sadomain.co.za>
Subject: Wierd problem with irqs
Date: Tue, 13 Jul 2004 15:56:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <017901c468e1$2c7aeb80$3b7819c4@PHAKE>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0176_01C468F1.EFD42000"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0176_01C468F1.EFD42000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all


had an interresting problem the other day, just thought i'd share it =
with you all and see if=20
any body else had a similar experience.=20


I set up a small nat/firewall box for a client of ours. we had 5 =
interfaces and they were as follows=20

eth0   192.168.10.1 netmask 255.255.255.255 pointopoint 192.168.10.2   =
<--- adsl modem  doing nat=20
eth1   192.168.0.1 netmask 255.255.255.0=20
eth2   192.168.1.1 netmask 255.255.255.0
eth3   192.168.2.1 netmask 255.255.255.0
eth4    192.168.3.1 netmask 255.255.255.255 pointopoint 192.168.3.2 <-- =
some upstairs router=20

and the routing table looked like you would expect it to, with=20

route add default gw 192.168.10.1 dev eth0=20

also we had=20

echo "1" > /proc/sys/net/ipv4/ip_forward=20

for simplicity , iptables rules were as follows=20

iptables -t nat --append POSTROUTING -o eth0 --jump MASQUERADE=20

so, now all traffic using 192.168.0.1 , 1.1, 2.1 and 3.1 as a gateway =
should be able to reach the=20
internet via the modem on 192.168.10.2 , right ?=20

well, all icmp worked, perfectly=20

but everything else , ie , udp, tcp didn't=20

say for example http : packets get sent to tcp 80, tcp replies get =
recieved, but no data gets back to=20
the user on 192.168.whatever

strange huh ?=20

so i thought my mtu was befuqed, so i do=20

iptables --append FORWARD --proto tcp --tcp-flags SYN,RST SYN --jump =
TCPMSS --clamp-mss-to-pmtu=20

no luck though.=20

tried a plethora of other stuff too , but didn't work, so i'll leave =
that there=20

obviously the nat works, becuase all my icmp's are natted.=20
mmm

so i go into the boxes bios set up and tell it to assign irq's to all =
pci devices automatically=20

boot up into linux and do=20

ifconfig eth4 up=20

eth4: error fetching interface information: Device not found

eh ? wtf ? so i do ifconfig eth0 up=20

and the device gets brought up=20

then i do ifconfig eth4 up=20

and it brings it up . Strange huh ?=20

so now i see that all my cards are swopped arround. that which used to =
be eth0 is now eth4 and so=20
on and so on.=20

anyway, plug in the appropiate network cables to the relevant nics and =
run the script=20

to a ping to google.com ... everything works fine.=20
right, so far so good. right back were i started

now, do a HTTP-GET http://www.google.com and guess what=20
i get a lovely html page.=20

strange that changing the device irg assignment in the bios solved my =
problem ?=20

any ideas what could have caused this ?=20

thanks a lot for bearing with my idiotic ramblings so far=20

----------------

tanuki=20
























------=_NextPart_000_0176_01C468F1.EFD42000
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi all</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>had an interresting problem the other =
day, just=20
thought i'd share it with you all and see if </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>any body else had a similar experience. =

</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I set up a small nat/firewall box for a =
client of=20
ours. we had&nbsp;5 interfaces and they were as follows </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>eth0&nbsp;&nbsp; 192.168.10.1 netmask=20
255.255.255.255 pointopoint 192.168.10.2&nbsp;&nbsp; &lt;--- =
adsl&nbsp;modem=20
&nbsp;doing nat </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth1&nbsp;&nbsp;&nbsp;192.168.0.1 =
netmask=20
255.255.255.0 </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth2&nbsp;&nbsp; 192.168.1.1 netmask=20
255.255.255.0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth3&nbsp;&nbsp; 192.168.2.1 netmask=20
255.255.255.0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth4&nbsp;&nbsp;&nbsp; 192.168.3.1 =
netmask=20
255.255.255.255 pointopoint 192.168.3.2 &lt;-- some upstairs router=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>and the routing table looked like you =
would expect=20
it to, with </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>route add default gw 192.168.10.1 dev =
eth0=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>also we had </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>echo "1" &gt; =
/proc/sys/net/ipv4/ip_forward=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>for simplicity , iptables rules were as =
follows=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat --append POSTROUTING -o =
eth0 --jump=20
MASQUERADE </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>so, now all traffic using 192.168.0.1 , =
1.1, 2.1=20
and 3.1 as a gateway should be able to reach the </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>internet via the modem on 192.168.10.2 =
, right ?=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>well, all icmp worked, perfectly =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>but everything else , ie , udp, tcp =
didn't=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>say for example http : packets get sent =
to tcp 80,=20
tcp replies get recieved, but no data gets back to </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>the user on =
192.168.whatever</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>strange huh ? </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>so i thought my mtu was befuqed, so i =
do=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables --append FORWARD --proto tcp =
--tcp-flags=20
SYN,RST SYN --jump TCPMSS --clamp-mss-to-pmtu </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>no luck though. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>tried a plethora of other stuff too , =
but didn't=20
work, so i'll leave that there </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>obviously the nat works, becuase all my =
icmp's are=20
natted. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>mmm</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>so i go into the boxes bios set up and =
tell it to=20
assign irq's to all pci devices automatically </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>boot up into linux </FONT><FONT =
face=3DArial=20
size=3D2>and do </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>ifconfig eth4 up </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>eth4: error fetching interface =
information: Device=20
not found<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eh ? wtf ? </FONT><FONT face=3DArial =
size=3D2>so i do=20
ifconfig eth0 up </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>and the device gets brought up =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>then i do ifconfig eth4 up =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>and it brings it up . Stra</FONT><FONT =
face=3DArial=20
size=3D2>nge huh ? </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>so now i see that all my cards are =
swopped arround.=20
that which used to be eth0 is now eth4 and so </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>on and so on. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>anyway, plug in the appropiate network =
cables to=20
the relevant nics and run the script </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>to a ping to google.com ... everything =
works fine.=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>right, so far so good. right back were =
i=20
started</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>now, do a HTTP-GET <A=20
href=3D"http://www.google.com">http://www.google.com</A>&nbsp;and guess =
what=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>i get a lovely html page. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>strange that changing the device irg =
assignment in=20
the bios solved my problem ? </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>any ideas what could have caused this ? =

</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>thanks a lot for bearing with my =
idiotic ramblings=20
so far </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>----------------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>tanuki </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0176_01C468F1.EFD42000--


