From: Jason Opperisano <opie@817west.com>
Subject: Re: Not able to get pptp-conntrack-nat from pom
Date: Wed, 01 Sep 2004 21:42:22 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094089342.1824.85.camel@wolfpack.ljm.dom>
References: <20040902012137.BCF78688@mail.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040902012137.BCF78688@mail.817west.com>
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

On Wed, 2004-09-01 at 03:08, Bassam A. Al-Khaffaf wrote:
> Hi All,
>    I am trying to install the pptp-conntrack-nat from the pom. When I try to
> launch the extra repository I will never prompted for the pptp-conntrack-nat
> patch. So I wonder what the problems are behind. I am having red hat 9 with
> kernel-2.4.20-8 and iptables-1.2.11 and the pom version is
> patch-o-matic-ng-20040302

is there a specific reason you're using 20040302?  the latest POM is
20040621
(http://netfilter.org/files/patch-o-matic-ng-20040621.tar.bz2).  the
later version might have a fix incorporated that resolves your issue.

-j

-- 
Jason Opperisano <opie@817west.com>


