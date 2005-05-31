From: Jorge Salamero <526715@celes.unizar.es>
Subject: Re: ip_conntrack problems with a dlink DSL504T
Date: Tue, 31 May 2005 15:08:27 +0200
Message-ID: <200505311508.27629.526715@celes.unizar.es>
References: <201E6F5AC48C274996A5AD8304FAEF869AF8@p001ex03.porta.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <201E6F5AC48C274996A5AD8304FAEF869AF8@p001ex03.porta.local>
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
To: "Baake, Matthias" <m.baake@porta.de>
Cc: "Netfilter (E-Mail)" <netfilter@lists.netfilter.org>

on Tuesday 31 May 2005 13:36, Baake, Matthias wrote:
> hi,
> it sounds like the router has not enough memory.
> i would try to lower the conntrack_max and test again if it runs stable.

i don't think so ...

# free
              total         used         free       shared      buffers
  Mem:         6560         5892          668            0          232
 Swap:            0            0            0
Total:         6560         5892          668

-- 
Jorge Salamero Sanz (bencer)
mail: <bencer@cauterized.net>
blog: <http://bys.cauterized.net/>
http: <http://www.cauterized.net/>

