From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: Re: port forwarding question
Date: Mon, 17 Mar 2008 16:01:10 -0400
Message-ID: <cvitt396akcq0fug8g5rnqfo7a5pe9m81s@4ax.com>
References: <1205771195.2681.14.camel@dev002.ctekproducts.com> <Pine.LNX.4.64.0803171912010.18817@fbirervta.pbzchgretzou.qr> <1205778745.9569.12.camel@wtprit0036.m2sys.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

> > >I thought I could do the following but it does not work:
> > >
> > >iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 5080:5085 -j DNAT
> > >--to 192.168.1.10:80-85
> > >
> > >Is there a way to do what I want to do with a single command or do I
> > >have to forward each port with an individual command?
> > 
> > To do it with a single rule requires your own target extension.
> > 
> > :80-85 just tells it to choose any one of it.
> 
> AFAIK, don't exist any single command to do that... What exists, is
> NETMAP target that DNAT/SNAT every single address in two ranges. 
> i.e: "iptables -t mangle -A PREROUTING -s 192.168.1.0/24 -j NETMAP --to
> 10.5.6.0/24"
> 
> If anyone knows any command that do this, I'll be pleased to know too...
> If don't, this is a good feature to implement in futures versions of
> IPTables.

It doesn't seem like a high priority for iptables, since the same thing can
easily and more flexibly be accomplished with some bash scripting:

for (( i=80 ; i<=85 ; ++i ))
do
  iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport $(( 5000+i )) \
    -j DNAT --to 192.168.1.10:$i
done

Yes, that is 6 iptables rules, but the performance difference is probably
negligible, it's simple to code, and it's totally customizable to the user's
needs.  A specially written iptables target, OTOH, would require a whole
separate kernel module just to cover this one fairly unusual transformation.

Andrew.

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
