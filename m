From: Elison Niven <elison.niven@gmail.com>
Subject: Re: Limiting bandwidth on router
Date: Mon, 26 Jul 2010 10:00:23 +0530
Message-ID: <AANLkTimcuTQ5_ypQS-WWQeAyEWNeb0bq8crscwu+xgpC@mail.gmail.com>
References: <AANLkTik2ej_dxAnk8s5iq32BDC7YVPEZ+X7Sqr1xU+KH@mail.gmail.com>
	<4C4997CC.4010502@plouf.fr.eu.org>
	<AANLkTi=CW5-iB556Ei4x0rgnu5cpSdaGj5aHtNoQ41vS@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=n+cnQonLKOBcGxn1ZnoCZKrJ7BfCe5IpEn1Pe+cgx7s=;
        b=W5Kfew6k+T9bdn2CYJJ/Sw1RNiJrbyT5F59ZP9WtvIVaxmxPxIRY8/+DQSaDjOPH8q
         ZCZ23FA5d/yD3iF0i8vx2HdlKf9oHLjqmGJeCaNLMSwogrbYpx+mXi7G7GtlFbltfmxE
         Zg1XKw91xBMsn/SEnV0ox8A8F4JWCdJbuSWt0=
In-Reply-To: <AANLkTi=CW5-iB556Ei4x0rgnu5cpSdaGj5aHtNoQ41vS@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Sat, Jul 24, 2010 at 9:19 PM, Elison Niven <elison.niven@gmail.com> =
wrote:
> On Fri, Jul 23, 2010 at 6:53 PM, Pascal Hambourg
> <pascal.mail@plouf.fr.eu.org> wrote:
>> Hello,
>>
>> Elison Niven a =E9crit :
>>>
>>> I have an ARM based board with 2 ethernet interfaces eth0 and eth1.
>>> eth0 - LAN interface. 192.168.2.149
>>> eth1 - WAN interface. 192.168.1.149
>>> I have setup a simple router using iptables that allows PCs on the =
LAN
>>> to browse the internet via the WAN.
>>> I want to limit incoming bandwidth on the LAN interface to about
>>> 8mbit/s as when there are massive data transfers initiating from th=
e
>>> PCs on the LAN, the system is under heavy load and is not able to
>>> execute any applications.
>>>
>>> I tried to limit the bandwidth using tc's tbf and ingress but it is=
n't
>>> really working well.
>>> For example from a PC on the LAN (ip 192.168.2.13, default gw
>>> 192.168.2.149)
>>> # ping -f -s 1000 192.168.1.3
>>> This is correctly limited and ping results show the loss.
>>>
>>> # ping -f -s 1 192.168.1.3
>>> Here the system is under heavy load and is not able to execute any
>>> applications. No loss in ping.
>>
>> This result may indicate that the router's load depends more on the =
packet
>> rate than the bandwidth, which makes sense. So it may be more effici=
ent to
>> limit the packet rate instead of the bandwidth.
>>
>>> Also when I create a udp socket from this PC to an address on the W=
AN,
>>> the rate is not limited.
>>> #./udpclient 20000 192.168.1.3 20000 1000
>>> This utility sends 20000 packets of 1000 bytes each to 192.168.1.3.
>>> Here also the rate is not limited.
>>
>> I did not understand well whether you want to limit incoming (WAN to=
 LAN) or
>> outgoing (LAN to WAN) traffic. The ping test above does not tell whe=
ther
>> incoming (echo reply) or outgoing (echo request) traffic is limited.

Here I need to limit the outgoing (LAN to WAN) traffic by dropping
incoming packets at the LAN interface.
Also the WAN to LAN traffic (ex. users of PCs on the LAN network
downloading files from the internet available by WAN) should also be
limited to 8mbit/s.

>> Also, remember that by definition received traffic rate cannot be di=
rectly
>> controlled. All you can do is drop incoming packets. Due to TCP
>> acknowledgement and congestion control mechanism, the sender will in=
terpret
>> the packet loss as congestion and reduce the sending rate. But UDP h=
as no
>> such mechanism. Anyway, does this really matter ? If the heavy data
>> transfers use TCP, it should work. Did you test it ?

I still have to test for TCP.
Here are the iptables rules I have set up for the router:

LAN=3Deth0
WAN=3Deth1
WAN_IP=3D"192.168.1.149"
# Flush everything
iptables -t filter -F
iptables -t filter -F INPUT
iptables -t filter -F OUTPUT
iptables -t filter -F FORWARD
iptables -t nat -F
iptables -t nat -F OUTPUT
iptables -t nat -F PREROUTING
iptables -t nat -F POSTROUTING
# Forwarding
iptables -A FORWARD -i $LAN -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
# Postrouting
iptables -t nat -A POSTROUTING -o $WAN -j SNAT --to-source $WAN_IP

And here are the tc rules:
# tbf on WAN
tc qdisc add dev $WAN root tbf rate 8mbit latency 50ms burst 1500
# ingress on LAN
tc qdisc add dev $LAN handle ffff:ingress
tc filter add dev $LAN parent ffff: protocol ip prio 50 \
u32 match ip src 0.0.0.0/0 \
police rate 8mbit burst 1k \
drop flowid :1

Thanks,
Elison
