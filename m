From: John Haxby <john.haxby@oracle.com>
Subject: Re: VLANs
Date: Mon, 10 Jan 2011 21:33:16 +0000
Message-ID: <0903BC3C-68B9-4E15-BEE1-0A9F6CDCF226@oracle.com>
References: <4D2B44E9.3000006@abpni.co.uk>
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D2B44E9.3000006@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org


On 10 Jan 2011, at 17:42, Jonathan Tripathy wrote:

> 
> I wish to use VLANs on my Linux Xen hosts to seperate managed customer networks.
> 
> Can anybody please give me some pointers on how to make the network secure so no-one can VLAN hop?
> 
> At the minute, I plan to set up one bridge per customer, and use linux vconfig to add an if to the bridge (which I believe strips all tags). Then, all the respective customer Xen DomU (VM) interfaces will connect to the bridge.

If each bridge (for each customer) contains just one vlan-tagged physical interface then there is no way for the guests to vlan-hop.  A vlan tag added by a guest will either be replaced by the vlan tag of the external interface or the frame will be dropped.  If you have multiple vlans on a bridge (with multiple physical interfaces) then the vlan will be chosen by routing if the interfaces have their own addresses, I'm not sure what happens if the interfaces don't have addresses, but when a frame leaves on a vlan interface it acquires the corresponding vlan tag.  It doesn't matter what happens to the tag on the way back as it's only relevant to an interface that's on a vlan.

Obviously you should test this, but it's all pretty straightforward and there's nothing special or complicated to set up.

jch