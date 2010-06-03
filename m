From: Dan Higgins <dhiggins@ngenera.com>
Subject: Re: Troubles doing transparent proxy for virtual machines
Date: Thu, 03 Jun 2010 17:59:02 -0500
Message-ID: <4C0833B6.3040009@ngenera.com>
References: <4C08181A.1010304@ngenera.com> <20100603232041.7b18a208@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100603232041.7b18a208@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


On 06/03/2010 04:20 PM, Marek Kierdelewicz wrote:
> Hi,
>
>    
>> I guess what's confusing me is that everything runs on the same box.
>>      
> Yup. Packet traverses nat table when it passes bridge and it cannot
> traverse this table second time entering virbr0 interface.
>
> Try this:
> echo 0>  /proc/sys/net/bridge/bridge-nf-call-iptables
>    

Thanks for the response. I'm beginning to think that my strategy here is 
all wrong to begin with. Here's why:

1. The subnet for my VMs is 192.168.122.0/24. This is created by 
libvirtd when it starts up.

2. I start up Firefox in a VM, then go to google.com.

3. As I watch with tcpdump, I never even see 192.168.122.x in the output.

Maybe libvirtd is doing its own network voodoo before handing off to the 
kernel network stack.  [Shrug]  Should I expect tcpdump to show packets 
coming through a bridge (virbr0 or just br0)?

This is still pretty deep water to me.

