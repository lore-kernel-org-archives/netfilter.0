From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Kernel, IPTables or Router Anomaly? Maybe me?
Date: Fri, 31 Oct 2003 15:49:49 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031031204949.GB30613@cannon.eng.us.uu.net>
References: <1067611776.1427.47.camel@main.tqmcube.com> <20031031191842.GA30613@cannon.eng.us.uu.net> <1067630965.1432.59.camel@main.tqmcube.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1067630965.1432.59.camel@main.tqmcube.com>
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
Content-Transfer-Encoding: 7bit
To: "David C. Hart" <DCH@TQMcube.com>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

OK, first of all don't use ifconfig and the family. Use iproute2.
By doing:

ip addr add 192.168.0.31/24 dev eth0
ip addr add 192.168.0.5/24 dev eth0
ip addr add 192.168.0.32/24 dev eth1

This way you will not have the weird eth0:1 which most probably is
the culprit.

Ramin

On Fri, Oct 31, 2003 at 03:09:26PM -0500, David C. Hart wrote:

> On Fri, 2003-10-31 at 14:18, Ramin Dousti wrote:
> > You have three interfaces on the same 192.168.0.0/24. Why?
> > 
> Postfix needs two. While I could create a virtual IP, NIC cards are
> cheap enough.
> 
> eth0: SMTP Postfix
> eth1: HTTP, FTP, etc and Postfix redirects for regex header and body
> checks.
> eth0:1 A virtual IP used exclusively to direct port scans and other
> miscreant traffic to.



