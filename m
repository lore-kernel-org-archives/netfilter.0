From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: NAT tables and FILTER tables
Date: Wed, 14 Sep 2005 08:13:55 -0500
Message-ID: <200509140813.55379.rob0@gmx.co.uk>
References: <43280467.4050801@india.tejasnetworks.com>
	<52968.193.173.147.3.1126697725.squirrel@193.173.147.3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <52968.193.173.147.3.1126697725.squirrel@193.173.147.3>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Wednesday 2005-September-14 06:35, Rob Sterenborg wrote:
> Looking at http://www.faqs.org/docs/iptables/traversingoftables.html
> a packet uses all tables, but not all chains.

A more recent version of the same thing is at
    http://iptables-tutorial.frozentux.net/chunkyhtml/c951.html
However neither version has been updated to include the new raw table, 
which IIUC breaks that rule. Packets changed in the raw table do bypass 
the filter table, and perhaps others as well. I'm not using raw yet, 
thus am not sure of the details.

Joerg's response was accurate but might be said to suffer from TCP 
tunnel vision: SYN is only used in TCP. Connection tracking supports 
non-TCP protocols as well.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

