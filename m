From: Gary Smith <gary.smith@holdstead.com>
Subject: RE: Disabling conntrack for local net
Date: Tue, 17 Nov 2009 08:35:53 -0800
Message-ID: <034DEBCAE934A74991E6E76B8DA72D14185DD50A8B@HSSBS.holdstead.local>
References: <034DEBCAE934A74991E6E76B8DA72D14185DD509DA@HSSBS.holdstead.local>
 <4AE13AA6.5080509@chello.at> <4AE14B9E.9050705@chello.at>
 <034DEBCAE934A74991E6E76B8DA72D14185DD509DD@HSSBS.holdstead.local>
 <034DEBCAE934A74991E6E76B8DA72D14185DD50A7F@HSSBS.holdstead.local>
 <4B027501.2010303@chello.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B027501.2010303@chello.at>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

> Well, the RAWNAT target didn't seem to fit you?
> 
> You could always use iproute2 to do static nat.
> 
> OR - get routable IP addresses...
> 

Normally I would use routable IP's but in this case we have just a handful of them and each IP it's being mapped to multiple real servers on different ports (for many different services).

The firewall can handle the connections (as we tweaked max connections months ago).  I just wanted to find a better way to not have to have the firewall handle connections that originate internally.  I have several subnets internally and  I have them set to NOTRACK as they can use direct routing, it's just the external facing servers we have a problem with.

Anyway, thanks for the follow up.
