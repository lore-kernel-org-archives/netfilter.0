From: David Coulson <david@davidcoulson.net>
Subject: Re: "iptables: No chain/target/match by that name"
Date: Thu, 21 Dec 2006 13:51:49 -0500
Message-ID: <458AD7C5.8070404@davidcoulson.net>
References: <2FFB10CA-345B-432D-9669-128232B12051@u.washington.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2FFB10CA-345B-432D-9669-128232B12051@u.washington.edu>
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
To: Brian McNally <bmcnally@u.washington.edu>
Cc: netfilter@lists.netfilter.org

Brian McNally wrote:
> Hello,
> 
> I'm running Red Hat Enterprise Linux 3 with the 2.4.21-27.0.2.ELsmp
> kernel and iptables 1.2.8. When I try and insert the following rule:
> 
> iptables -A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080

iptables -t nat -A PREROUTING .....

Default table is 'filter', and PREROUTING isn't in there.

David

-- 
David J. Coulson
email: david@davidcoulson.net
web: http://www.davidcoulson.net/

