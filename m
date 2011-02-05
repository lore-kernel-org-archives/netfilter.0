From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: shaping vlans - revisited
Date: Sat, 5 Feb 2011 21:26:07 -0200
Message-ID: <20110205212607.3cdcdaae@babalu.inexo.com.br>
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
	<20110205143201.4a563987@babalu.inexo.com.br>
	<20110205174150.1fbd7658@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110205174150.1fbd7658@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

On Sat, 5 Feb 2011 17:41:50 +0100
Marek Kierdelewicz <marek@piasta.pl> wrote:

> Hi,
> 
> >... and since the packets are not encapsulated yet, how they will
> >return from ifb to vlanX to be encapsulated??
> >I see no tc command doing this in you example in your previous post.
> >Is there a missing command?
> 
> That's the way ifb works. Example of ingress shaping that uses "action
> mirred egress redirect":
> http://www.linuxfoundation.org/collaborate/workgroups/networking/ifb#Typical_Usage
> 

Done. 

Working.

Thanx everyone.

Ethy
