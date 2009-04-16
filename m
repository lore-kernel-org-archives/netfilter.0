From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: FORWARD -P DROP + allow MSN
Date: Thu, 16 Apr 2009 12:10:05 +0200
Message-ID: <49E703FD.80100@chello.at>
References: <49E6FAB3.90304@lab.vectoris.fr>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49E6FAB3.90304@lab.vectoris.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Mihamina Rakotomandimby (R12y) wrote:
> Hi,
> These are my current rules:
> http://lab.vectoris.fr/projects/vectoris/browser/IPTables/trunk/firewall
> (It's a big mess yet because I miss one feature: MSN. I'll clean it 
> later)
>
> The box it's running on is the gateway of the LAN to the Internet.
>
> As you noticed, FORWARD is DROP by default.
>
> I would like to allow MSN to my LAN users.
>
> The problem:
> If I "FORWARD -P ACCEPT", MSN works for the LAN users.
>
> If I use it as it is now, MSN doesnt work.
>
> Anyway, when setting the MSN LAN clients to use HTTP, it's OK with 
> this config.
>
> Any tips?
> Thank you.
>
> PS: no comments on the crappy Facebook DROP ;-).

Hello,

first let me spend a few words on your current ruleset:

- The whole forwarding is stateless!
I strongly suggest to change that.
Allow that ports for your lan with something like that:
iptables -A FORWARD -i $WAN -o $LAN -d $ACCEPTED_MACHINE -m state 
--state ESTABLISHED,RELATED -j ACCEPT

this is the general 'allow all back in, which is tracked by the state 
machine' match.
now your ports:
iptables -A FORWARD -i $LAN -o $WAN -s $ACCEPTED_MACHINE -p tcp -m 
multiport --dports x,y,z... -m state --state NEW,ESTABLISHED -j ACCEPT

[...]
Same thing maybe on your $ACCEPTED_PORT in INPUT chain.

- Don't allow all icmp. Do you want your firewall to accept icmp 
redirects? Guess not...

- I will say some about the Facebook drop:
$IPT -A INPUT   -p tcp -i $LAN         --destination  $IP_FACEBOOK -j DROP
is completely unnecessary. Will never match, unless your box holds a 
Facebook hosts IP.

Now, let me think about the MSN thing. Personally I never used it, and 
don't know what configuration it may need. Didn't try to look it up now too.
But, one thing I noticed:
You REDIRECT all port 80 traffic to the local port 3128. HTTP proxy I 
guess...
Now MSN uses all those ports and as it looks port 80.
If now port 80 traffic goes over the http proxy and the rest of the 
traffic does not, that may cause the MSN applications to fail.
How about a socks proxy for MSN? I just guess client applications will 
have such a feature. In that case, your socks proxy does all the work, 
and you only have to open that port on the inside of the lan.

Hope it helps...

greets

Mart

