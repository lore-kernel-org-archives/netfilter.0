From: "Peter Marshall" <pmarshal@caris.com>
Subject: Re: Mail Through Firewall
Date: Wed, 18 Feb 2004 11:07:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <018c01c3f630$decdacb0$49caa8c0@caris.priv>
References: <012201c3f627$18eabbe0$49caa8c0@caris.priv> <200402181405.01680.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

How do I tell outlook to look up using DNS instead of NetBIOS ... ?

----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, February 18, 2004 10:05 AM
Subject: Re: Mail Through Firewall


> On Wednesday 18 February 2004 1:57 pm, Peter Marshall wrote:
>
> > Hey, I am sure this question is going to seem trivial to everyone here
..
> > but I will ask anyway.
> > I want to get outlook to work on my inside box .... I have it all set up
> > correctly, but it can't find the pop / smtp servers ...
> >
> > I ran ethereal to see what the problem was ...
> > When I try to connect I get 3 requests
> > source 10.0.0.2
> > dest 10.0.0.255
>
> That's a broadcast address...
>
> > Protocol NBNS
>
> Ugh.   M$ Outlook trying to use NetBios Name Resolution instead of DNS :(
>
> > source and dest ports: 137
>
> NetBios....
>
> > and I get no reply's ... ( well, I get an arp request after the 3rd try
> > ...) Any ideas how to get this working ?
>
> Tell the client machine (or Outlook, if this is one of those things which
> Outlook tries to look after by itself, never mind how the rest of the
machine
> has been configured), to resolve names by DNS, not by using NetBios.
>
> Then it might sensibly look up the IP address of your POP3 server and send
a
> TCP packet to port 110 on it....
>
> Regards,
>
> Antony.
>
> -- 
> "Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
> Blaster].   However, these products are no longer supported.   Users of
these
> products are strongly encouraged to upgrade to later versions."
>
> (which *are* affected by MS Blaster...)
>
> http://www.microsoft.com/security/security_bulletins/ms03-026.asp
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>


