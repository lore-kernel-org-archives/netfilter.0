From: edwardspl@ita.org.mo
Subject: Re: [Fwd: Server machines behind Firewall]
Date: Fri, 07 Jan 2005 23:45:32 +0800
Message-ID: <41DEAE9C.62B38374@ita.org.mo>
References: <41DEA59E.F63D5C97@ita.org.mo>
	<20050107152755.GA49@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Jason Opperisano wrote:

> > Sorry, what useful about the following function ( command line ) ?
> >
> > > iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn -d $SRV1 \
> > > ? --dport 80 -j ACCEPT
>
> um--it allows the packet through the FORWARD chain of the filter table.
> remember--you're trying to build a firewall here.

So, must I enable this kind of function for using the Firewall ?



