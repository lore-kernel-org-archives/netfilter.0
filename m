From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: NFS and iptables.
Date: Sun, 25 Apr 2004 01:12:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082848320.11802.12.camel@anduril.intranet.cartel-securite.net>
References: <1082844037.10067.20.camel@james>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1082844037.10067.20.camel@james>
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
To: Krunk <krunkalot@hotpop.com>
Cc: netfilter@lists.netfilter.org

Le dim 25/04/2004 =E0 00:00, Krunk a =E9crit :
> I've bound my NFS ports (moountd, statd, lockd, quotad) and freed up th=
e
> ports they are bound to, but the client still hangs when I try to mount
> the remote share.
[...]
> command that opens ports:
>  NFS=3D"2049 32764 32765 32766 32767 32768 32772 sunrpc"
[...]
> Apr 24 16:53:35 tuxmac DROPl:IN=3Deth1 OUT=3D MAC=3D<mac here>
> SRC=3D192.168.xxx.xxx DST=3D192.168.xxx.xxx LEN=3D60 TOS=3D0x00 PREC=3D=
0x00
> TTL=3D64 ID=3D41035 DF PROTO=3DTCP SPT=3D896 DPT=3D111 WINDOW=3D5840 RE=
S=3D0x00 SYN
> URGP=3D0

As far as I can see, your client is trying to connect to portmapper in
order to get NFS service port back. But there's nothing in your script
excerpt that opens TCP/111.

PS : maybe you should consider use the RPC helper available in
patch'o'matic extra section.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

