From: Josh Nerius <jnerius@gmail.com>
Subject: Re: Public IP Confusion
Date: Wed, 17 Nov 2004 16:13:14 -0600
Message-ID: <4f3930a704111714135f1cc4aa@mail.gmail.com>
References: <cbbdce6c04111713523d175e8f@mail.gmail.com>
Reply-To: Josh Nerius <jnerius@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cbbdce6c04111713523d175e8f@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Todd L <00todd@gmail.com>
Cc: netfilter@lists.netfilter.org

Hello Todd, 

It sounds like what you need is something like a transparent bridge on
which you can do filtering.

I've utilized a similar setup for testing purposes and found it to be
quite functional.

Linux has this capability by using the bridging code built into most
2.6 kernels and usable in 2.4 kernels by patching (though most newer
2.4 kernels have this already)

Once in place, you can then use iptables to control traffic passing
through the bridge and this is completely transparent...no NAT, not
network reconfiguration etc etc.

Here are two helpful links that should get you started. 

http://www.securityfocus.com/infocus/1737 -- be sure to check out the
"relevant links" at the bottom of the page.
http://www.lartc.org -- this one has quite a bit of information that
may or may not apply to your situation specifically but you'll likely
find this site very useful.

Good luck!

Josh Nerius


On Wed, 17 Nov 2004 16:52:24 -0500, Todd L <00todd@gmail.com> wrote:
> Hi everyone,
> 
> This is my first post to this list.
> 
> I am fairly new to netfilter and iptables and I wanted to do the
> following setup to protect a class C network from the occasional IP
> Fragment, SYN and similar DDOS attacks.
> 
> My ISP has a router which is .1 on the network and my gateway for the
> machines on the class C. The ISP gives me an ethernet handoff which
> goes into my switch and my server are plugged into that switch with
> gateway of 1 and netmask of 255.255.255.0.
> 
>  I would like to place a linux box using iptables in between the
> switch and the ISP ethernet handoff to block attackers IP addresses.
> 
> What I though I could do is have ISP ethernet to  Eth0 on linux box.
> Eth1 on linux box to switch and then somehow make the linux box
> transparent to the network. From what I have read it almost seems like
> I need a mix of SNAT and NAT but I am unsure on how to proceed. I have
> read a lot of the documentation and HOWTOs  and I have not found any
> examples of this type of a scenario.
> 
> Any Advice?
> 
> Thank you,
> 
> Todd
> 
> 


-- 
Math problems? Call 1-800-[(10x)(13i)^2]-[sin(xy)/2.362x]

