From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: More ethernet port same ip address
Date: Mon, 21 Jul 2008 14:46:42 -0500
Message-ID: <4884E7A2.5070403@riverviewtech.net>
References: <48819901.6030604@unipex.it> <4884D160.7060701@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4884D160.7060701@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/21/08 13:11, Michele Petrazzo - Unipex srl wrote:
> made some tries and I see that it works well with the "bridge" mode. 
> The only thing that I do was to to create a new bridge, remove the ip 
> address from the interfaces, add them to the bridge and set an ip 
> address for the bridge. Nothing other. With arp_proxy 1 or 0 it works 
> in the same manner.

*nod*

> The strange it's that I already tried this solution in test room, but 
> I remember that it didn't work. One think that forgot to say it's 
> that when I tried, I was using a different switch configuration (that 
> now I cannot reproduce): there was two different switch (with stp 
> enabled and configured), each one with 3 different vlan and each of 
> the three vlans end into one server ethernet port.

VLANs and especially STP make things more interesting.

> Here, for make the communication working, I have to setup the three 
> vlan(s) on the server port's, but they must have the same address. 
> And, with the "bridge" solution I think that I cannot.

With traditional bridging, you would bridge the three (virtual) 
interfaces together and then bind your server's IP(s) to the bridge 
interface.  I've got a system in service that has an excess of 24 
different VLAN interfaces bridged together, and it's working great.

> Thanks to all,

*nod*



Grant. . . .
