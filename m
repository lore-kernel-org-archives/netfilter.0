From: Jason Williams <jwilliams@courtesymortgage.com>
Subject: Re: Second shot at IPTables script
Date: Fri, 17 Dec 2004 14:37:57 -0800
Message-ID: <6.1.2.0.0.20041217143032.025241e8@corpmail.courtesymortgage.com>
References: <6.1.2.0.0.20041217130746.026796b0@corpmail.courtesymortgage.com>
	<1103319685.3262.34.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1103319685.3262.34.camel@hubcap.ljm.dom>
References: <6.1.2.0.0.20041217130746.026796b0@corpmail.courtesymortgage.com>
	<1103319685.3262.34.camel@hubcap.ljm.dom>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org


> > $IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT
>
>you really want to allow unlimited access to your firewall from your
>internal network?

Probably not. Just want to allow my LAN access to the internet (private 
home LAN) and to use whatever services as needed: 80, 443, 21, ssh etc.
Recommend better rule?

>stylistic note:  the "-p ALL" is unnecessary.  seems to be awfully
>popular amongst those that post their rules here, but it's just more
>stuff to read, type, and possibly mistype...no biggie, though.

Good tip to know. Would you recommend -p tcp instead?

> > $IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
> >
> >
> > # Rules for incoming packets from the internet.
> >
>  ...snip...
> >... initiate connections
> > first. Nothing should be accepted back unless a connection originated from
> > the firewall, correct?
>
>yes.  another stylistic thing:  a "-i $INET_IFACE" would make this rule
>more consistent with what i believe to be your intent.

change this:
$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state ESTABLISHED,RELATED 
-j ACCEPT

to this;

$IPTABLES -A INPUT -p ALL -i $INET_IFACE -m state --state 
ESTABLISHED,RELATED -j ACCEPT

or, as you use:

$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


> > This would allow pings to work, ftp, package
> > grabbing, patches etc. Am I correct?
>
>as long as your allowing the connection initiation to happen in OUTPUT
>(which you are below), yes.
>
>personally--i use something more along the lines of:
>
>   iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
>as my first rule to make it interface and IP agnostic, and handle
>source/destination verification in a separate chain.

Good point.


> > # Accept the packets we actually want to forward
> >
> > $IPTABLES -A FORWARD -i $LAN_IFACE -o $INET_IFACE -s $LAN_IP -j ACCEPT
>
>i think you meant to have "$LAN_IP_RANGE" not "$LAN_IP" there.

Oops. :)


> > $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
>90% of you packets will match the state rule.  a good performance-tuning
>habit to get into is to make this the first rule in the chain.

Hmm. Didn't think about that. I'll remember that one.


> > Accept traffic from my private LAN.
> >
> > # Special OUTPUT rules to decide which IP's to allow.
> >
> > $IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
> > $IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
> > $IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT
> >
> > To allow outbound traffic. This correct? I had question here.
>
>errr...how about:
>
>   iptables -A OUTPUT -j ACCEPT
>
>or just:
>
>   iptables -P OUTPUT ACCEPT
>
>if someone can change the source IP of packets associated with
>locally-generated packets, you have bigger problems than a firewall rule
>that checks source IPs.


So I could remove those three above and just put:

$IPTABLES -A OUTPUT -j ACCEPT

and that should do it?

I am amazed at the complexity and power that one has with IPTables. It 
really is quite astonishing (a good thing). The level of flexibility, 
customization is mind boggling. I look forward to further getting involved 
with IPTables.

Thanks for your help.

Jason



