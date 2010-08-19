From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Bridges
Date: Thu, 19 Aug 2010 09:51:15 -0500
Message-ID: <4C6D44E3.7050608@riverviewtech.net>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C65CD.6090707@plouf.fr.eu.org> <4C6CAA60.60808@riverviewtech.net> <4C6CDE4E.7000609@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6CDE4E.7000609@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/19/10 02:33, Pascal Hambourg wrote:
> Me too, but I wanted to be more general.

Fair enough.  ;-)

> Or one L3 switch with two port-based VLANs. Packets should not leak 
> between VLANs unless they're routed.

Heh.  I'll argue that even if the device that ""leaks the packet from 
one interface to another is called a switch, that it is still doing a 
layer 3 function, namely routing.  Layer 3 switches are just really 
efficient routers when it comes to routing from one vlan to another.

(That or I vastly mis-understand how layer 3 switching is different from 
routing.  At least when it comes to what is done with the IP packet, 
regardless of how it's technically done.  If I am mistaken I'd love to 
have someone correct me.)



Grant. . . .
