From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Two links and a SMTP sever.
Date: Tue, 18 Jan 2005 16:17:42 -0500 (EST)
Message-ID: <28693.142.169.215.10.1106083062.squirrel@142.169.215.10>
References: <d645356050118053928226673@mail.gmail.com>
	<26550.142.169.215.10.1106081679.squirrel@142.169.215.10>
	<d645356050118125243d12dfb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d645356050118125243d12dfb@mail.gmail.com>
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
To: Ulysses Almeida <ulysses.almeida@gmail.com>
Cc: netfilter@lists.netfilter.org

On Tue, January 18, 2005 3:52 pm, Ulysses Almeida said:
>   Hmm. the NAT/SNAT is working fine, when I recive the SMTP answer
> (LOG on PREROUTING and INPUT of filter, nat and mangle) the packet
> arrives with the correct ip on dst addr. But I can only see it, on
> mangle PREROUTING, but can't on other hooks. I don't know if it is
> related with some sanity check or checksum....
>
>   That's another doubt, dos nat PREROUTING called with syn+ack
> packets, or only with sym packets?

the nat table is special, it only sees the first packet
of a connection.

All other subsequent packet of this connection get verdict via
the conntrack. (bypass NAT chains)

>
> --
>  - Ulysses Almeida
>
>

Samuel



