From: Nirgal =?ISO-8859-1?Q?Vourg=E8re?= <contact_vgernf@nirgal.com>
Subject: Re: Fwd: Issue migrating "iptables -m socket --transparent" into nftables
Date: Wed, 26 Aug 2020 20:00:52 +0200
Message-ID: <3013454.VDAaSrcd8B@deimos>
References: <CAKcfE+ZhO2O6nanU=ABJB8ptpB8VvjCK1wmzQ8TMFx+U-0_8nw@mail.gmail.com> <CAKcfE+ZHch0LH79Mi2NMM9z4UaoORb09oPur8xrPaK-7F3SRpg@mail.gmail.com> <20200825094530.GA23673@bzorp>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200825094530.GA23673@bzorp>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Balazs Scheidler <bazsi77@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

My apologies for the delay.
I ran into an *unrelated* issue, that troubled ipv6 outbound (masqueraded) connections.

I did some more tests with your patches for linux & nftables.

All look good, both ipv4 & v6, for both inbound (redirected to the socket) and outbound (masqueraded) connections.

Thank you again! :)

On Tuesday, 25 August 2020 11:45:30 CEST Balazs Scheidler wrote:
> On Sat, Aug 22, 2020 at 08:45:22AM +0200, Balazs Scheidler wrote:
> > hmm.. judging the code alone, I can't see the difference between xt_socket
> > and nft_socket, they are checking the same things for ipv6.
> > 
> > I am not sure when sk->sk_v6_rcv_saddr is properly set, if that's non-zero
> > we would yield "socket wildcard 0" and cause a match.
> > 
> > I can see that __inet6_bind() sets this properly, so as long as haproxy
> > binds it to port 80/443 we should be fine.
> > 
> > I still cannot get what you mean under "But ipv6 outbound connections still
> > are grabbed by the socket rather than be routed to the wan and
> > masqueraded." exactly.
> > 
> > 1) haproxy binds to [::0]:80 and I assume it does that to receive external
> > traffic. Do you use tproxy rules to redirect traffic here?
> > 2) then haproxy would establish a connection from [clientip]:randomport ->
> > internal server:80. The return traffic should be matched by "socket
> > transparent 1 socket wildcard 0" and redirected as such.
> > 
> > So which of the two connections above is what you mean?
> 
> The question still stands, which of the two connection is getting the wrong
> treatment?
> 
> @Pablo: do you want me to test/push the kernel piece to netfilter-devel?
> Also, I have a usability question in the email I sent there.
> 
> Hopefully, by now I can send email to vger :)
> 
> Cheers,
> 




