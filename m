From: James Sneeringer <james+netfilter@vincentsystems.com>
Subject: Re: ip_conntrack_max
Date: Thu, 8 Jul 2004 10:28:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040708152840.GB28733@valjean.si.ocslink.com>
References: <40ED161F.5070804@cisbic.com> <200407081056.14826.Antony@Soft-Solutions.co.uk> <40ED226E.8070808@cisbic.com> <200407081152.42618.Antony@Soft-Solutions.co.uk> <40ED4865.7020208@cisbic.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <40ED4865.7020208@cisbic.com>
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
To: netfilter@lists.netfilter.org

On Thu, Jul 08, 2004 at 03:13:09PM +0200, Fallucchi Antonio wrote:
> Another questions: how I can limit the number of connection for every 
> computer?

POM has a "connlimit" module that does this for TCP connections.  I have
not used it, so I don't know how well (or how poorly) it works.

http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-connlimit

-James


