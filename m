From: Jon Lewis <jlewis@lewis.org>
Subject: Re: using iptables to speed limit connections
Date: Wed, 26 Oct 2011 09:20:15 -0400 (EDT)
Message-ID: <Pine.LNX.4.61.1110260919400.24418@soloth.lewis.org>
References: <4EA7EEF6.4000808@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4EA7EEF6.4000808@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: J Webster <jw.jwebster@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 26 Oct 2011, J Webster wrote:

> Is there any easy way to speed limit connections on a VPN to 2 Mbps?
> My server is 100Mbps but I have connections on a VPN of 10.8.0.0. so need to 
> limit the outbound connection from 10.8.0.0 to 2 Mbps.
> I tried reading the stuff on leaf but the tutorial doesn't seem very 
> straightforward and there is not much information on this on the net.

You probably should have a look at http://lartc.org/howto/lartc.qdisc.html

----------------------------------------------------------------------
  Jon Lewis, MCP :)           |  I route
  Senior Network Engineer     |  therefore you are
  Atlantic Net                |
_________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
