From: Jason Opperisano <opie@817west.com>
Subject: Re: Problems to get TARPIT functionnality with iptables
Date: Thu, 14 Oct 2004 17:00:19 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041014210019.GA4458@bender.817west.com>
References: <487eee530410141305460b18ca@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <487eee530410141305460b18ca@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Oct 14, 2004 at 10:05:17PM +0200, Nicolas Martin wrote:
> Testing patch extra/ipt_TARPIT.patch...
> Warning - no help text file could be found in either
> /usr/src/linux/net/ipv4/netfilter/Config.help
> or /usr/src/linux/Documentation/Configure.help
> grep: /usr/src/linux/net/ipv4/netfilter/Config.in: Aucun fichier ou
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

upon further review--something's rotten in denmark...  if i'm not
mistaken, "Config.in" is for 2.4, whereas "Kconfig" is the 2.6 name...
so it seems that POM is not aware of the fact that you're running a 2.6
kernel and is trying to patch 2.4 source files...

as to why it's doing that--i have no idea.  what version of POM did you
download?  or did you grab from CVS?

-j

-- 
Jason Opperisano <opie@817west.com>

