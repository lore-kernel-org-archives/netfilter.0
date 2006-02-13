From: "Stephen J. Smoogen" <smooge@gmail.com>
Subject: Re: state new with SYN not set
Date: Mon, 13 Feb 2006 05:54:11 -0700
Message-ID: <80d7e4090602130454l41a7eb03pef73e7f49ef21916@mail.gmail.com>
References: <43F050AA.3050602@krediidiinfo.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43F050AA.3050602@krediidiinfo.ee>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Cc: netfilter@lists.netfilter.org

On 2/13/06, Aleksander <aleksander@krediidiinfo.ee> wrote:
> Hello list,
>
> My firewall drops packets, which state is NEW, but no SYN bit is set.
> Now I started logging these dropped packets and there are loads of them.
> All connecting to the 443 port from random IP's (legitimate clients).
> The service is https. The service works fine, but I'm still worried
> about the dropping.
>
> The rules:
> ${IPTABLES} -t filter -A bad_tcp_packets -p tcp --tcp-flags ! SYN SYN -m
> state --state NEW -j LOG --log-prefix "BAD PACKET N
> EW+!syn: "
> ${IPTABLES} -t filter -A bad_tcp_packets -p tcp --tcp-flags ! SYN SYN -m
> state --state NEW -j DROP
>
> An example, from the FORWARD chain:
> Feb 13 11:18:38 myname kernel: BAD PACKET NEW+!syn: IN=3Deth1 OUT=3Deth0
> SRC=3D1.2.3.4 DST=3D192.168.111.34 LEN=3D75 TOS=3D0x00 PREC=3D0x00 TTL=3D=
56 ID=3D47503
> DF PROTO=3DTCP SPT=3D36086 DPT=3D443 WINDOW=3D32942 RES=3D0x00 ACK PSH FI=
N URGP=3D0
>
> What should I think of this?
>

Many times this is because of late packets getting to your server. It
might be because the server has finished the session (it saw a FIN or
RST on its side) and so has closed down the session.. or it might be
that the client didn't get the servers RST/FIN and is sending a second
ACK/PSH/FIN to make sure the session is closed.

There are probably other reasons for this, but this has been my
biggest number. There are some probe tools that just send ACK-PSH-FIN
packets to see what they get back from firewalls.


> Thanks,
>     Alex
>
>


--
Stephen J Smoogen.
CSIRT/Linux System Administrator

