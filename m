From: Bojan Sukalo <shukalo83@gmail.com>
Subject: Re: Natting html traffic
Date: Sat, 13 Feb 2010 16:29:26 +0100
Message-ID: <368e93c51002130729n4ef2b669r30c6ee64c2077df7@mail.gmail.com>
References: <368e93c51002121503y2bf70ddbh85c0c377356a345@mail.gmail.com>
	 <1266016722.2980.159.camel@tesla.lan>
	 <1266027202.3899.1.camel@casper.meteor.dp.ua>
	 <33be4bb31002130208p53b4db41j1e46b3a3920b1fa4@mail.gmail.com>
	 <368e93c51002130422la851213ud93649e9ccc5519c@mail.gmail.com>
	 <1266072434.2916.46.camel@tesla.lan>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=/m7xvK6q5QjZKzgKRxzGue+iXKKu7ju6e5LHIsBU9Hs=;
        b=FnZI3S9JlDxl1LaedBnA5VLUe7p8iGi7I1jECdvGMn54WDj8OF91CnFT/sUGkijUKW
         JLm1BlGGWGU2QsA+wAvnAWuZrvh1/AxTAJ2sP8WRkKEoDXaVxEkez5I9d8mpLbr7+PYw
         Pm+AQ5+IA0d20Jx9HiY0vGYnbfoyFki0TTTso=
In-Reply-To: <1266072434.2916.46.camel@tesla.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guido Trentalancia <guido@trentalancia.com>
Cc: netfilter@vger.kernel.org

Hello Guido,

> The last three entries are not very secure. In particular, the first two
> leave all ports open, while in a real situation you'd better have an
> entry for each allowed service/port (by adding "-m state --state NEW -m
> tcp -p tcp --dport ALLOWED_SERVICE_PORT", substituting
> ALLOWED_SERVICE_PORT with the service you need and perhaps removing -d
> 0/0).

I know that my rules are not the best regarding the security and I
will take care about that when I have basic functionality. That is, in
theory when I apply the rules we are talking about I should have
proper http traffic from inside to the internet. That's just not
happening here.

> And remember to do "echo 1 > /proc/sys/net/ipv4/ip_forward" to enable
> forwarding.

I have ipforwarding enabled. (Remember, I have working opnvpn
connection going from tap0 interface to eth1)
The only thing I dont have is tcp traffic from inside to internet.


>> iptables -t mangle -A FORWARD -i eth1 -o eth0 -p tcp --tcp-flags
>> SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
>
> What do you want to achieve with the last rule ?

I tried to set mss in my last rule because this type of problem
(acording to iptables man page) can happen because of bigger mss
values and fragmenting packets after that.
When I say this type of problem I mean "established tcp session but no
traffic after that"

> iptables -A POSTROUTING -t nat -s 192.168.60.0/24 -o eth0 -j MASQUERADE
>
> because amongst other things, if you use SNAT then you would also need
> DNAT !

I have used -j SNAT because it's recomended way in iptables man page
when you have static ip address on outside interface. -j DNAT is used
when you want to portforward inside.

Bojan
