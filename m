From: Gladson George <georgc@FARMINGDALE.EDU>
Subject: RE: Blocking Windows
Date: Mon, 02 Jun 2003 08:44:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2CE951F1A7DC0644A33B9F763D2029C0012A2891@mail.it.farmingdale.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Content-Type: text/plain; charset="us-ascii"
To: Arnt Karlsen <arnt@c2i.net>, netfilter@lists.netfilter.org

How would you go about blocking static ip. =0D=0A=0D=0A-----Original =
Message-----=0D=0AFrom: Arnt Karlsen [mailto:arnt@c2i.net] =0D=0ASent=
: Thursday, May 29, 2003 2:19 PM=0D=0ATo: netfilter@lists.netfilter.o=
rg=0D=0ASubject: Re: Blocking Windows=0D=0A=0D=0AOn Thu, 29 May 2003 =
11:27:11 -0400, =0D=0ADominic Irrcher <dirrcher@colosseum.com> wrote =
in message =0D=0A<C037E4BA8D79D71196AF00805F777E98028A0C@colosrva.col=
osseum.com>:=0D=0A=0D=0A> what about giving each os a different ip ?=
=0D=0A> =0D=0A> then when users boot up into windows, block those ips=
 you gave the=0D=0A> windows hosts.=0D=0A> =0D=0A> ie. 192.168 on lin=
ux, and 10.10 on windows, block all 10.10 on the =0D=0A> LAN!=0D=0A> =
=0D=0A> something along those lines=0D=0A=0D=0A..can also be automate=
d to first block _everything_, then hear dhcp ip=0D=0Arequest broadca=
sts from clients, then first check os with nmap or=0D=0Anessus before=
 award an ip from dhcp.  Static ip tricksters can be=0D=0Ablocked too=
.=0D=0A=0D=0A..yet another option is run a ipv6 gateway, I don't beli=
eve =0D=0Awintendo can do ipv6, concequently they will be kept nicely=
 =0D=0Aoff Internet, can some wintendoite confirm or refute me here?=
=0D=0A=0D=0A-- =0D=0A..med vennlig hilsen =3D with Kind Regards from =
Arnt... ;-)=0D=0A...with a number of polar bear hunters in his ancest=
ry...=0D=0A  Scenarios always come in sets of three: =0D=0A  best cas=
e, worst case, and just in case.=0D=0A=0D=0A=0D=0A=0D=0A=

