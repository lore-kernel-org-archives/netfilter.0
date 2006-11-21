From: Mike Williams <mike@v6.gaima.co.uk>
Subject: Re: How to measure CPU usage of netfilter
Date: Tue, 21 Nov 2006 01:10:11 +0000
Message-ID: <200611210110.11338.mike@v6.gaima.co.uk>
References: <1164069640.4057.31.camel@mfarooq-1.tango-networks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1164069640.4057.31.camel@mfarooq-1.tango-networks.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Tuesday 21 November 2006 00:40, Mohammad Farooq wrote:
> Hi Guys,
>
>   I have about 1000 rules in the iptables. All these rules just forward
> the incoming traffic to other systems. I am trying to measure CPU usage
> of the netfilter. I tried to measure with top command but some how it
> always shows that CPU is 95% idle. I am not sure if top is the
> appropriate command to measure CPU usage of the netfilter. Since all the
> filtering is happening inside the kernel there should be some other command
> to measure kernel's CPU usage. I would appreciate if someone can point to
> the right direction. Thanks.

While I don't know if there is a "right way", 5% is probably about right, even 
taking into account the top overhead.
I have a fairly complex iptable setup on a PIII 800 pushing over 40Mbps of 
mostly web traffic, NATting it to a varity of webservers on 2 different 
physical networks. Conntrack gets upto and over 60000. The busiest webserver 
handles in excess of 300 requests a second coming through the firewall.
We've just passed peak usage and the CPU usage averaged a little over 20% over 
the period, according to the nice rrdtool graphs cacti generates for me from 
snmp.

I'm also using ulogd to log dropped packets. CPU usage can average ~40% higher 
if that gets too large, or fills the disk (which it's done a couple times). I 
should turn it off really...

-- 
Mike Williams

-- 
Mike Williams

