From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: tc and CONNMARK
Date: Tue, 06 Oct 2009 15:08:38 +0200
Message-ID: <4ACB4156.5030608@unipex.it>
References: <4AC9BD2E.301@duet.it> <4AC9FF4E.5010307@unipex.it> <4ACA04DF.3030006@duet.it> <4ACA1D55.1020304@unipex.it> <4ACB2FA0.30301@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ACB2FA0.30301@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fabio Marcone <fabio.marcone@duet.it>
Cc: netfilter@vger.kernel.org

Fabio Marcone ha scritto:
> hello,
>> For me it's better if you use different marks.
> 
> I note that packets are marked correctly but in the wan interface tc 
> filter send them on the wrong class. is the same problem you had it?
> 
> 
If I remember correctly, yes.

> iptables -t mangle -A PREROUTING -p TCP -m mac --mac-source 
> xx:xx:xx:xx:xx:xx--dport 443 -j MARK --set-mark 8
> 

Why not forward or postrouting? Do you choose prerouting for use the mac 
addrs?

> iptables version: 1.4.3.2 kernel version: 2.6.29.3
> 
> both patched to use IMQ devices.

Haven't you said this!
In _all_ my installations, I always skip to use imq. I don't know why,
but it's simple to use that are already included inside the vanilla kernel

>> 
>> Normally I don't use connmark because when I try some time ago to 
>> use it, I found some "not marked" problems, so I switch to classid.
>>  Better and cleaner for me.
> what kind of problems?

ip filter don't match my data. But it's true that I didn't lost a lot of
time following that solution because... I find CLASSIFY

> What do you mean with "I switch to classid" ?
> 

It's a wrong definition, sorry. The right one it CLASSIFY!

Simple example, assuming that you have 192.168.1.0/24, need to limit at 5mb
the ip .100 on both sides on flow and all the others goes at 1mbit all
together. eth0 lan, eth1 are wan.

tc qdisc add dev eth0 root handle 1: htb default 1000
tc class add dev eth0 parent 1: classid 1:1 htb rate 100mbit ceil 100mbit
tc class add dev eth0 parent 1:1 classid 1:100 htb rate 1mbit ceil 5mbit
tc class add dev eth0 parent 1:1 classid 1:1000 htb rate 1mbit ceil 1mbit

tc qdisc add dev eth1 root handle 2: htb default 1000
tc class add dev eth1 parent 2: classid 2:1 htb rate 100mbit ceil 100mbit
tc class add dev eth1 parent 2:1 classid 2:100 htb rate 1mbit ceil 5mbit
tc class add dev eth1 parent 2:1 classid 2:1000 htb rate 1mbit ceil 1mbit

iptables -t mangle -F FORWARD
iptables -t mangle -A FORWARD -o eth0 -d 192.168.1.100 -j CLASSIFY
--set-class 1:100
iptables -t mangle -A FORWARD -o eth1 -s 192.168.1.100 -j CLASSIFY
--set-class 5:100
#not need since class [12]:1000 are already a fetch-all for the unclassified
iptables -t mangle -A OUTPUT -o eth0 -j CLASSIFY --set-class 1:1000
iptables -t mangle -A OUTPUT -o eth1 -j CLASSIFY --set-class 5:1000

That's all.
Of course, a rule reorganization it's a must.

Michele
