From: varun_saa@vsnl.net
Subject: Re: ftp issue cont.
Date: Mon, 15 Aug 2005 15:33:29 +0500
Message-ID: <6bb85b56bba229.6bba2296bb85b5@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-language: en
Content-disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Cc: netfilter@lists.netfilter.org

Thanks Jorg=2C  =

            How to find out if ftp-module is loaded or  =

not=2E  =

 =

  =

Thanks  =

  =

Varun  =

  =

----- Original Message -----  =

From=3A J=F6rg Harmuth =3Charmuth=40mnemon=2Ede=3E  =

Date=3A Monday=2C August 15=2C 2005 2=3A43 pm  =

Subject=3A Re=3A ftp issue cont=2E  =

  =

=3E Derick Anderson schrieb=3A  =

=3E =3E FTP passive mode creates an entirely new connection for data   =

=3E transfer=2E=3E It is not =27related=27 to the original connection and=
 so   =

=3E iptables doesn=27t  =

=3E =3E pick it up as such (nor do any other stateful firewalls that I=27=
m   =

=3E aware=3E of)=2E   =

=3E   =

=3E No=2C not really=2E Iptables regards FTP data traffic as related stuf=
f=2E To  =

=3E be more exactly=2C the respective helper module does so  =

=3E (ip=5Fconntrack=5Fftp=2E=5Bk=5Do)=2E So=2C normally all you have to d=
o=2C is load this  =

=3E module=2C allow ESTABLISHED=2CRELATED traffic in and out and allow FT=
P in=2E  =

=3E This looks something like this (assumed that policies are DROP and  =

=3E OUTPUT is ACCEPT and also assumed that the box is directly   =

=3E connected to  =

=3E the internet and that the FTP server is on the firewall box)=3A  =

=3E   =

=3E modprobe ip=5Fconntrack=5Fftp=2E=5Bk=5Do  =

=3E   =

=3E iptables -A INPUT -m state --state RELATED=2CESTABLISHED -j ACCEPT  =

=3E iptables -A INPUT -p tcp --dport 21 --syn -j ACCEPT  =

=3E   =

=3E This will work for active and passive FTP=2E If the ftp-module isn=27=
t on  =

=3E the system in question=2C varun=5Fsaa has to configure the kernel   =

=3E correctlyand recompile as needed=2E  =

=3E   =

=3E BTW=2C the original ruleset didn=27t explain anything=2E IN=7COUTPUT =
=3D=3D ACCEPT  =

=3E and in FORWARD no rule concerning FTP=2E So=2C what is this guy doing=
 =3F If  =

=3E the FTP server is on the firewall box=2C there is no iptables problem=
 at  =

=3E all (on this box)=2E If not=2C there are no rules that permit FTP and=
 thus  =

=3E it cannot work=2E The whole thing looks quite mysterious to me=2C   =

=3E includingthe -P issue Rob mentioned=2E May be a tiny ASCII art   =

=3E network picture  =

=3E would clarify the situation =3A)  =

=3E   =

=3E Have a nice time=2C  =

=3E   =

=3E Joerg  =

=3E   =

=3E   =

=3E   =

=3E   


