From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Troubles doing transparent proxy for virtual machines
Date: Fri, 4 Jun 2010 08:27:41 +0200
Message-ID: <20100604082741.0536eb68@catlap>
References: <4C08181A.1010304@ngenera.com>
	<20100603232041.7b18a208@catlap>
	<4C0833B6.3040009@ngenera.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C0833B6.3040009@ngenera.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dan Higgins <dhiggins@ngenera.com>
Cc: netfilter@vger.kernel.org

Hi,

>Thanks for the response. I'm beginning to think that my strategy here
>is all wrong to begin with. Here's why:
>1. The subnet for my VMs is 192.168.122.0/24. This is created by 
>libvirtd when it starts up.
>2. I start up Firefox in a VM, then go to google.com.
>3. As I watch with tcpdump, I never even see 192.168.122.x in the
>output.
>Maybe libvirtd is doing its own network voodoo before handing off to
>the kernel network stack. 

Sorry, I've never used libvirtd, but if your virtualization backend is
kvm and it's configured for "userspace networking", iptables won't do
what you want.

> [Shrug]  Should I expect tcpdump to show
>packets coming through a bridge (virbr0 or just br0)?

In "bridged networking" you should see packets on VMs interface
(tapX) and bridge interface (brX).

Try setting it up. This page may be of some help:
http://wiki.libvirt.org/page/Networking

Best regards,
Marek
