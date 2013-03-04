From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: brouting different VLANs
Date: Mon, 4 Mar 2013 14:06:16 -0400
Message-ID: <CACuyg26HeDM2LjZV=MZSYjJM9Z9WnJGGRXp5-BjUcjWuTYaejQ@mail.gmail.com>
References: <CAB_DuvBof5krc-1J2iCA0zn4qc6vgOGD6O9OsmY+7oEfNfrv3Q@mail.gmail.com>
	<5133379A.7060803@plouf.fr.eu.org>
	<CAB_DuvCOyACnPxUAPY_j287BpjixZ9OmFP5y1Y+63AG8+TaeUQ@mail.gmail.com>
	<CACuyg24Rs7e=8yG7z9kmcEntHGBOG0ch7uMppUH_h-nBEcKg8Q@mail.gmail.com>
	<CAB_DuvD1vSGu8mgbSB=LrrMWZ8-wJ0v+9Hnwp+XbDjpa6jO5aw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=TxZn0UPQF7350dFT9G0ZYQIhRqdiqjByZKOcsKhUxos=;
        b=fxsofLl87jC3F/vcNZUkXDieqmZmYwPjJsUYertcdzFMOXP6T1KYAyR80DUjF7He8M
         ONCYfQkxaJ3qLGM/FP7sCnwYPIp8nH1ISDpv939RDiwxE8LSx1bFvM2qeMxaBEAvBXIo
         UFsk8INlurKCvv8enTeIbhERSLIAeaKgyh5rteFnrwR9nNK0tHTdt30MQ28MIyXOXq95
         v/hUtVIjwepA4cl/kX4FJeLLmKN79mfLaJoqM+v6SZNwSP/Puwg7aZ1E/T7XCGf4IW4z
         dNHb2fiZA0k10RbiP99ZprkwSNJ6o+CRqp47D8fQN/0RlvxOEKuYjLc8K5rp4V+pxv7H
         xyXQ==
In-Reply-To: <CAB_DuvD1vSGu8mgbSB=LrrMWZ8-wJ0v+9Hnwp+XbDjpa6jO5aw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dovydas Sankauskas <laisve@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

I didn't set up a bridge-firewall for some time, but...

1. When you "drop" BROUTING chain, you are telling to linux kernel
that the "packet forward" is only possible by IP routing. It's how to
disable the bridge for a given condition (your firewall rule). So, I
don't understand the problem with the ARP.

2. But, your first rules are "blocking" IP routing.
I do not understand why these rules:
ebtables-A FORWARD -i bond0.10 -j DROP
ebtables-A FORWARD -i bond0.20 -j DROP

"I used something like this to block transparently - thats the main
purpose of a bridge-firewall".

3. It would be simpler and more logical to work with two different subnets.

I found very interesting your logic, but it is something that I avoid.
IMHO: In this way you are very exposed with ARP problems.


2013/3/4 Dovydas Sankauskas <laisve@gmail.com>:
> Hi,
>
> If I broute all packets (including ARP) then I get the following results:
>
> 1. Customer1 sends echo-request from 10.0.0.10 to 8.8.8.8.
> 2. Linux router receives this ping on eth0 which handles it to bond0
> which recognizes vlan10 tag and handles it to bond0.10 which broutes
> it to br0.
> 3. Then router sends arp who-has with customer1 MAC address from br0
> interface which handles it to both bridge ports bond0.10 and bond0.20
> which tags it with respective vlan tags and handles it to bond0 which
> handles it to eth0 which sends it out on the wire.
> 4. Customer replies with arp reply is-at with his MAC address.
> 5. Linux router receives this arp reply on eth0 which handles it to
> bond0 which recognizes vlan10 tag and handles it to bond0.10. However
> my arp reply doesn't go up to br0 from here.
>
> After I add this rule:
> ebtables -t broute -A BROUTING -p ! arp -i bond0.10 -j DROP
>
> Now arp reply goes up to br0 and I can see customer1 MAC in ip
> neighbor table. Now internet works fine.
>
> You say my config is something unusual? After a few days of reading
> manuals and then trial and error this is how I've managed to connect
> customer1 to the internet.
>
>
>
> --
> Dovydas Sankauskas
