From: Boryan Yotov <yotov@prosyst.com>
Subject: Re: newbie at routing
Date: Thu, 08 Jun 2006 17:27:23 +0200
Message-ID: <448841DB.50308@prosyst.com>
References: <BAY19-F1C1F1025A66D8C65190469E8B0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY19-F1C1F1025A66D8C65190469E8B0@phx.gbl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Diana Asnani wrote:
> Hi,
> 
> its Diana again...after setting "route add -net 202.184.41.0/24 gw 
> 192.168.202.14", i still could not ping 202.184.41.41 ( the PC )....i 
> could ping the 202.184.41.0 add
> i also set the "route add -net 202.184.41.0/24 gw 192.168.206.1" but it 
> says network unreachable....
> 

Lets try to analyze what information regarding your network setup, you 
gave till now (from all your e-Mails).

First e-Mail:
^^^^^^^^^^^^^^^

> I need help!! My VLAN IP is 192.168.202.1. I can ping another PC with the 
> VLAN IP of 192.168.206.1 but i can't ping the 202.184.41.41 address in that 
> PC. Am i supposed to do some sort of routing configuration? I am using FC3 
> as my OS. What am i supposed to do to ping 202.184.41.41? Thanks

At least from my point of view, your network setup at this stage looks like:

     1st PC                                             2nd PC
[192.168.202.1]<------------------------>[192.168.206.1 | 202.184.41.41]

You have two PCs:
  - first one configured with an IP address of 192.168.202.1
  - second one with two IP addresses - 192.168.206.1 and 202.184.41.41

You said packets are able to travel between end 192.168.202.1 and end 
192.168.206.1. In order this to be able to work, both ends need to be 
located on a same subnet (like 192.168.0.0/16) ... OR ... in two 
different subnets, while both ends have an explicit routing entry for 
reaching each other.


Second e-Mail:
^^^^^^^^^^^^^^^

> yup 202.184.41.41 is configured in the same PC as 192.168.206.1
> the subnet mask is 255.255.255.240

The new info is that either 202.184.41.41 or 192.168.206.1, is inside a 
subnet with net mask 255.255.255.240:

So one of the subnets below sure exists:

202.184.41.32/255.255.255.240
192.168.206.0/255.255.255.240


Third e-Mail:
^^^^^^^^^^^^^^^

> thanks for the reply...the gateway for my 192.168.202.1 PC is 192.168.202.14 
> which is the vlan router which enables me to ping the 192.168.206.1 vlan 
> address...for the route in the network device control, the destination 
> network is 192.168.206.0, the subnet mask 255.255.255.240 and the gateway as 
> 192.168.202.14...this is what i have done so far...i am not too sure on how 
> i should configure a default gateway ot static route...

Now, there is a new player in the picture - 1st PC's (probably default) 
Gateway/router which has an IP address 192.168.202.14 and some kind of 
link to 192.168.206.1.


     1st PC                                             2nd PC
[192.168.202.1]                          [192.168.206.1 | 202.184.41.41]
     |                Gateway                 |
     +---[192.168.202.14 | ???.???.???.???]---+

Good thing is that one of the subnets is clear now - 
192.168.206.0/255.255.255.240

The bad thing - it is not clear how Gateway is able to route packets 
from 192.168.202.1 to 192.168.206.1. Probably Gateway has a second 
interface within the subnet of 192.168.206.1 ... OR ... both Gateway and 
2nd PC are directly connected while using explicit routes?

Not clear is also what you mean by: "...for the route in the network 
device control, the destination network is 192.168.206.0, the subnet 
mask 255.255.255.240 and the gateway as 192.168.202.14...".



Fourth e-Mail:
^^^^^^^^^^^^^^^

> no, the VLANs are not connected to the same router...the vlan router for 
> 192.168.206.1 is 192.168.206.14
> the router is Cisco...

Okey, it is getting worse. You are sure that 192.168.202.1 and 
192.168.206.1 (what I understand by "the VLANs") are not connected to 
the same router. The picture looks completely different now:

     1st PC                                             2nd PC
[192.168.202.1]                          [192.168.206.1 | 202.184.41.41]
     |     Router 1            Router 2       |
     +--[192.168.202.14] ?? [192.168.206.14]--+


My questions are: Is the last schema matching your network topology? If 
true, how are Router 1 and Router 2 connected with each other? If not, 
could you try to write a simple schema description as the ones from above?






