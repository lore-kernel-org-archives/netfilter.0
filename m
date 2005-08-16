From: varun_saa@vsnl.net
Subject: Re: ftp issue cont.
Date: Tue, 16 Aug 2005 09:13:38 +0500
Message-ID: <6c016e56bfd4d0.6bfd4d06c016e5@vsnl.net>
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

Thanks Jorg=2C =

           I get the following for lsmod =3A =

 =

=5Broot=40squidserver =7E=5D=23 lsmod =7C grep conntrack =

ip=5Fconntrack           41497  3 ipt=5Fstate=2Cipt=5FMASQUERADE=2Ciptabl=
e=5Fnat =

 =

So how do I add =3A =

  =

           ip=5Fconntrack=5Fftp         =

           ipt=5Fconntrack     =

 =

And yes it is =3A =

               -A FORWARD -j DROP =

 =

Thanks again =

 =

Varun =

            =

 =

 =

 =

 =

----- Original Message ----- =

From=3A J=F6rg Harmuth =3Charmuth=40mnemon=2Ede=3E =

Date=3A Monday=2C August 15=2C 2005 4=3A29 pm =

Subject=3A Re=3A ftp issue cont=2E =

 =

=3E varun=5Fsaa=40vsnl=2Enet schrieb=3A =

=3E =3E Thanks Jorg=2C   =

=3E =3E             How to find out if ftp-module is loaded or   =

=3E =3E not=2E   =

=3E  =

=3E e=2Eg=2E =

=3E  =

=3E lsmod =7C grep conntrack =

=3E  =

=3E gives on my box=3A =

=3E  =

=3E ip=5Fconntrack=5Fftp        3680   0  (unused) =

=3E ipt=5Fconntrack           1120   0  (autoclean) =

=3E ip=5Fconntrack           26484   1  (autoclean) =5Bip=5Fconntrack=5Ff=
tp =2E=2E=2E =

=3E  =

=3E =3E    =

=3E =3E Thanks   =

=3E =3E    =

=3E =3E Varun   =

=3E =3E    =

=3E =3E ----- Original Message -----   =

=3E =3E From=3A J=F6rg Harmuth =3Charmuth=40mnemon=2Ede=3E   =

=3E =3E Date=3A Monday=2C August 15=2C 2005 2=3A43 pm   =

=3E =3E Subject=3A Re=3A ftp issue cont=2E   =

=3E =3E    =

=3E =3E  =

=3E =3E=3EDerick Anderson schrieb=3A   =

=3E =3E=3E =

=3E =3E=3E=3EFTP passive mode creates an entirely new connection for data=
    =

=3E =3E=3E =

=3E =3E=3Etransfer=2E=3E It is not =27related=27 to the original connecti=
on and so   =

=3E  =

=3E =3E=3Eiptables doesn=27t   =

=3E =3E=3E =

=3E =3E=3E=3Epick it up as such (nor do any other stateful firewalls that=
 I=27m  =

=3E   =

=3E =3E=3E =

=3E =3E=3Eaware=3E of)=2E    =

=3E =3E=3E   =

=3E =3E=3ENo=2C not really=2E Iptables regards FTP data traffic as relate=
d  =

=3E stuff=2E To   =

=3E =3E=3Ebe more exactly=2C the respective helper module does so   =

=3E =3E=3E(ip=5Fconntrack=5Fftp=2E=5Bk=5Do)=2E So=2C normally all you hav=
e to do=2C is load  =

=3E this   =

=3E =3E=3Emodule=2C allow ESTABLISHED=2CRELATED traffic in and out and al=
low  =

=3E FTP in=2E   =

=3E =3E=3EThis looks something like this (assumed that policies are DROP =
 =

=3E and   =

=3E =3E=3EOUTPUT is ACCEPT and also assumed that the box is directly    =

=3E =3E=3Econnected to   =

=3E =3E=3Ethe internet and that the FTP server is on the firewall box)=3A=
   =

=3E =3E=3E   =

=3E =3E=3Emodprobe ip=5Fconntrack=5Fftp=2E=5Bk=5Do   =

=3E =3E=3E   =

=3E =3E=3Eiptables -A INPUT -m state --state RELATED=2CESTABLISHED -j ACC=
EPT   =

=3E =3E=3Eiptables -A INPUT -p tcp --dport 21 --syn -j ACCEPT   =

=3E =3E=3E   =

=3E =3E=3EThis will work for active and passive FTP=2E If the ftp-module =
 =

=3E isn=27t on   =

=3E =3E=3Ethe system in question=2C varun=5Fsaa has to configure the kern=
el    =

=3E =3E=3Ecorrectlyand recompile as needed=2E   =

=3E =3E=3E   =

=3E =3E=3EBTW=2C the original ruleset didn=27t explain anything=2E IN=7CO=
UTPUT =3D=3D  =

=3E ACCEPT   =

=3E =3E=3Eand in FORWARD no rule concerning FTP=2E So=2C what is this guy=
 doing  =

=3E =3F If   =

=3E =3E=3Ethe FTP server is on the firewall box=2C there is no iptables  =

=3E problem at   =

=3E =3E=3Eall (on this box)=2E If not=2C there are no rules that permit F=
TP and  =

=3E thus   =

=3E =3E=3Eit cannot work=2E The whole thing looks quite mysterious to me=2C=
    =

=3E =3E=3Eincludingthe -P issue Rob mentioned=2E May be a tiny ASCII art =
   =

=3E =3E=3Enetwork picture   =

=3E =3E=3Ewould clarify the situation =3A)   =

=3E =3E=3E   =

=3E =3E=3EHave a nice time=2C   =

=3E =3E=3E   =

=3E =3E=3EJoerg   =

=3E =3E=3E   =

=3E =3E=3E   =

=3E =3E=3E   =

=3E =3E=3E   =

=3E =3E  =

=3E =3E  =

=3E =3E  =

=3E =3E !DSPAM=3A430073677568926616419! =

=3E  =

=3E  


