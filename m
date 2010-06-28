From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: nat bypass
Date: Mon, 28 Jun 2010 09:02:03 -0500
Message-ID: <4C28AB5B.7010502@riverviewtech.net>
References: <AANLkTil_H1QeaCHQYhMjVRFiLwtqF9yLAJZ9BWecOIDW@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTil_H1QeaCHQYhMjVRFiLwtqF9yLAJZ9BWecOIDW@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/28/10 05:13, ratheesh k wrote:
> DHCP server running  on S . My question is : How can A will get  an 
> ip from 10.232.18.0/24 pool ip .?

Bridging the (selected) traffic from your LAN to the network that the 
server is on is probably your best bet.

What you are talking about is known as a bridging router, or "brouter" 
for short.

> ebtables is an option ? How can we make it ?

You set up a brouter and bridge the traffic for the system(s) on the LAN 
that is suppose to be part of the network that the server is on and 
route the rest of the traffic.

> Is there any other optimal way ?

Short of adding a second network card to A and connecting it directly to 
the network that S is on, bridging is probably your best bet.

You will have to set up a EBTables rules to control what traffic is 
bridged verses routed.



Grant. . . .
