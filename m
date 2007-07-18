From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: PROXY Arp and VLAN
Date: Wed, 18 Jul 2007 09:52:57 -0500
Message-ID: <469E2949.3010107@riverviewtech.net>
References: <OF5250BB5F.BB210A5B-ONC125731C.00222C2A-C125731C.00223407@Selex-Comms.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OF5250BB5F.BB210A5B-ONC125731C.00222C2A-C125731C.00223407@Selex-Comms.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 07/18/07 01:13, Klaus.Frank@selex-comms.com wrote:
> sorry if this is the wrong place to ask my questions. But maybe you've got 
> a minute to read which problem I've got and direct me to a better place or 
> even help me to solve my problem.

I think this question would be better asked on the EBTables mailing 
list, but I'll give it a go any way.

> There is a subnet consisting of a PC, a box with an ethernet interface, 
> some IP phones and a router to another subnet with some IP phones and the 
> counterpart of the box..
> The PC has two ethernet ports eth0 and eth1.
> The PC is mainly used for VoIP using Asterisk on eth0.
> The box is connected to eth1and PROXY ARPed to eth0 because the box does 
> not have a subnet mask or default gateway address.
> I'm using CentOS3 kernel version is 2.4.21-50EL
> Things are working fine and stable.

Except for Proxy ARP verses Bridging, I think this scenario is ok.

> Now I must virtually separate VoIP data and data from the box using 2 
> VLANs. All IP phones support VLAN, the box does not support VLAN.

Use trunking and bridging.

> Surfing the internet gave me some idea that VLAN, iptables and bridging 
> could do the job, but I can't figure out how to configurate it.

Add support for bridging (802.1d) and VLANs / trunking (802.1q) to your 
kernel.  Then set up corresponding VLAN interfaces on all your ethernet 
interfaces.  Once you have your VLAN interfaces set up, you will be 
bridging them together.

So what was:

eth0
eth1

becomes:

eth0.001
eth0.002
eth1.001
eth1.002

With two bridges

bri1
    eth0.001
    eth1.001
bri2
    eth0.002
    eth1.002

Do this on both ends and your systems will now bridge the data from the 
two different VLANs (respectively) across the systems while maintaining 
the separation of data.



Grant. . . .

