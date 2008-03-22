From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: Bandwidth Management - By MAC Address
Date: Sat, 22 Mar 2008 11:36:03 +0100
Message-ID: <47E4E113.60309@unipex.it>
References: <665B03CFBE2C1346A66B0CB9A9A0EE3801C7EC44@ASM220.aspen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <665B03CFBE2C1346A66B0CB9A9A0EE3801C7EC44@ASM220.aspen.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Eric Estes wrote:
> I'm hoping someone could shed some light on this.
> 
> I'm trying to throttle a specific MAC Address to 200Kbits but it only
> seems to work for outgoing traffic. Can anyone see anything wrong with
> the code below?
> 

At first sight, you make a mistake here:

> /sbin/tc qdisc add dev eth1 handle 1: root htb default 1
> /sbin/tc qdisc add dev eth0 handle 1: root htb default 1

You have to add two differents handle for the incoming and outgoing data.

/sbin/tc qdisc add dev $OUT_IF handle 5: root htb default 5
/sbin/tc qdisc add dev $IN_IF handle 1: root htb default 5

/sbin/tc class add dev $OUT_IF parent 5: classid 5:1 htb rate 5320Kbit
/sbin/tc class add dev $OUT_IF parent 5: classid 5:5 htb rate 100Kbit
/sbin/tc class add dev $OUT_IF parent 5:1 classid 5:11 htb rate 200Kbit

/sbin/tc class add dev $IN_IF parent 1: classid 1:1 htb rate 5320Kbit
/sbin/tc class add dev $IN_IF parent 1: classid 1:5 htb rate 100Kbit
/sbin/tc class add dev $IN_IF parent 1:1 classid 1:11 htb rate 200Kbit

iptables -t mangle -F FORWARD -m mac --mac-source -o $OUT_IF -j CLASSIFY 
--set-class 5:11
iptables -t mangle -F FORWARD -d $PC_IP -i $IN_IF -j CLASSIFY 
--set-class 1:11

P.s. For incoming traffic you can't base your rules on the mac. See 
iptables(8)

Hope this help,
Michele
