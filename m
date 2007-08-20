From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: interesting behavior of ftp helper
Date: Mon, 20 Aug 2007 11:38:16 +0200
Message-ID: <46C96108.1090609@plouf.fr.eu.org>
References: <46C8CEE4.2050304@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46C8CEE4.2050304@solutti.com.br>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter ML <netfilter@lists.netfilter.org>

Hello,

Leonardo Rodrigues Magalh=E3es a =E9crit :
[...]
>    forward_interna_externa is the created table that receives all=20
> traffic flowing from internal to external network. It has, among severa=
l=20
> others, the following rules:
>=20
> -A forward_interna_externa -s 192.168.0.0/255.255.255.0 -p tcp -m tcp=20
> --dport 20:21 -j ACCEPT

Port 20 is not needed. The FTP conntrack helper and RELATED/ESTABLISHED=20
states will take care of this.

> -A forward_interna_externa -s 192.168.0.0/255.255.255.0 -p tcp -m state=
=20
> --state RELATED -j ACCEPT
> -A forward_interna_externa -j LOG --log-prefix "bloq_forward_externa:"=20
> --log-level 6 --log-tcp-sequence --log-tcp-options --log-ip-options
> -A forward_interna_externa -j DROP
>=20
>    ip_conntrack_ftp and ip_nat_ftp modules are correctly loaded.
>=20
>    So, with these rules and all i have read, i was expecting that 20 an=
d=20
> 21 TCP ports would handle the active FTP connections and=20
> ip_conntrack_ftp+RELATED rule would handle the passive FTP connections.

Not exactly. Port 21 is the control connection and is always used=20
whether you're in passive of active mode. Both passive and active data=20
connection are RELATED to it. Note that port 20 is used as a source port=20
by the server to initiate a data connection in active mode. It is not a=20
listening port waiting to accept incoming connections.

>    But ..... altough i was doing what i tought to be the correct rules=20
> and loading the needed modules, i couldnt passive FTP. Active FTP was=20
> OK, but passive wasn't. My connections were blocked and no packets were=
=20
> hitting the RELATED rule:
>=20
> Aug 15 15:20:02 fenix kernel: bloq_forward_externa:IN=3Deth0 OUT=3Deth1=
=20
> SRC=3D192.168.0.54 DST=3D200.182.XX.YY LEN=3D40 TOS=3D0x00 PREC=3D0x00 =
TTL=3D127=20
> ID=3D756 DF PROTO=3DTCP SPT=3D1113 DPT=3D4846 SEQ=3D1838929699 ACK=3D30=
64370605=20
> WINDOW=3D65535 RES=3D0x00 ACK URGP=3D0

You must be wrong. This is an ACK packet, following a SYN/ACK packet=20
sent by the server in response to a SYN packet you sent to establish the=20
passive data connection and which had the RELATED state. Check the=20
counters. If the RELATED rule did not catch the SYN packet, then another=20
rule did. Once the data connection has been established (after the SYN),=20
all its subsequent packets have the ESTABLISHED state, as any other=20
connection.

[...]
>    The other theory i got is that only the FIRST packet of a helper=20
> identified connection is RELATED and all the other packets that belong=20
> to that RELATED connection are indeed ESTABLISHED ones.

Correct. In related connections the RELATED state replaces NEW.

