From: Jason Opperisano <opie@817west.com>
Subject: Re: state: INVALID
Date: Sat, 20 Nov 2004 17:46:13 -0500
Message-ID: <1100990773.3501.9.camel@hubcap.ljm.dom>
References: <419E75B1.3030406@uni-paderborn.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <419E75B1.3030406@uni-paderborn.de>
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
To: netfilter@lists.netfilter.org
Cc: bj-schmidt@uni-paderborn.de

On Fri, 2004-11-19 at 17:37, Bj=C3=B6rn Schmidt wrote:
> Hi,
>=20
> the ulogd logfile of my server shows many "INVALID state" packets. What=
 could
> be the reason for that?

my guess would be because you have a log rule that logs on "-m state
--state INVALID"

> The server has one cardbus nic (eth0), one dsl-interface (ppp0) and, of=
 course
> lo. The client has only eth0 and lo. The kernel version of both compute=
rs is
> 2.6.10-rc2
>=20
> syslogemu.log:Nov 19 20:31:52 kilobyte INPUT_INVALID IN=3Deth0 OUT=3D=20
> MAC=3D00:d0:b7:01:ce:2a:00:04:e2:7f:90:41:08:00  SRC=3D192.168.0.2 DST=3D=
192.168.0.1=20
> LEN=3D52 TOS=3D00 PREC=3D0x00 TTL=3D64 ID=3D1680 DF PROTO=3DTCP SPT=3D3=
2899 DPT=3D3130=20
> SEQ=3D4260699581 ACK=3D510793293 WINDOW=3D5080 ACK FIN URGP=3D0

this is a FIN-ACK packet from the client to the server for an ICP
session.

> syslogemu.log:Nov 19 20:31:52 kilobyte OUTPUT_INVALID IN=3D OUT=3Deth0 =
MAC=3D=20
> SRC=3D192.168.0.1 DST=3D192.168.0.2 LEN=3D80 TOS=3D00 PREC=3D0x00 TTL=3D=
255 ID=3D29481=20
> PROTO=3DICMP TYPE=3D3 CODE=3D3

this is an ICMP Port Unreachable from 192.168.0.1 to 192.168.0.2

> syslogemu.log:Nov 19 20:31:52 kilobyte INPUT_INVALID IN=3Deth0 OUT=3D=20
> MAC=3D00:d0:b7:01:ce:2a:00:04:e2:7f:90:41:08:00  SRC=3D192.168.0.2 DST=3D=
192.168.0.1=20
> LEN=3D52 TOS=3D00 PREC=3D0x00 TTL=3D64 ID=3D13326 DF PROTO=3DTCP SPT=3D=
32845 DPT=3D993=20
> SEQ=3D3094163529 ACK=3D3641510831 WINDOW=3D2908 ACK FIN URGP=3D0

this is a FIN-ACK packet from the client to the server for an IMAP/SSL
session.

the definition of an INVALID packet is simply a packet that is neither
ESTABLISHED nor RELATED.  depending on the specific communication in
question and the timeout values on the firewall for the CLOSE-WAIT
state--you can see a *ton* of FIN-ACK packets that will be considered
"invalid" as they arrive after the firewall has removed the connection
in question from conntrack.  port-unreachables should normally match as
"related," but there could have been something funny going on.

-j

--
"No jury in the world is going to convict a baby ... Maybe Texas."
	--The Simpsons


