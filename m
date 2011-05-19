From: Rick Jones <rick.jones2@hp.com>
Subject: Re: Source MAC address through bridged connection
Date: Thu, 19 May 2011 09:05:20 -0700
Message-ID: <1305821120.8149.1094.camel@tardy>
References: <BANLkTikbqMrGCThuiFZRCtB6Mrf_+mcXNg@mail.gmail.com>
Reply-To: rick.jones2@hp.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTikbqMrGCThuiFZRCtB6Mrf_+mcXNg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kelbel Junior <kelbel02@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 2011-05-19 at 12:52 -0300, Kelbel Junior wrote:
> Hi guys!
> 
> I have the following scenario:
> 
> Clients Network <------> Linux router <------> Mikrotik gateway
> <------> INTERNET
> 
> Happens what the Mikrotik gateway controls the clients from the mac
> address (joining an ip to an MAC address) and when i put the linux
> router between they the control don't works.
> I saw on the MK(mikrotik) the packets coming in with the MAC address
> from the bridge, and this is a problem.
> 
> Exist some way to preserve the source mac through a bridged
> connection, to continue seeing the mac address of the clients?

Is the device in the middle a router, or is it a bridge?  The
distinction is quite important.

Conceptually, a router does it's thing at layer three of the (in)famous
seven-layer model (*).  That means it only "preserves" layer three and
above.  Layer 2 and below is not preserved.

A bridge (or (multiport)switch, ignoring marktroid-speak about "L3
switching") does it's thing at layer two.  That means it preserves layer
two and above.  Layer 1 (physical) is not preserved.

rick jones

* there is also the nine-layer model
http://www.isc.org/store/logoware-clothing/isc-9-layer-osi-model-cotton-t-shirt

