From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: ACK packets being dropped from yahoo
Date: Mon, 16 Dec 2002 01:11:07 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212160111.07489.netfilter@newkirk.us>
References: <F3EgmgEaIj38y8iUSmR0000d53d@hotmail.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F3EgmgEaIj38y8iUSmR0000d53d@hotmail.com>
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
To: Jon Wyatt <samur2@hotmail.com>, netfilter@lists.netfilter.org

On Sunday 15 December 2002 09:50 am, Jon Wyatt wrote:

> It appears that yahoo is sending an ACK which I'm blocking (because
> it's not part of an initialisation), unless I've misunderstood the
> communication process.
>
> Here's the rules where I set them:-
> $IPTABLES -N bad_tcp_packets
> $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j
> LOG --log-prefix "New not syn:"
> $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j
> DROP
>
>
>
> And here's the message I get when yahoo attempts to send the ACK.
>
> New not syn:IN=3Dppp0 OUT=3D MAC=3D SRC=3D212.158.*.* DST=3D217.135.*.*=
 LEN=3D52
> TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D27155 PROTO=3DTCP SPT=3D80 DPT=3D3=
2782
> WINDOW=3D8760 RES=3D0x00 ACK RST URGP=3D0
>
> What's going on there then?

I think the question should be "Why is this NEW?"  Dest IP must be=20
correct for you to get it, and sourceport is as well.  Is it coming from=20
a different IP?  Or to a different destport?  Or does netfilter think=20
the connection has closed?  Something must be different for the state=20
machine to consider it NEW.  Is this from the firewall machine, or=20
forwarded through it with SNAT or MASQ?

BTW, when I try this rule as first rule in my INPUT chain, it does NOT=20
hit when I do a Yahoo search, the search works fine.  Is there something=20
more particular about your search, or is it just "yahoo.com" and enter=20
some text to search for?

j

