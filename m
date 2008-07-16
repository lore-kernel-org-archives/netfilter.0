From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT rule
Date: Wed, 16 Jul 2008 13:49:55 -0500
Message-ID: <487E42D3.4080904@riverviewtech.net>
References: <487E1DF3.1090203@hoecoop.org> <alpine.LNX.1.10.0807161850580.32031@fbirervta.pbzchgretzou.qr> <487E2DAD.9040806@riverviewtech.net> <alpine.LNX.1.10.0807161924150.32031@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0807161924150.32031@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/16/08 12:25, Jan Engelhardt wrote:
> Packets already destined for the tunnel (see first rule) are not 
> rerouted, because, well, it's POSTrouting.

By the time packets would make it to your rule, yes.  My concern is that 
the router / VPN setup will see one subnet on one ethernet interface and 
the same subnet on the other end of the tunnel.  At least that is the 
understanding that I got from the OP.  So my concern is not so much 
confusion on IPTables part so much as it is a simple routing (which 
interface gets used) seeing the same subnet in two different locations.

I guess I should ask, how well will the router handle having the same 
subnet addresses in two different (non connected) locations, one being 
the ethernet interface and the other being through the tunnel?




Grant. . . .
