From: Gary Smith <gary.smith@holdstead.com>
Subject: RE: Ramdom NAT drop
Date: Wed, 21 Oct 2009 08:40:52 -0700
Message-ID: <034DEBCAE934A74991E6E76B8DA72D14185DD509A2@HSSBS.holdstead.local>
References: <034DEBCAE934A74991E6E76B8DA72D14182B54DFB0@HSSBS.holdstead.local>
 <034DEBCAE934A74991E6E76B8DA72D14185DD50990@HSSBS.holdstead.local>
 <4ADEBE76.20700@chello.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ADEBE76.20700@chello.at>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

> I'm just guessing, but what I know from my FW logs, is that IE tends to
> send packets in INVALID state.
> That would explain, why there's no problem with Firefox.

I would also expect to see this, but I don't think the packet is even making it to the filter section.  I have logging for anything dropped and yet nothing is coming in from originating IP's that are affected.  I will probably do something painful and put more logging in the chains to see if I can better catch the problem.  The only issue I have is that the problem is random.

I will definitely look for that though.
