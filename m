From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: shaping vlans - revisited
Date: Sat, 5 Feb 2011 14:32:01 -0200
Message-ID: <20110205143201.4a563987@babalu.inexo.com.br>
References: <20110203152944.635b42e8@pulsar.inexo.com.br>
	<1296759048.7587.3.camel@andybev>
	<20110203180118.62970fb1@pulsar.inexo.com.br>
	<1296788356.7587.70.camel@andybev>
	<20110204120533.7f470bab@pulsar.inexo.com.br>
	<1296829445.1634.1.camel@andybev>
	<20110204142417.30dbe5fa@pulsar.inexo.com.br>
	<20110205134621.44b63335@catus>
	<20110205124235.31bcd26e@babalu.inexo.com.br>
	<20110205155202.02eb6e7f@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110205155202.02eb6e7f@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Marek Kierdelewicz <marek@piasta.pl>

On Sat, 5 Feb 2011 15:52:02 +0100
Marek Kierdelewicz <marek@piasta.pl> wrote:

> >Hi Marek
> 
> Hi,
> 
> >I thing we will only change the place of the problem. It will move from
> >eth to ifb.
> 
> It'll be ok, because you'll be redirecting traffic from vlan
> interface not eth1 interface. TC will see traffic without extra
> vlan tag.

... and since the packets are not encapsulated yet, how they will return
from ifb to vlanX to be encapsulated??

I see no tc command doing this in you example in your previous post.
Is there a missing command?

Ethy
