From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: shaping vlans - revisited
Date: Sat, 5 Feb 2011 15:52:02 +0100
Message-ID: <20110205155202.02eb6e7f@catus>
References: <20110203152944.635b42e8@pulsar.inexo.com.br>
	<1296759048.7587.3.camel@andybev>
	<20110203180118.62970fb1@pulsar.inexo.com.br>
	<1296788356.7587.70.camel@andybev>
	<20110204120533.7f470bab@pulsar.inexo.com.br>
	<1296829445.1634.1.camel@andybev>
	<20110204142417.30dbe5fa@pulsar.inexo.com.br>
	<20110205134621.44b63335@catus>
	<20110205124235.31bcd26e@babalu.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110205124235.31bcd26e@babalu.inexo.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc: netfilter@vger.kernel.org

>Hi Marek

Hi,

>I thing we will only change the place of the problem. It will move from
>eth to ifb.

It'll be ok, because you'll be redirecting traffic from vlan
interface not eth1 interface. TC will see traffic without extra
vlan tag.

I use such setup to aggregate and shape traffic from many ppp
interfaces (PPPoE sessions) and it works ok. TC u32 filters properly
classify ip packets. Im my case redirection occurs on ppp interfaces,
not vlan interfaces but that's analogous.

Best regards,
Marek Kierdelewicz
