From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: More neqbie questions
Date: Mon, 2 Aug 2004 16:09:10 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051222@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Eric Ellis <eellis@mail.co.gilchrist.fl.us>, netfilter@lists.netfilter.org

> Now here's something interesting that I discovered when you mentioned
> it...
>
> <code>
> root@firewall:/var/log# tail syslog -f|grep 10.1.1.100
>
> Aug  2 13:41:38 firewall kernel: IN=3Deth1 OUT=3Deth0 SRC=3D10.1.1.100
> DST=3D212.19.193.43 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D
> 49518 DF PROTO=3DTCP SPT=3D3571 DPT=3D80 WINDOW=3D64240 RES=3D0x00 SYN =
URGP=3D0

your redirect rule is:

	$IPT -t nat -A PREROUTING -i $INT -p tcp --dport 80 \
	  -j REDIRECT --to-port 8080

where $INT =3D eth0

the inbound interface of the logged packet above is eth1; therefore, it =
does not match your REDIRECT rule (or any FORWARD rule either).

are your interface variables ($INT and $EXT) backwards?

-j


