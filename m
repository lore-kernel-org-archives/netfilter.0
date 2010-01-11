From: Gary Smith <gary.smith@holdstead.com>
Subject: RE: REJECT as a default policy
Date: Mon, 11 Jan 2010 14:12:34 -0800
Message-ID: <034DEBCAE934A74991E6E76B8DA72D141884A1922F@HSSBS.holdstead.local>
References: <4B4B1339.1040502@gmail.com>
	 <034DEBCAE934A74991E6E76B8DA72D141884A1922E@HSSBS.holdstead.local>
 <56378e321001111408mbeef328j62261c7a0215e122@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56378e321001111408mbeef328j62261c7a0215e122@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: 'Richard Horton' <arimus.uk@googlemail.com>
Cc: 'Lars Nooden' <lars.curator@gmail.com>, "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

> > Or am I not seeing your bigger picture of how REJECT would affect the sub
> chains?
> 
> I think all the OP means is DROP is valid policy target where as
> REJECT isn't. The big problem though is that DROP / ACCEPT as policy
> targets or jump targets require no options where as the REJECT target
> can take options to control the returned ICMP code, which with the
> current policy handler you couldn't specifiy.
> 

That makes a little more sense now.
