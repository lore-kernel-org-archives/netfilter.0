From: Jason Opperisano <opie@817west.com>
Subject: Re: Port forwarding or NAT?
Date: Tue, 14 Sep 2004 13:13:56 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095182036.1895.4.camel@wolfpack.ljm.dom>
References: <01ef01c49a5f$51824900$6300a8c0@93egeater>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <01ef01c49a5f$51824900$6300a8c0@93egeater>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 2004-09-14 at 09:32, Eric Geater 9/01/04 wrote:
> I have one crazy machine at our home office that must communicate on
> port 6847 to an outside company.  This one machine went through our old
> proxy server until it died last week.  We're using IPTABLES through
> rc.firewall-2.4 on a Linux proxy, but it doesn't seem to be allowing
> this communication to occur.
> 
> Would this be handled through port forwarding or NAT?  

it would be handled by the FORWARD chain of the filter table, and by a
SNAT/MASQ rule in the POSTROUTING chain of the nat table.

-j

-- 
Jason Opperisano <opie@817west.com>


