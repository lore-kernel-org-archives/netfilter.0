From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: shaping vlans - revisited
Date: Sat, 5 Feb 2011 13:46:21 +0100
Message-ID: <20110205134621.44b63335@catus>
References: <20110203152944.635b42e8@pulsar.inexo.com.br>
	<1296759048.7587.3.camel@andybev>
	<20110203180118.62970fb1@pulsar.inexo.com.br>
	<1296788356.7587.70.camel@andybev>
	<20110204120533.7f470bab@pulsar.inexo.com.br>
	<1296829445.1634.1.camel@andybev>
	<20110204142417.30dbe5fa@pulsar.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110204142417.30dbe5fa@pulsar.inexo.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc: netfilter@vger.kernel.org

Hi,

>IFB?? 
>
>it may be a good way out.
>Do you know any discussion list or forum for it? 
>I just read a few sites and have some questions.

You could do it this way:

1) make sure ifb is modprobed and interface ifb0 is up

2) redirect outgoing traffic on each vlan interface to ifb0

tc qdisc add dev $DEV root handle 1: htb default 1
tc class add dev $DEV parent 1: classid 1:1 htb rate 100mbit
rc filter add dev $DEV protocol ip parent 1: prio 4 u32 \
  match ip dst 0.0.0.0/0 flowid :1 \
  action mirred egress redirect dev ifb0

... where $DEV is vlanX, vlanY ...

3) Add shaping on ifb0 just like you did earlier on eth1.

Best regards,
Marek Kierdelewicz
