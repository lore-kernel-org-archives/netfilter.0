From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: intermittent and unreliable behaviour with iptables scripts
Date: Tue, 12 Nov 2002 01:10:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DD04704.5000909@fugmann.dhs.org>
References: <91F7518FF779D41181A700010266356D015555D6@mail.springbound.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Doug Watson <doug@1stbooks.com>
Cc: netfilter@lists.netfilter.org

Doug Watson wrote:
> 
> When browsing the web, web pages that normally would load very quickly seem
> to hang for an inconsistent amount of time, anywhere between 1 second to 
> 30 seconds or more before they would even begin to load or would at times   > ever load at all as if the connection to the web was lost. This 
state may
> continue for seemingly any random amount of time, a few seconds to 
> several minutes or until I finally restarted the firewall computer which
> would bring it around, but would always return eventually. Yet users 
> connecting through the current firewall which is running RedHat 6.2 and using 
> ipfwadm to forward and masquerade experienced none of these problems.
> I will note that when the firewall is in the state that no web pages will
> load, pings to its LAN interface which usually return in about 1ms will 
> time timeout, but I have not been able to link this to any specific network 
> issue. Nor am I seeing this behaviour anywhere else on our network.
Are any lines logged in the firewall? It may be that the connection 
table cannot hold all the entries. Try increasing it:
echo 65535 > /proc/sys/net/ipv4/ip_conntrack_max.

> 
> Also overall speed of our connection seems to be noticeably slower when
> running through this firewall. One example be it a good one or not is
> when running the high speed bandwidth test at http://www.bandwidthplace.com
> through the current firewall the average speed returned is between 1.0 
> and 1.4 Mbps which seems reasonable given that we have 2 T1's that are load 
> balanced and about 100 users with varying amounts of usage. However, when running 
> the same test through the new iptables based firewall the average speed 
> returned usually in the range of 600 to 800 Kbps.
> 
> Wondering if this was caused by a bad rule or rules I implemented the 
> following script so there would be no rules. While this is not much of a 
> firewall and would be insane to use at all I never experienced any of the problems 
> described above while using the firewall in this configuration.
Good debugging. I guess that you have checked that there are no dropped 
packets in the system logs, when using the attached script. If there are 
none, I would suspect hardware to be the bottleneck.

I would recommend you to try and extend the small sctipt and add 
functionality in small steps while watching performance.

> Finally the last thing to note for now is that I have changed out nearly
> all of the hardware in this box and am currently using the following 
> components with RedHat 8.0 and iptables 1.2.7a.
> 
> AMD K6-450 processor (REPLACED)
> Asus P5A motherboard (REPLACED)
Bad choice. The ASUS P5A can only cache up to 128Mb. Try removing some 
of the ram modules, in order to only have 128 MB installed, and see how 
this affects performance. (Note: I'm running a firewall on a 512Mbits 
internet connection on almost identical hardware (P5A, K6-II 300Mhz, 
192Mb ram) with over 300 iptables rules, and see absolutly no degradation)

> 224Mb PC-100 memory (REPLACED)
> 3 Netgear FA-310TX NICS (REPLACED 3 3Com 905b-TXNMs and 3 3Com 980C-TXs)
> 1 ATI 8Mb RAGE IIC AGP graphics card (NO X console only)
> 1 52X Creative Labs IDE CD-ROM (Secondary Master)
> 1 10Gb IBM 7200Rpm HardDrive (Primary master) (REPLACED)
> 1 cheap floppy drive 3.5"
> 

What kernel are you running. I really recomment that you compile your 
own kernel, and minimizing the number of modules nessesary by linking 
them statically into the kernel. Make sure that you optimize for the K6 
architecture.

Also you mention loadbalacing. Is this done by the firewall or by some 
other hardware?

As a general note to the attached script.
The DMZ rules are really crappy, and it is actually not a DMZ.
_Never_ allow packets from the DMZ to the internal network.
(Well one might allow SSH, but the should be all.). Also do not allow 
the machines in the DMZ to have unrestricted access to the internet. 
Limit it to the services and DNS to specific servers.

Hope it helps.

Regards
Anders Fugmann


