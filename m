From: Gary Smith <gary.smith@holdstead.com>
Subject: RE: REJECT as a default policy
Date: Mon, 11 Jan 2010 12:12:03 -0800
Message-ID: <034DEBCAE934A74991E6E76B8DA72D141884A1922E@HSSBS.holdstead.local>
References: <4B4B1339.1040502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B4B1339.1040502@gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: 'Lars Nooden' <lars.curator@gmail.com>, "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

> I'd like to add the ability to use the REJECT target as a default policy
> to the netfilter / iptables wishlist.
> 
> Using REJECT as a default is currently possible as a kludge a few steps
> would be saved by allowing it as a default policy.  Perhaps that might
> even speed up some filtering in some cases.
> 
> A good (IMHO) discussion of DROP vs REJECT has been written by Peter Benie :
> 	http://www.chiark.greenend.org.uk/~peterb/network/drop-vs-reject
> 

So change:
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]

To:
:INPUT REJECT [0:0]
:FORWARD REJECT [0:0]
:OUTPUT REJECT [0:0]

I'm not really seeing the added value myself.  I think it could have a negative benefit to many who use the chains and expect the default rule to be ACCEPT in order to fall through to the next rule.  

Or am I not seeing your bigger picture of how REJECT would affect the sub chains?

Gary Smith
