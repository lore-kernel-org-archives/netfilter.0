From: Andy Loukes <andy@navaho.co.uk>
Subject: Re: Dropping connections
Date: Fri, 2 Jan 2004 13:24:26 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0401021322410.4138@picea.navaho>
References: <E1AZN5M-0004j4-0w@orcrist.cyberpixels.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1AZN5M-0004j4-0w@orcrist.cyberpixels.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Prince <ben@cyberpixels.com>
Cc: netfilter@lists.netfilter.org

On Wed, 24 Dec 2003, Ben Prince wrote:

> I am running Redhat 7.3 and installed iptables from the
> iptables-1.2.5-3.i386.rpm found on ftp.redhat.com .  The problem I am having
> is that I can't seem to DROP connections at all.
> 
> I am using the following syntax
> 
> $IPTABLES -A INPUT -s ip.address.he.re -j DROP

This should drop connections destined for the machine running iptables, if
it is a router you will need to drop the packets in the forward chain.

Also the order of the rules matters, if you have an ACCEPT before the DROP 
then that will match first.

tcpdump is very useful for debugging. You can also add a log rule at the 
top iptables -I will insert at the top...


-- 
Andy Loukes
http://www.navaho.co.uk				Complete Appliance Technology


