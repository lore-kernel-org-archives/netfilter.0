From: Patrick Petermair <captain.nuke@gmx.at>
Subject: Re: Strange log entries (again)
Date: Tue, 9 Jul 2002 21:44:09 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207092144.09877.captain.nuke@gmx.at>
References: <200207082243.35434.captain.nuke@gmx.at> <20020708205822.EMAP4119.mta06-svc.ntlworld.com@there>
Reply-To: captain.nuke@gmx.at
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020708205822.EMAP4119.mta06-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Am Montag, 8. Juli 2002 22:58 schrieb Antony Stone:
> On Monday 08 July 2002 9:43 pm, Patrick Petermair wrote:
> > Jul  8 22:25:11 wormhole kernel: IN=3Dppp0 OUT=3D MAC=3D SRC=3D207.17=
1.169.16
> > DST=3D213.225.41.145 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D49 ID=3D21=
031 DF PROTO=3DTCP
> > SPT=3D80 DPT=3D42111 WINDOW=3D8760 RES=3D0x00 ACK RST URGP=3D0
>
> This is an ACK RST packet, so it's quite likely that the connection
> tracking has already deleted the connection from the conntrack table (w=
hen
> it got the previous RST packet), therefore when this packet turns up, i=
t no
> longer belongs to an ESTABLISHED connection.
>
> Don't worry about it.

Mhmm, am I the only one getting these entries in my logs?
I'm thinking of putting a rule just before the logging rule to drop those=
=20
packets because they are useless information for the logs.

Is this due to a misconfiguration of the destination=20
webserver/router/firewall?

Thnx so far...
Patrick

--=20
http://www.petermair.com

