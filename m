From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptable_nat module slows/hoses my Redhat 9.0 box
Date: Fri, 12 Dec 2003 23:11:27 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312122311.27034.Antony@Soft-Solutions.co.uk>
References: <EFBADA8C200C2B418DA39734FD15475B0B20F1@skat.sky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <EFBADA8C200C2B418DA39734FD15475B0B20F1@skat.sky.com>
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

On Friday 12 December 2003 10:53 pm, Kishore Dharmavaram wrote:

> Hello Jan & All,
>
> Yes I want to do that for UDP & ICMP, can you tellme how to remove stateful
> inspection(connection tracking) for just ICMP and UDP protocols without
> removing NAT on ICMP and UDP packets.

NAT can be done on whichever protocols you do, or do not, want; however 
connection tracking is either on or off, for the entire machine.

IPtables (netfilter) supports stateful inspection; IPchains does not.   
However, if you use the connection tracking facilities, then all connections 
going through netfilter will be tracked.

You can't turn it on or off for particular types of packets - it's either on 
or off - that's it.

Antony.

-- 
"Reports that say that something hasn't happened are always interesting to me, 
because as we know, there are known knowns; there are things we know we know. 
We also know there are known unknowns; that is to say we know there are some 
things we do not know. But there are also unknown unknowns - the ones we 
don't know we don't know."

 - Donald Rumsfeld, US Secretary of Defence

                                                     Please reply to the list;
                                                           please don't CC me.


