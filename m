From: Dovydas Sankauskas <laisve@gmail.com>
Subject: Re: brouting different VLANs
Date: Mon, 4 Mar 2013 16:46:06 +0200
Message-ID: <CAB_DuvD1vSGu8mgbSB=LrrMWZ8-wJ0v+9Hnwp+XbDjpa6jO5aw@mail.gmail.com>
References: <CAB_DuvBof5krc-1J2iCA0zn4qc6vgOGD6O9OsmY+7oEfNfrv3Q@mail.gmail.com>
	<5133379A.7060803@plouf.fr.eu.org>
	<CAB_DuvCOyACnPxUAPY_j287BpjixZ9OmFP5y1Y+63AG8+TaeUQ@mail.gmail.com>
	<CACuyg24Rs7e=8yG7z9kmcEntHGBOG0ch7uMppUH_h-nBEcKg8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type:content-transfer-encoding;
        bh=z+xRnLJBl2zf0taAZIdm6Jg11mP32xLhRaPD5dzRjMs=;
        b=tRSWjQxYiSBqEZV+7AWdKpeicYdE67AjS2bMY+4rCzWp49wu4ZsfyfZJLq8YNUOCCB
         dWQf1Iyj3O3vB2zCkSAc1Q/RmP/GlkFH23sJS95XLYoR2eDjqd3pLMjjZElIoJqAVvm5
         lrmxIRmMwdXcx2Wzd1lLNMOOvAOKTiarlMXiik00Ty45NKLjFWxUgUiwAGJCVEwIWEyi
         mxdtBHFLaXZdCCAXk0X2W7NnfLCEGhIInJ+/7nx/H57QouLrsSqauaQOQyn4kNjv7okZ
         QtuX7bjZNGDZcDyimcAp5kLjj7mMpMhBnhF3ekEYQGdOH9rYdsLPNWuuAxGD1JBC3X90
         FRgg==
In-Reply-To: <CACuyg24Rs7e=8yG7z9kmcEntHGBOG0ch7uMppUH_h-nBEcKg8Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: =?UTF-8?Q?Humberto_Juc=C3=A1?= <betolj@gmail.com>
Cc: netfilter@vger.kernel.org

2013/3/4 Humberto Juc=C3=A1 <betolj@gmail.com>:
> Hi,
>
> I'm not sure if I understand right.
> This configuration is not very common and I've never tried something =
like this.
> The arp traffic by bridge will not work because the VLANs are
> different, but with proxy-arp your firewall becomes arp router - can
> it work.
>
> ebtables -t broute -A BROUTING -i bond0.10 -j DROP
> ebtables -t broute -A BROUTING -i bond0.20 -j DROP
>
> echo 0 > /proc/sys/net/ipv4/conf/bond0.10/rp_filter
> echo 0 > /proc/sys/net/ipv4/conf/bond0.20/rp_filter
> echo 0 > /proc/sys/net/ipv4/conf/br0/rp_filter
>
> echo 1 > /proc/sys/net/ipv4/conf/br0/proxy_arp
>
> I chose the br0 interface (proxy_arp), because the logical
> configuration of the network is defined in br0.
> I don't know if works!
>
>

Hi,

If I broute all packets (including ARP) then I get the following result=
s:

1. Customer1 sends echo-request from 10.0.0.10 to 8.8.8.8.
2. Linux router receives this ping on eth0 which handles it to bond0
which recognizes vlan10 tag and handles it to bond0.10 which broutes
it to br0.
3. Then router sends arp who-has with customer1 MAC address from br0
interface which handles it to both bridge ports bond0.10 and bond0.20
which tags it with respective vlan tags and handles it to bond0 which
handles it to eth0 which sends it out on the wire.
4. Customer replies with arp reply is-at with his MAC address.
5. Linux router receives this arp reply on eth0 which handles it to
bond0 which recognizes vlan10 tag and handles it to bond0.10. However
my arp reply doesn't go up to br0 from here.

After I add this rule:
ebtables -t broute -A BROUTING -p ! arp -i bond0.10 -j DROP

Now arp reply goes up to br0 and I can see customer1 MAC in ip
neighbor table. Now internet works fine.

You say my config is something unusual? After a few days of reading
manuals and then trial and error this is how I've managed to connect
customer1 to the internet.



--=20
Dovydas Sankauskas
