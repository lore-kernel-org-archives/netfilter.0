From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Can anyone tell me how to do this?
Date: Thu, 23 Sep 2004 13:29:16 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <415315FC.8030407@pbl.ca>
References: <20040923165847.46091.qmail@web51303.mail.yahoo.com>
	<1095960665.6715.23.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095960665.6715.23.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Jason Opperisano wrote:
> i'm pretty sure i recall reading somewhere that the INPUT vs. FORWARD
> decision is solely based on IP, not interface.  so even though
> conceptually it seems as though the packet would be "forwarded" from
> eth1 to eth0, it's still just an INPUT packet, as it is destined for a
> local IP (172.16.12.130)...  the "IN=" in a log entry should still show
> eth1, i think...

You are pretty right about that one.  If packet is to be delivered to 
the local process, it will end up in INPUT chain.  Decision is not made 
based upon interfaces or addresses, it is purely made based on whether 
or not packet will be delivered to local process, or forwarded to 
another (or same) interface.  This is because all the packets from all 
interfaces first go to the PREROUTING chain of nat table, after that 
routing decisions are made, and after that if packet is to be "routed" 
to local process it goes to INPUT chain of filter table, otherwise it 
goes to FORWARD chain of filter table and than to POSTROUTING chain of 
nat table and to the physical interface.  So, once packet ends up in 
FORWARD chain, kernel has already made decision through which interface 
it will be sent out, and there is no way back.

Jim Cliver has a nice diagram showing all this (one image is worth 
thousands of words):

    http://www.aptalaska.net/~jclive/IPTablesFlowChart.pdf

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

