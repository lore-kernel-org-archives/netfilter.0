From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Packets missing state ?
Date: Tue, 23 Dec 2003 14:55:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072187752.809.114.camel@elendil.intranet.cartel-securite.net>
References: <200312231828.59518.rajiv@theargoncompany.com>
	 <200312231308.50481.Antony@Soft-Solutions.co.uk>
	 <200312231857.21676.vinayakm@theargoncompany.com>
	 <200312231907.58135.vinayakm@theargoncompany.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312231907.58135.vinayakm@theargoncompany.com>
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
To: Vinayakam Murugan <vinayakm@theargoncompany.com>
Cc: netfilter@lists.netfilter.org

Le mar 23/12/2003 =E0 14:37, Vinayakam Murugan a =E9crit :
>  We were not able to reproduce it out here.Anyways in this scenario, wo=
uld
>  the packet would have the state as NEW?  All these logs are of packets=
 with
>  state NEW.

These packets are delayed ones, probably due to high latency (heavy load
on line ?). Most of the time, there's not much to worry about,
especially on DSL line when upload goes up.

>  Another peculiar log which we would like to get more info on are
>  Dec 23 18:43:05 theargonserver kernel: IPT IN_FIREWALL_NEW: IN=3Deth1 =
OUT=3D
>  MAC=3D00:03:47:6a:5c:6b:00:c0:49:25:d1:a3:08:00 SRC=3D80.15.238.66
>  DST=3Dxxx.xxx.xxx.xxx LEN=3D73 TOS=3D0x00 PREC=3D0x00 TTL=3D55 ID=3D0 =
DF PROTO=3DUDP
>  SPT=3D31819 DPT=3D53 LEN=3D53
>  There are a lot of packets to port 53. Is this normal?

Seems that someone wants to ask some DNS stuff to your box :) Maybe this
IP is declared somewhere as authoritative for a domain or someone use it
as forwarder.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

