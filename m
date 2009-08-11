From: Elison Niven <elison.niven@gmail.com>
Subject: Re: Get source IP of packet through PREROUTING CHAIN
Date: Tue, 11 Aug 2009 19:07:04 +0530
Message-ID: <21df6cb70908110637s60abb999y5358fd22eeb89486@mail.gmail.com>
References: <21df6cb70908102139i1f0f21besc94740ed507615da@mail.gmail.com>
	 <4A8165BB.7060702@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=P6eIswRcJjZC0WO533uo1pl8ht5IpUaoJTrTwSax42Q=;
        b=HbhlGkLn6AZsyxqMYH4/sK3j3EP2ayYKhRWXmjFdoUyqeg/T627vJDvSlNCI+dzVOz
         Ikg0MzGXcG8eDcxs49SKioy/mi20uuxfB/vKjWUkK9GHaUD827czBTZwFwgbkYchQpxJ
         tpszmJmWP+CWvVAJdBko88ordot/C7G99zGqo=
In-Reply-To: <4A8165BB.7060702@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: elison.niven@matrixtelesol.com

Hi,

What I need is to be able to know the source IP and port of the
packets received at a particular port (10000 here) in user space
through a C language interface or may be can I read somewhere from the
proc directory?

=46or example,

Machine X <------>| Network |<------->(eth0) My Machine (eth1) <----->M=
achine A
Machine Y <------>|             |

Machine X - 192.168.1.13
Machine Y - 192.168.1.14

My Machine eth0 - 192.168.1.100
My Machine eth1 - 172.16.1.100

Machine A - 172.16.1.200 is a slave device controlled by my machine.

My machine receives some packets on port 10000 on eth0. Its job is to
simply forward them to Machine A. It does so by

iptables -t nat -I PREROUTING -i eth0 -p udp \
      --dport 10000 -j DNAT --to-destination 172.16.1.200

Machine A is configured to send packets to Machine X. My machine is
default gateway for Machine A.

I do masquerading on eth0 and forwarding is enabled - eth1 to eth0.

Now I need that in case Machine Y is sending on port 10000 instead of
Machine X, I should have the *choice* whether to configure Machine A
continue sending to X or instead now configure it to send to Machine
Y.

Hope I am clear,
Elison

2009/8/11 G=E1sp=E1r Lajos <swifty@freemail.hu>:
> Hi Elison,
>
> The conntrack subsystem knows about every connection.
> So maybe you need to check that.
>
> Elison Niven =EDrta:
>>
>> Hi List,
>>
>> I have two interfaces eth0 and eth1 on my machine.
>>
>> My machine has eth0 =3D 192.168.1.100 and eth1 =3D 172.16.1.100
>>
>> The scenario is that I will be receiving packets at port 10000 on et=
h0
>> of my machine. I do not know from which IP the packets are being
>> received (Can be any machine - I do not need to apply a source addre=
ss
>> matching rule).
>>
>
> You may not know the source IP, but your machine will, because it see=
s the
> packets coming from eth0's network.
>>
>> I need to forward these packets to another machine B that I do so wi=
th
>> this rule:
>>
>> iptables -t nat -I PREROUTING -i eth0 -p udp \
>> =A0 =A0 =A0 --dport 10000 -j DNAT --to-destination 172.16.1.200
>>
>> Note that I have not added any -s option to the rule for source
>> address matching.
>>
>> This also works properly. Now I need to _know_ the source IP and
>> source Port of the packets that are being received at port 10000 on
>> eth0. (For example to send some data back to the _same_machine_ that
>> is sending packets at port 10000)
>>
>
> Again. If the conntrack (in your machine) knows the source IP/port nu=
mbers
> then it will automagically replace them on the backroute.
> It may be also a problem if your response packets are not SNAT-ed. (I=
n the
> case the sender machines sending the packets directly to your machine=
=2E)
>>
>> How do I achieve this?
>>
>> Best Regards,
>> Elison
>>
>
> Swifty
>
