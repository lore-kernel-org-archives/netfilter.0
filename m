From: varun_saa@vsnl.net
Subject: Re: ftp issue cont.
Date: Tue, 16 Aug 2005 15:16:41 +0500
Message-ID: <980db9960d.9960d980db@vsnl.net>
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

Thanks a lot Jorg=2C =

                 It was rather simple=2E =

I will try shortly and see my client-side works=2E =

 =

While reading there were a few more details =3A =

 =

modprobe iptable=5Fnat =

modprobe ip=5Fnat=5Fftp =

 =

In what situation would you enable those two=2E =

 =

Varun =

 =

----- Original Message ----- =

From=3A J=F6rg Harmuth =3Charmuth=40mnemon=2Ede=3E =

Date=3A Tuesday=2C August 16=2C 2005 1=3A26 pm =

Subject=3A Re=3A ftp issue cont=2E =

 =

=3E varun=5Fsaa=40vsnl=2Enet schrieb=3A =

=3E  =

=3E =3EThanks Jorg=2C  =

=3E =3E           I get the following for lsmod =3A  =

=3E =3E  =

=3E =3E=5Broot=40squidserver =7E=5D=23 lsmod =7C grep conntrack  =

=3E =3Eip=5Fconntrack           41497  3  =

=3E ipt=5Fstate=2Cipt=5FMASQUERADE=2Ciptable=5Fnat  =

=3E =3E  =

=3E =3ESo how do I add =3A  =

=3E =3E   =

=3E =3E           ip=5Fconntrack=5Fftp          =

=3E =3E           ipt=5Fconntrack      =

=3E =3E  =

=3E =3EAnd yes it is =3A  =

=3E =3E               -A FORWARD -j DROP  =

=3E =3E  =

=3E =3E   =

=3E =3E =

=3E modprobe ip=5Fconntrack=5Fftp =

=3E  =

=3E If you get an error message=2C you probably have to reconfigure the =

=3E kernel=2E May I suggest reading some basic Linux tutorial =3F You can=
 find =

=3E tuts e=2Eg=2E on http=3A//debian=2Eorg and most likely on the home pa=
ge of  =

=3E yourdistribution=2E =

=3E  =

=3E Have a nice time and happy reading=2C =

=3E  =

=3E Joerg =

=3E  =

=3E  =

=3E  =

=3E  


