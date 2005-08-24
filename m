From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: NOTRACK action question
Date: Wed, 24 Aug 2005 17:23:46 -0500
Message-ID: <200508241723.47038.rob0@gmx.co.uk>
References: <57F9959B46E0FA4D8BA88AEDFBE5829074E2@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE5829074E2@pxtbenexd01.pxt.primeexalia.com>
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

On Wednesday 2005-August-24 16:49, Gary W. Smith wrote:
> BTW, do you know what the limit is on connection tracking or where I
> can find/set the values.

/proc/sys/net/ipv4/ip_conntrack_max
cat(1) to read it, echo(1) to set it.

http://www.wallfire.org/misc/netfilter_conntrack_perf.txt
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

