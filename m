From: "mdpeters" <michael.peters@lazarusalliance.com>
Subject: Re: transparent bridge troubles?
Date: Fri, 7 Jan 2005 17:02:57 -0500
Message-ID: <005601c4f504$a59b4ff0$3e0010ac@esonet18>
References: <074001c4f4ea$388d1070$3e0010ac@esonet18>
	<20050107215324.GA1430@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

[-]arp Enable or disable the use of the ARP protocol on this interface.

I was told to do that by the Snort folks but maybe .... not?

----- Original Message ----- 
From: "Jason Opperisano" <opie@817west.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, January 07, 2005 4:53 PM
Subject: Re: transparent bridge troubles?


> On Fri, Jan 07, 2005 at 01:53:48PM -0500, mdpeters wrote:
>> This is my bridge setup:
>> 
>> /sbin/modprobe ip_queue
>> /sbin/ifconfig eth1 0.0.0.0
>> /sbin/ifconfig eth2 0.0.0.0
>> /usr/local/sbin/brctl addbr br0
>> /usr/local/sbin/brctl addif br0 eth1
>> /usr/local/sbin/brctl addif br0 eth2
>> /sbin/ifconfig br0 up
>> /usr/local/sbin/brctl stp br0 off
>> /sbin/ifconfig br0 0.0.0.0 -arp
> 
> i'm a little rusty on my linux bridging commands--but why did you
> execute that last command?  the "ifconfig br0 0.0.0.0 -arp" one.  it
> seems like that would block arp traffic from traversing the bridge, but
> i could be mistaken...
> 
> -j
> 
> --
> "I bet Einstein turned himself all sorts of colors before he invented
> the light bulb."
>        --The Simpsons
> 
>

