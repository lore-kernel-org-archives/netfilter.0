From: Dimitri Yioulos <dyioulos@onpointfc.com>
Subject: Re: Dual WAN set-up
Date: Fri, 13 Jan 2012 06:47:54 -0500
Message-ID: <201201130647.54303.dyioulos@onpointfc.com>
References: <201201121651.18887.dyioulos@onpointfc.com> <op.v7zujutux1lyi3@debiandesk2.net> <1326439545.2182.17.camel@andrew-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1326439545.2182.17.camel@andrew-desktop>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Friday 13 January 2012 2:25:45 am Andrew Beverley wrote:
> Thanks for the comprehensive answer Lloyd. A couple of minor 
points:
> > 2. You would set up a custom routing table for the special
> > DMZ traffic. Use the info in the above link to do that. 
> > Suppose it is called "DMZSPECIAL".  You will set up routing
> > to the new DMZ interface using the MYDMZ table, something
> > like this:
> >
> > 	ip route add 10.x.x.x/8 dev ${DMZinterface} src ${wan} table
> > DMZSPECIAL ip route add default via ${gateway} dev
> > ${interface} table DMZSPECIAL
>
> [...]
>
> > 3. You would NEW mark all packets from the special DMZ hosts
> > with fwmark 1, like this (repeat for each source IP or subnet
> > to use the new interface):
>
> Using marks is one way to do this, and provides plenty of
> flexibility. However, if all the traffic is coming from the
> same IP address / interface, then you should be able to use
> straight iproute2 rules to match those aspects, without even
> touching iptables (see ip rule).
>
> > 	iptables -t mangle -A PREROUTING -m state --state NEW
> > -s 10.x.x.x -j CONNMARK1
>
> Also, if you do decide to use netfilter marks (which is
> certainly no bad thing IMHO), then you probably don't need to
> mark connections and then restore them. Instead just mark a
> packet straight away:
>
> iptables -t mangle -A PREROUTING -s 10.x.x.x -j MARK --set-mark
> 1
>
> Andy
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> netfilter" in the body of a message to
> majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html


Thanks to you both.  I'll go over your suggestions, and try to 
implement this asap.  Please stand by as I may need additional 
hand-holding :-)  .

Dimitri

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

