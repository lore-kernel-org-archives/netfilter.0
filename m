From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ipt_iplimit - IPtables 1.2.7a - Kernel 2.4.18 Issue Resolved
Date: Sun, 29 Sep 2002 13:45:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020929124557.VRSF2092.mta07-svc.ntlworld.com@there>
References: <OE29obC32qU4Z5flHgS00004b68@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OE29obC32qU4Z5flHgS00004b68@hotmail.com>
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

On Sunday 29 September 2002 12:18 pm, hard__ware wrote:

> Hello Eveyone .. :D
>
> just been doing alot of kernel patching / hacking lately with Netfilter ,
> (i luv it :-D ).

> ### Now here's a real nice one. Sick of two many connetions being tracked
> by netfilter that are not even ### being used or conntrack's that didnt
> recive a CLOSE or FIN message, this way you can lower the ### default Time
> To Tive for TCP connection tracking while using NetFilter / Iptables.  Try
> setting the
> ### time value's in this lower,  Expecially the one that Says 5 Bloody Days
> ###  --- 5 DAYS, /* TCP_CONNTRACK_ESTABLISHED, */

Please don't refer to the connection timeout values as Time To Live, 
especially if you put it in comments or documentation for any patches you 
submit - it'll confuse people.

Time To Live refers to the number of router hops an IP packet is allowed to 
go through.

TCP timeouts are the number of seconds a machine will wait for a TCP 
connection to change its status before dropping it from a connection tracking 
table.

They're very different, and people will get confused if you make them think 
the "Time" in "Time To Live" is measured in seconds (it was originally 
intended to be, but is now number of routers).

Antony.

-- 

Software development can be quick, high-quality, or low-cost.

The customer gets to pick any two out of three.

