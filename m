From: Gladson George <georgc@FARMINGDALE.EDU>
Subject: RE: How to set up
Date: Fri, 23 May 2003 15:56:56 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2CE951F1A7DC0644A33B9F763D2029C0012A288B@mail.it.farmingdale.edu>
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
To: Daniel Chemko <dchemko@smgtec.com>, tr-huso <tr-huso@online.no>, Netfilter Mailing List <netfilter@lists.netfilter.org>

Lids is a software that can be used to secure a Linux box. =0D=0A=
=0D=0Ahttp://www.lids.org/=0D=0A=0D=0AYou can also use snort to watch=
 your network scans and hacks.=0D=0A=0D=0Awww.snort.org=0D=0A=0D=0A=
=0D=0A-----Original Message-----=0D=0AFrom: Daniel Chemko [mailto:dch=
emko@smgtec.com] =0D=0ASent: Friday, May 23, 2003 12:45 PM=0D=0ATo: t=
r-huso; Netfilter Mailing List=0D=0ASubject: RE: How to set up=0D=
=0A=0D=0AAck!=0D=0A=0D=0ATalk about asking for everything all at once=
... I digress.=0D=0A=0D=0ARule 1 of firewalls is to never have any se=
rvices on the firewall that=0D=0Aare not absolutely necessary. Of cou=
rse if you are poor just like=0D=0Aeveryone else I guess you have to =
bend that rule.=0D=0A=0D=0AIf you are putting tons of services on the=
 firewall, you have to make=0D=0Asure that the ones that are used for=
 your local network don't get to the=0D=0Ainternet!=0D=0A=0D=0ASamba =
may seem fine now, but when some nasty hacker wipes out all your=0D=
=0Ashares you won't be so happy about having it! (SMB: Ports 137-139=
=0D=0Atcp/udp; Port 445 tcp)=0D=0A=0D=0AMake sure all default service=
s in the Linux box are turned off, or a re=0D=0Arestricted from inter=
net tampering, like Portmap, etc..=0D=0A=0D=0APatch all services that=
 you will be running to the latest, greatest, and=0D=0Amost secure ve=
rsion.=0D=0A=0D=0AWhen writing scripts, I can't recommend using perso=
n xyz's scripts. I=0D=0Ahave always been of the impression that by le=
arning about how iptables=0D=0Aor other tools work, you become more a=
ware of really important issues of=0D=0Ahow firewalls work. Read tuto=
rials that cover iptables to make sure that=0D=0Athere aren't any "Th=
ey can do that"?'s or "I never knew that"!'s.=0D=0A=0D=0AAs for monit=
oring software, I am incompetently bad at implementing any=0D=0Asyste=
ms monitoring tools so I can't offer any advice with that. I am=0D=
=0Asure you can do a search and come up with tools like Tripwire or I=
DS's.=0D=0ARunning tools like Nessus is also a good idea when impleme=
nting a sanity=0D=0Acheck on your firewall.=0D=0A=0D=0A=0D=0A-----Ori=
ginal Message-----=0D=0AFrom: tr-huso [mailto:tr-huso@online.no] =
=0D=0ASent: Friday, May 23, 2003 6:38 AM=0D=0ATo: Netfilter Mailing L=
ist=0D=0ASubject: How to set up=0D=0A=0D=0AHi group.=0D=0A=0D=0AI'm n=
ew to this group, so here is my setup:=0D=0AA linux box (Red Hat 7.3)=
 that is connected to the www and also works as=0D=0Aa =0D=0Arouter f=
or the rest of the network. It also runs an Apache webserver,=0D=0Aan=
d will =0D=0Aalso run a proftpd ftp-server soon. =0D=0AA Windows XP m=
achine that is used for anything else, connectes to the=0D=0Ainternet=
 =0D=0Athrough the linux. Thanks to Samba the windows machine has som=
e network =0D=0Adirectories on the linux box.=0D=0A=0D=0ANow I want t=
o secure this thing, and I also want to log what's happening=0D=0Aon =
=0D=0Athe linux-box.=0D=0A=0D=0AI've read a few articles on iptables,=
 and read a few newsgroup-posts=0D=0Arelated =0D=0Ato the topic.=0D=
=0A=0D=0AI've also seen a few scripts that I might use, if someone ca=
n point out=0D=0Awhich =0D=0Aone to use, I'm more than happy...=0D=
=0A=0D=0Ayours,=0D=0A=0D=0ATrond=0D=0A=0D=0A=0D=0A=0D=0A=0D=0A=

