From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables on FreeBSD
Date: Thu, 23 Jun 2005 09:21:21 -0400
Message-ID: <20050623132121.GA16400@bender.817west.com>
References: <000001c69530$0cbbf050$1000a8c0@mutogen>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000001c69530$0cbbf050$1000a8c0@mutogen>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Jun 21, 2006 at 04:39:46PM +0400, Artiom Matiuhoff wrote:
> Hello,
> 
> Is it possible to setup iptables on FreeBSD5.3?

no.  but freebsd 5.3 does ship with *three* firewall applications in the
base system (ipfw, ipf, pf), so you should be able get something going.

-j

--
"Peter: Quiet, sweetie. Men are talking."
        --Family Guy

