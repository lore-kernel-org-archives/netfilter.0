From: diadicic@optonline.net
Subject: Re: port Forwarding
Date: Tue, 16 Nov 2004 12:01:50 -0500
Message-ID: <4919c7490274.4902744919c7@optonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-language: en
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Cool=2C I ll give that a try=2E

Sorry about the typo in the SNAT statment

Thanks again=2E

----- Original Message -----
From=3A Jason Opperisano =3Copie=40817west=2Ecom=3E
Date=3A Tuesday=2C November 16=2C 2004 11=3A48 am
Subject=3A Re=3A port Forwarding

=3E On Tue=2C 2004-11-16 at 11=3A44=2C diadicic=40optonline=2Enet wrote=3A=

=3E =3E Can someone help me understand this=3F
=3E =3E =

=3E =3E   I have a firewall setup up with two nic=27s in it=2E
=3E =3E =

=3E =3E                1 eth0 24=2E190=2Ex=2Ex  which is my Internet conn=
ection
=3E =3E                2 eth1 172=2E16=2E12=2E165 which is a local area n=
etwork=2E
=3E =3E =

=3E =3E               I have a web server at 172=2E16=2E12=2E160  =93I ho=
pe thats =

=3E clear=94=3E =

=3E =3E     Now if I port forward this way it will not work=2E
=3E =3E =

=3E =3E              =93iptables -A PREROUTING -i eth0 -t nat -p tcp =96d=
port =

=3E 80 -j DNAT =96to =

=3E =3E                 172=2E16=2E12=2E160=3A80=94
=3E =3E                =93iptables -A FORWARD -p tcp -d 172=2E16=2E12=2E1=
60 =

=3E =96dport 80 -i eth0 -o eth1 =

=3E =3E                  -j ACCEPT=94
=3E =3E =

=3E =3E =

=3E =3E But if I do it this way It will work=3A
=3E =3E =

=3E =3E                  =93iptables -t nat  -A PREROUTING -p tcp =96dpor=
t 80 =

=3E -d 24=2E190=2Ex=2Ex -i eth0 -j   =

=3E =3E                    DNAT --to-destination 172=2E16=2E12=2E160  =

=3E 172=2E16=2E12=2E160=94=3E =

=3E =3E                    =93iptables -A POSTROUTING -p tcp =96dport 80 =
-d =

=3E 172=2E16=2E12=2E160 -j SNAT -o    =

=3E =3E                      eth1 =96to-source 172=2E16=2E12=2E165=94
=3E =3E =

=3E =3E =

=3E =3E Could anyone please explain why the first way did not work=2C all=
 =

=3E the directions I read claim that is how to port forward=2E
=3E =

=3E because the default gateway of 172=2E16=2E12=2E160 is not 172=2E16=2E=
12=2E165=3F
=3E =

=3E -j
=3E =

=3E --
=3E =22Oh=2C so they have internet on computers now!=22
=3E 	--The Simpsons
=3E =

=3E =

=3E 


