From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Speed Issues through NAT Firewall
Date: Tue, 9 Jul 2002 18:53:34 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207091753.g69Hre810110@vulcan.rissington.net>
References: <001701c2276e$3a94a0a0$6702a8c0@mindtrip.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <001701c2276e$3a94a0a0$6702a8c0@mindtrip.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Tuesday 09 July 2002 6:29 pm, Travis Crook wrote:

> Hello,

>     I currently have two firewalls running.  Both on Mandrake 8.1 running
> iptables.  I currently have two internet connections (one is a DSL line at
> 1Mb, the other is straight from an ISP at 2.5 Mb).  I can get 700Kb speeds
> through the firewall on the DSL line (which is about as fast as it ever is)
> but I only get about 500Kb speeds through the firewall on the ISP line. 
> Shouldn't I be able to get at least 2Mb speeds through this firewall?

What's your hardware (CPU, RAM, NIC) ?

How many connections do you have concurrently through the boxes ?

Quick way to get a rough idea:

wc -l /proc/net/ip_conntrack

 

Antony.

