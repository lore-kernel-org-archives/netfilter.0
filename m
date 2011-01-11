From: John Haxby <john.haxby@oracle.com>
Subject: Re: VLANs
Date: Tue, 11 Jan 2011 12:48:19 +0000
Message-ID: <4D2C5193.6010703@oracle.com>
References: <4D2B44E9.3000006@abpni.co.uk> <0903BC3C-68B9-4E15-BEE1-0A9F6CDCF226@oracle.com> <4D2B84F0.6030300@abpni.co.uk> <4D2C3426.3000202@oracle.com> <4D2C37A1.8090906@abpni.co.uk> <4D2C47DB.10702@oracle.com> <4D2C4C13.3020107@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D2C4C13.3020107@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

On 11/01/11 12:24, Jonathan Tripathy wrote:
>
> For seeing what I mean about VLAN hopping:
>
> http://en.wikipedia.org/wiki/VLAN_hopping

Ahh.   That's interesting, but not nearly so interesting (or useful) as 
the Cisco document that it cites: 
http://www.cisco.com/en/US/products/hw/switches/ps708/products_white_paper09186a008013159f.shtml#wp39054

Basically the hopping only works if the trunk has the same native vlan 
as the attacker.  This, the cisco article goes on to say, is considered 
to be a misconfiguration.   You can read it yourself, but there are two 
ways of avoiding this.

It's still not clear to me how you would get a reply from the attack -- 
you'd need something on the receiving end that can also do the double 
tagging (which is not 802.1ad, it's a second 802.1a tag, to be clear).

jch
