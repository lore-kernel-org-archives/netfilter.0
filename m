From: Bob Miller <bob@computerisms.ca>
Subject: Re: xt_ACCOUNT define many network by table
Date: Thu, 27 Jan 2011 10:43:45 -0800
Message-ID: <1296153825.2064.4727.camel@laplaplian>
References: <AANLkTik+=rifOKRpurA3da=OMe-Jp96Y=YMRC1itgmQ4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTik+=rifOKRpurA3da=OMe-Jp96Y=YMRC1itgmQ4@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: E2IA <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 2011-01-27 at 16:55 +0000, E2IA wrote:
> Hi,
> all I'm using xt_ACCOUNT for accounting on my linux box.
> I have two network 192.168.2.0/24 and 172.16.2.0/24. and i want to
> account these 2 network via table http.
> So i've made these two rules :
> rule 1:  iptables  -t mangle   -A  POSTROUTING   -m mark --mark  123
> -j ACCOUNT --addr  192.168.2.0/24  --tname http
> rule 2:  iptables  -t mangle   -A  POSTROUTING   -m mark --mark  123
> -j ACCOUNT --addr  172.16.2.0/24    --tname http
> 
> but when I enter the rule2 i got this error message :
> [282339.158532] ACCOUNT: Table http found, but IP/netmask mismatch.
> IP/netmask found: 192.168.2.0/255.255.255.0
> [282339.158670] ACCOUNT: Table insert problem. Aborting
> 
> I'm wondering and I'd like to know if there is mean to define a table
> for 2 deferent network.
> regards.
> --

And for the whole list:
My experimentation suggests that you would need two different tables for
two different --addr subnets.  However, I think you could use something
like this:

iptables  -t mangle   -A  POSTROUTING -s 192.168.2.0/24 -m mark --mark
123 -j ACCOUNT --addr  128.0.0.0/8  --tname http
iptables  -t mangle   -A  POSTROUTING -d 192.168.2.0/24 -m mark --mark
123 -j ACCOUNT --addr  128.0.0.0/8  --tname http
iptables -t mangle -A  POSTROUTING -s 172.16.2.0/24  -m mark --mark  123
-j ACCOUNT --addr  128.0.0.0/8   --tname http
iptables -t mangle -A  POSTROUTING -d 172.16.2.0/24  -m mark --mark  123
-j ACCOUNT --addr  128.0.0.0/8   --tname http

That is pure speculation based on a very loose understanding of ACCOUNT,
here is hoping it works...

> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Bob Miller
334-7117/660-5315
http://computerisms.ca
bob@computerisms.ca
Network, Internet, Server,
and Open Source Solutions

