From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Weird TCP flags?
Date: 12 Dec 2003 15:26:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071239162.1693.176.camel@kermit>
References: <003101c3c065$f61ad790$13fea8c0@melita.com>
	 <1071234823.2020.8.camel@grendel>
	 <200312120905.05053.JALaramie@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312120905.05053.JALaramie@Loudoun-Fairfax.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Fre, 2003-12-12 um 15.05 schrieb Jeffrey Laramie:
> On Friday 12 December 2003 08:13, Chris Brenton wrote:
> > On Thu, 2003-12-11 at 23:11, Ian Hunter wrote:
> > > Dec 11 22:58:52 lucy kernel: Fwd DMZ->Internet DROP: IN=3Deth1 OUT=3D=
ppp0
> > > SRC=3D192.168.254.242 DST=3D204.157.6.223 LEN=3D60 TOS=3D0x00 PREC=3D=
0x00 TTL=3D63
> > > ID=3D56169 DF PROTO=3DTCP SPT=3D80 DPT=3D56319 WINDOW=3D32476 RES=3D0=
x00 ACK SYN
> > > URGP=3D0
> >
> > My "guess" is, you are receiving a SYN packet from 204.157.6.223. This
> > creates a state table entry with with a 60 second timer. Your system is
> > taking longer than 60 seconds to respond, so iptables is removing the
> > state table entry. Your system then responds causing the log entry show=
n
> > above.
> >
>=20
> Hey Chris,
>=20
> Is it normal for the server to send the ACK SYN to a high dport? I wouldn=
't=20
> have expected that.
Yes, of course:

client:56319 -SYN->      server:80
client:56319 <-ACK/SYN- server:80
client:56319 -ACK->      server:80
Connection established.=20

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: VPN mit Linux
Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

