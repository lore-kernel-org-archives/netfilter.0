From: Jacky Lam <lamshuyin@gmail.com>
Subject: Re: Ebtables usage
Date: Wed, 16 Feb 2011 06:53:39 +0800
Message-ID: <AANLkTikarsE3D+pyj_xKtR1F-Dy32+BKCiKWRZo18HMC@mail.gmail.com>
References: <AANLkTikpZ+q-L7AcYPmZzED3QAtNF-mDx47E5kfo41CW@mail.gmail.com>
	<AANLkTikBvMercRhMs-rpRBYurGUV4J3FHXigtBXBhdsc@mail.gmail.com>
	<AANLkTimR2FQfmmnoy6YoYYGCAqs=j26KpvtLTYHHgMQN@mail.gmail.com>
	<4D5A59D9.9040407@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=o9N46xrpuQKe1BMj9NPOPJKpoqKEgRrhgSEch8mszxI=;
        b=nhUSczF+72FUYKmjXKehwStH2Jo+FlenwImzVuOYHKLccwm23aNsksIo4nkdRlQA/k
         qyzk08qOW7uYBgC2HOKvrrWTCon8L2NuoKI2a6rDfB2GgklM4lnzoR2nwOsMlwYtiASp
         CmahAzgNKSNEz8bjZPzLdTLyjw4fbJ+NJksAM=
In-Reply-To: <4D5A59D9.9040407@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

I want to share a network service by two computers but I don't have
any extra router or switch, but one computer has 2 ethernet cards and
running Linux. But that computer is old and slow. So I want to know if
I can set up that computer as a ethernet level switch/bridge.

That means I am done right (except the two rules at the beginning) to
setup a ethernet switch? I don't need to setup any rules by iptables
or ebtables?

Thanks for helping.

On Tue, Feb 15, 2011 at 6:47 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> Jacky Lam a =E9crit :
>> Yes, my config is like this:
>>
>> =A0 =A0 Computer A (10.1.4.1) <-----> (eth0: 10.1.4.5) Linux Switch =
(eth1:
>> 11.1.4.5) <-------> Computer B (11.1.4.3)
>>
>> I each ip_forwarding and config the route table of Computer A,B. I g=
et
>> 500Mb/s from iperf while Linux Switch is 100% loaded.
>> As I know this switching is done in IP level,
>
> Your box is set up as a router, not a switch/bridge. Routing is done =
at
> the IP level, and switching/bridging is done at the ethernet level.
>
>> I want to do the job in
>> data link layer to get higher throughput/lower CPU usage.
>
> Not sure you'll get higher throughput though. Bridging adds its own
> overhead.
>
>> Then I tried the following configuration:
>>
>> =A0 =A0 Computer A (10.1.4.1) <-----> (eth0) Linux Switch (eth1) <--=
----->
>> Computer B (10.1.4.3)
>>
>> I tried to setup a bridge like this as some document said:
>>
>> iptables -t nat -A POSTROUTING -s 10.1.4.0/24 -d 10.1.4.0/24 -j ACCE=
PT
>> iptables -t nat -A POSTROUTING -s 10.1.4.0/24 -j MASQUERADE
>
> What do you need these rules for ? They are not needed for pure bridg=
ing.
>
>> brctl addbr br0
>> brctl stp br0 off
>> brctl addif br0 eth0
>> brctl addif br0 eth1
>>
>> ifconfig eth0 0 0.0.0.0
>> ifconfig eth1 0 0.0.0.0
>
> Ok.
>
>> ifconfig br0 10.1.4.5 netmask 255.255.255.0 up
>>
>> echo '1' > /proc/sys/net/ipv4/ip_forward
>
> This is IP-related and not required for pure bridging.
>
>> But the throughput is only 200Mb/s and my Linux Switch is 100% loade=
d.
>> What's wrong with that?
>
> It may be the overhead caused by bridge-nf, netfilter, IPv4 conntrack
> and iptables.
> Try with /proc/sys/net/bridge/bridge-nf-call-iptables set to 0.
>
> You did not explain what you want to do exactly with this box.
>
