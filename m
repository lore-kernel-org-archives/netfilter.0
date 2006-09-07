From: felix@crowfix.com
Subject: Re: Newbie question about NAT and forwarding
Date: Wed, 6 Sep 2006 19:43:31 -0700
Message-ID: <20060907024331.GA2591@crowfix.com>
References: <20060906205232.GA23980@crowfix.com> <ednhr3$pjc$1@sea.gmane.org>
	<44FF5F42.4050605@plouf.fr.eu.org>
	<20060907002458.GA13990@crowfix.com>
	<44FF77DD.9030005@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <44FF77DD.9030005@plouf.fr.eu.org>
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

On Thu, Sep 07, 2006 at 03:37:33AM +0200, Pascal Hambourg wrote:
> felix@crowfix.com a ?crit :
> >
> >I've used table names with iptables commands in my shell scripts, but
> >I didn't know this /etc/iproute2 directory existed.
> 
> Huh ? AFAIK, iptables commands do not use routing tables. Can you give 
> an example ?

I am showing my newbie status.  Maybe I meant chain names?  Here is a
snippet I use to enable and disable ssh, with SSH being a table?chain?
name I can use in another script:

iptables -N SSH
iptables -A SSH -j LOG --log-prefix 'IPT: SSH: '
iptables -A SSH -j ACCEPT
iptables -A INPUT-TCP -p TCP -m multiport --dports ssh -j SSH

I knew I didn't know a lot about iptables -- it looks like I knew even
less than I thought!

-- 
            ... _._. ._ ._. . _._. ._. ___ .__ ._. . .__. ._ .. ._.
     Felix Finch: scarecrow repairman & rocket surgeon / felix@crowfix.com
  GPG = E987 4493 C860 246C 3B1E  6477 7838 76E9 182E 8151 ITAR license #4933
I've found a solution to Fermat's Last Theorem but I see I've run out of room o

