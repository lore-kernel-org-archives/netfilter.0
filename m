From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: IPT Output packet died
Date: Fri, 17 Feb 2006 13:41:32 +0100 (CET)
Message-ID: <57599.193.173.147.3.1140180092.squirrel@webmail.sterenborg.info>
References: <20060217111426.GB1183@server.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060217111426.GB1183@server.homelinux.net>
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
To: netfilter@lists.netfilter.org

On Fri, February 17, 2006 12:14, Mark-Walter@t-online.de wrote:

> From time to time the log rule next to the output section show's this:
>
> Feb 17 10:59:01 gerry kernel: IPT OUTPUT packet died: IN=3D OUT=3Deth0
> SRC=3D192.168.0.1 DST=3D217.89.23.137 LEN=3D61 TOS=3D0x00 PREC=3D0x00 T=
TL=3D64
> ID=3D19170 DF PROTO=3DUDP SPT=3D32769 DPT=3D53 LEN=3D41
>
> The destination ip is the bind process of my provider.
>
> What have I to change to avoid this logging ?
>
> Here are some rules for the OUTPUT section:
>
> $IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
> $IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
> $IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT

These are indeed "some" rules, not all. There are none before these in th=
e
OUTPUT chain that could block outgoing traffic ? (You say you use Oscar's
script but you could have modified it.)

I have not seen your other rules for this chain and assuming there's no D=
ROP
or REJECT or such rule in the chain, why do you even bother to set rules =
in it
? It seems you want to allow everything which is the same as policy set t=
o
ACCEPT and no rules in it.


Gr,
Rob



