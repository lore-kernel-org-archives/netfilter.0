From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: Nat with a dynamic IP
Date: Fri, 5 Sep 2003 11:36:09 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <035101c373bb$0c2b9fd0$49caa8c0@caris.priv>
References: <032001c373b2$5daabf70$49caa8c0@caris.priv> <200309051605.36015.tscherf@web.de>
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
To: Thorsten Scherf <tscherf@web.de>
Cc: netfilter@lists.netfilter.org

That is a pretty good solution for the SNAT.  I never thought about MASQ.
However .... I am not sure if the DNAT is the best solution ....  WHat if
you had multiple ip numbers on the external card ....

More importantly, what about trying to connect directly to the firewall from
an external address.

----- Original Message -----
From: "Thorsten Scherf" <tscherf@web.de>
To: "Peter Marshall" <peter.marshall@caris.com>
Cc: <netfilter@lists.netfilter.org>
Sent: Friday, September 05, 2003 11:05 AM
Subject: Re: Nat with a dynamic IP


> >Hi.  I was wondering if someone could tell me what a good way is to set
up
> >DNAT and SNAT on a firewall if the external IP is not static ....
>
> Do not use SNAT, use Maquerading. You don't have to know your external IP
> here:
>
> iptables -t nat -A POSTROUTING -s $INT_NET -o $EXT_DEV -j MASQ
>
> DNAT is also very simple, don't specify your external IP in DNAT Rule,
just
> the Destination Port:
>
> iptables -t nat -A PREROUTING -p tcp --dport 25 -i $EXT_DEV -j DNAT
> --to-destination $SMTP_SERVER
>
>
> Greetings,
>
> Thorsten Scherf,
> RHCE, RHCX
>
>
>
>


