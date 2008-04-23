From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Redirecting ports in a bridge
Date: Wed, 23 Apr 2008 13:57:34 -0500
Message-ID: <480F869E.2000600@riverviewtech.net>
References: <48086990.5060000@juntadeandalucia.es> <alpine.LNX.1.10.0804181232400.26385@fbirervta.pbzchgretzou.qr> <48087E17.8080902@juntadeandalucia.es> <alpine.LNX.1.10.0804181328560.26385@fbirervta.pbzchgretzou.qr> <480888CE.3080400@juntadeandalucia.es> <alpine.LNX.1.10.0804231722570.13697@fbirervta.pbzchgretzou.qr> <480F6EEE.9010201@riverviewtech.net> <alpine.LNX.1.10.0804232047490.15791@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804232047490.15791@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 04/23/08 13:48, Jan Engelhardt wrote:
> Well what routes do clients have at the moment?

Clients will use their ISPs to cross the internet to the router in 
question to get to the server.  Conversely the servers will use said 
router to get back out to the world.

It sounds like presently clients will come in from the internet in to 
the router then on to the servers.  This set up is (apparently) up and 
running as it is.  The OP is wanting to put the appliance in between the 
router and the servers with out having to re-configure any IP addresses 
any where.



Grant. . . .
