From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: per-connection byte counts
Date: Sun, 18 Jan 2004 15:07:32 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401181507.32929.Antony@Soft-Solutions.co.uk>
References: <20040118140903.GA3351@glympton.airtime.co.uk> <20040118144454.GA7660@kaufbach.delug.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040118144454.GA7660@kaufbach.delug.de>
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

On Sunday 18 January 2004 2:44 pm, Andreas Kretschmer wrote:

> am  Sun, dem 18.01.2004, um 14:09:03 +0000 mailte Adam Rice folgendes:
> > I'd like to be able to get per-connection byte-counts from the kernel, so
> > I can create a sort of top program showing what processes and users are
> > currently using the network and how much. Since I want this to be
> > something I
>
> ,----[  apt-cache show ipac-ng  ]
>
> | Description: IP Accounting for iptables( kernel >=2.4)
> |  Inserts iptables rules to classify network traffic and monitors these
> |  rules, writing the data to a file at a certain interval. It will then
> |  allow one to calculate IP accounting data and statistics.

But this will show statistics per rule, not per connection.   Anything which 
works in the rule tables, rather than the connection tracking table, will 
have this problem, because the rules don't distinguish between separate 
connections.

ie: if you have one rule allowing ftp transfers, you will see how much ftp 
traffic goes through the machine, but with all connections combined into a 
single value.

Even if you specify separate source and/or destination addresses in the rules, 
you still only see a combined value for all the connections which match.

I suspect Adam is looking for something which can provide per-connection 
accounting statistics similar to what CheckPoint FW-1 can show.

Regards,

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


