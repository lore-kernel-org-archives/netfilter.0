From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is Linux based Gateway/Firewall feasible
Date: Thu, 8 Jul 2004 14:38:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407081438.11445.Antony@Soft-Solutions.co.uk>
References: <BAY4-F14s1UAuiJ1yhn000561d1@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY4-F14s1UAuiJ1yhn000561d1@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thursday 08 July 2004 2:21 pm, Mike O wrote:

> I'd like to chime in here considering I brought this topic up a few years
> ago. From a standpoint of routing data from one subnet to another with high
> speed serial interfaces etc.. nothing beats a cisco. Cisco routers have
> special ASIC(application specific intergrated circuits) that do nothing but
> routing and other features.

That's true, however the benefits of ASICs (in this context) are throughput 
and latency.   If you don't have a high-speed (by which I mean more than 
about 10Mbps) pipe to the Internet, then throughput is not an issue (ie: your 
firewall / router is not the bottleneck in the system), and as for latency, 
well how important is it to you really?

A Linux box with a Sangoma WAN card will happily connect directly into a high 
speed serial port on a Telco NTU, and I've yet to see any external connection 
running at less than ATM speeds (155Mbps or 625Mbps) where a Linux system 
can't handle the packets.

My feeling is that unless you're an ISP in the core of the Internet, where the 
important features are gigabit routing, dynamic routing protocol support, and 
apart from dropping a few RFC1918 addresses, you're not trying to do any 
firewalling, then you don't need to spend money on a dedicated router when a 
Linux system will do all the routing you need and supply firewalling and 
traffic control if you want it as well.

Regards,

Antony.

-- 
Wanted: telepath.   You know where to apply.

                                                     Please reply to the list;
                                                           please don't CC me.


