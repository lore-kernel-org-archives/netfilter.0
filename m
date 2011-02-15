From: Jacky Lam <lamshuyin@gmail.com>
Subject: Re: Ebtables usage
Date: Tue, 15 Feb 2011 18:06:39 +0800
Message-ID: <AANLkTimR2FQfmmnoy6YoYYGCAqs=j26KpvtLTYHHgMQN@mail.gmail.com>
References: <AANLkTikpZ+q-L7AcYPmZzED3QAtNF-mDx47E5kfo41CW@mail.gmail.com>
	<AANLkTikBvMercRhMs-rpRBYurGUV4J3FHXigtBXBhdsc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=aKUukhDxMm6POAZ8RR+MvWym0C1kgYAt+kijBKfiJnI=;
        b=WbwyYFWNNFlgxd8jaM598khczchrFL9YjnJAmqLQNMhlP1oqMeeElqD8i2DJfNk2xT
         aCTNqp7ikJo3yLMEJz45FnoAWOj3+9Rjgv0GaoCcvjFVDsnToYGeRA+6pDqQu6EIOszI
         SFFPUIFz5x38+Kq469DChfVFmMzaKwTF9wXOw=
In-Reply-To: <AANLkTikBvMercRhMs-rpRBYurGUV4J3FHXigtBXBhdsc@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pandu Poluan <pandu@poluan.info>
Cc: netfilter@vger.kernel.org

Yes, my config is like this:

    Computer A (10.1.4.1) <-----> (eth0: 10.1.4.5) Linux Switch (eth1:
11.1.4.5) <-------> Computer B (11.1.4.3)

I each ip_forwarding and config the route table of Computer A,B. I get
500Mb/s from iperf while Linux Switch is 100% loaded.
As I know this switching is done in IP level, I want to do the job in
data link layer to get higher throughput/lower CPU usage.

Then I tried the following configuration:

    Computer A (10.1.4.1) <-----> (eth0) Linux Switch (eth1) <------->
Computer B (10.1.4.3)

I tried to setup a bridge like this as some document said:

iptables -t nat -A POSTROUTING -s 10.1.4.0/24 -d 10.1.4.0/24 -j ACCEPT
iptables -t nat -A POSTROUTING -s 10.1.4.0/24 -j MASQUERADE

brctl addbr br0
brctl stp br0 off
brctl addif br0 eth0
brctl addif br0 eth1

ifconfig eth0 0 0.0.0.0
ifconfig eth1 0 0.0.0.0
ifconfig br0 10.1.4.5 netmask 255.255.255.0 up

echo '1' > /proc/sys/net/ipv4/ip_forward

But the throughput is only 200Mb/s and my Linux Switch is 100% loaded.
What's wrong with that?


Jacky

On Tue, Feb 15, 2011 at 5:48 PM, Pandu Poluan <pandu@poluan.info> wrote=
:
> Have you set up Linux bridging?
>
> Here's a reasonably complete guide:
>
> http://tldp.org/HOWTO/Ethernet-Bridge-netfilter-HOWTO.html
>
> Rgds,
>
>
> On 2011-02-15, Jacky Lam <lamshuyin@gmail.com> wrote:
>> Hi,
>>
>> =A0 =A0 =A0I am a dummy about network administration. But I currentl=
y setup
>> my Linux box as a switch to forward the packet from eth0 to eth1. Bu=
t
>> I find the throughput is not good. It seems the overhead of IP stack
>> is too high. I want to know if ebtables can allow me to do the job
>> below IP level? If yes, can anyone show me how to setup up that?
>> Thanks very much.
>>
>> Jacky
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
>
> --
> --
> Pandu E Poluan - IT Optimizer
> My website: http://pandu.poluan.info/
>
