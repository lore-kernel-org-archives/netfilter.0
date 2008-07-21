From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: More ethernet port same ip address
Date: Mon, 21 Jul 2008 20:11:44 +0200
Message-ID: <4884D160.7060701@unipex.it>
References: <48819901.6030604@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48819901.6030604@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi another time,

made some tries and I see that it works well with the "bridge" mode. The
only thing that I do was to to create a new bridge, remove the ip address
from the interfaces, add them to the bridge and set an ip address for
the bridge. Nothing other. With arp_proxy 1 or 0 it works in the same
manner.

The strange it's that I already tried this solution in test room, but I
remember that it didn't work. One think that forgot to say it's that
when I tried, I was using a different switch configuration (that now I
cannot reproduce): there was two different switch (with stp enabled and
configured), each one with 3 different vlan and each of the three vlans
end into one server ethernet port.
So:

pc1 <--> | vlan5 ------------- stp| <->  |stp ----------- stp| vlan 5<-> 
srv port 1
pc2 <--> | vlan6 -switch1-  stp| <-> |stp switch2 stp| vlan 6<-> srv port 2
pc3 <--> | vlan7 ------------- stp| <->  |stp ----------- stp| vlan 7<-> 
srv port 3

Here, for make the communication working, I have to setup the three
vlan(s) on the server port's, but they must have the same address.
And, with the "bridge" solution I think that I cannot.

Thanks to all,
Michele
