From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: invert problem with multiport
Date: Tue, 18 Jun 2002 17:18:37 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206181618.RAA27678@slate.rockstone.co.uk>
References: <3D0F56B9.5952D779@conterra.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D0F56B9.5952D779@conterra.de>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Tuesday 18 June 2002 4:50 pm, Christoph Gossen wrote:

> Hello,
>
> I think there's a bug in the behaviour of the multiport module - for
> example, a line like
>
>         iptables -p tcp -A OUTPUT -m multiport ! --dport 25 -j DROP
>
> causes the same behaviour as
>
>         iptables -p tcp -A OUTPUT -m multiport --dport 25 -j DROP
>
> or
>
>         iptables -p tcp -A OUTPUT --dport 25 -j DROP
>
> and NOT (as one would expect) that one caused by
>
>         iptables -p tcp -A OUTPUT ! --dport 25 -j DROP
>
> Inverting the (set of) port(s) due to the "!" sign in the first line
> above is just ignored
> (no syntax error occures)!
>
> Any comments?

I don't use the multiport match myself, but I'd expect it to be:

iptables -p tcp -A OUTPUT -m multiport --dport ! 25 -j DROP

In other words "a destination port which isn't 25"....

What does that do for you ?

I note from the man page for iptables, though, that --dport has the [ ! ] 
option, but "multiport --dport" doesn't, so maybe negating multiports is not 
supported at all ?

If you enter all the above rules, what do you get from

iptables -L OUTPUT -v -n ?

 

Antony.

