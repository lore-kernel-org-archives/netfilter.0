From: Jason Opperisano <opie@817west.com>
Subject: Re: Problem with nat/OUTPUT/DNAT rule
Date: Fri, 12 Nov 2004 12:07:38 -0500
Message-ID: <20041112170738.GA27327@bender.817west.com>
References: <27594E8BA9D5CA458F5EF87D88B6B48F1B43@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <27594E8BA9D5CA458F5EF87D88B6B48F1B43@pxtvjoexd01.pxt.primeexalia.com>
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

On Thu, Nov 11, 2004 at 11:34:09PM -0800, Gary W. Smith wrote:
> I have been trying to upgrade a RH9 firewall box running 1.2.7a to RHEL3.  I applied patch-o-matic pptp-conntrack to the RHEL3 kernel and everything "seemed" fine.  I have an automated script that generates some baseline firewall rules for some clients.  Anyways, It fails only on RHEL3 1.2.7a.  It works on my FC2 and RH9 boxes.
>  
> The failure always happens on the nat filter, output chain:
>  
> [0:0] -A OUTPUT -d 66.120.18.34 -j DNAT --to-destination 192.198.0.34
>  
> Any ideas?

you say you applied a patch from POM and recompiled your kernel.  did
you also rebuild iptables?  IIRC the pptp-conntrack patch changes the
size of the internal structures, so an unpatched iptables will fail to
add rules in this way (usually on a NAT rule).

-j

-- 
Jason Opperisano <opie@817west.com>

