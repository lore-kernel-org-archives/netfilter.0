From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: FIN without SYN - was (no subject)
Date: Thu, 5 Dec 2002 08:51:54 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212050851.54266.netfilter@newkirk.us>
References: <31347F3CE518D6118ACB00A0246AD0560B2527@mx.seaan.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <31347F3CE518D6118ACB00A0246AD0560B2527@mx.seaan.net>
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
To: mailinglists@belfin.ch, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Thursday 05 December 2002 04:38 am, Philipp (mailinglists@belfin.ch)=20
wrote:
> Hi
>
> I have a rule saying this:
>
> iptables -A INPUT -p 6 ! --syn -m state --state NEW -j LOG --log-level
> warn --log-prefix "### NOT-SYN ### "
> iptables -A INPUT -p 6 ! --syn -m state --state NEW -j DROP
>
> and I've got Logs that look like that:
>
> Dec  4 17:28:07 rproxy2 kernel: ### NOT-SYN ### IN=3Deth1 OUT=3D
> MAC=3D00:a0:24:6a:d0:56:00:10:db:1e:20:70:08:00 SRC=3D194.112.179.45
> DST=3D192.168.1.6
> LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D53 ID=3D2979 DF PROTO=3DTCP SPT=3D=
60351 DPT=3D80
> WINDOW=3D5840 RES=3D0x00 ACK FIN URGP=3D0
>
> Also I've got a snort box running in my ISPs subnet. Snort would have
> picked it up if this was a scan.
> Does iptables 1.2.5 have a problem with FIN-ACK packets?

No, but if they are the first traffic it recognizes in a connection (IE,=20
state=3DNEW) and they are NOT SYN your rule will log them.  This does not=
=20
always mean that no connection was previously made, it can occur if the=20
connection has timed-out, or if the connection is refused.

j


