From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: shaping vlans - revisited
Date: Thu, 03 Feb 2011 21:42:59 -0600
Message-ID: <4D4B75C3.2060007@riverviewtech.net>
References: <20110203152944.635b42e8@pulsar.inexo.com.br>	<1296759048.7587.3.camel@andybev> <20110203180118.62970fb1@pulsar.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110203180118.62970fb1@pulsar.inexo.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 2/3/2011 2:01 PM, Ethy H. Brito wrote:
> One extra detail is: this setup was working (just as it is for eth0)
> until two weeks ago when then we created the vlans and splited the
> traffic among them.

Once the traffic is in side of a VLAN tag (on the raw device), filters 
will not match the traffic the say way that it did.  -  Try applying 
your filters to the VLAN sub-interface.

This is because the traffic is no longer IP traffic in side of Ethernet 
SNAP frames, but rather VLAN tagged frames that contain Ethernet SNAP 
frames.

Are you wanting to give one VLAN on a given raw interface more priority 
than another?



Grant. . . .
