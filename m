From: KOVACS Krisztian <piglet@sch.bme.hu>
Subject: Re: Traffic accounting over ULOG inefficient?
Date: Thu, 10 Jun 2004 21:27:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040610192717.GA29599@sch.bme.hu>
References: <200406102005.20214.arny@ats.s.bawue.de> <m2u0xjgthu.fsf@catbert.dok.org> <200406102112.02640.arny@ats.s.bawue.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200406102112.02640.arny@ats.s.bawue.de>
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
To: Thilo Schulz <arny@ats.s.bawue.de>
Cc: netfilter@lists.netfilter.org


  Hi,

On Thu, Jun 10, 2004 at 09:11:48PM +0200, Thilo Schulz wrote:
> On Thursday 10 June 2004 20:25, Chris Green wrote:
> > There is a patch in patch-o-matic for ctnetlink that implements a
> > different type of interface to get these counters from connection
> > tracking but I can't seem to find out any information on it aside
> > from questions about it go unanswered.
> 
> Actually, I'm not so much interested in connection checking. What I need is a 
> counter, that tells me how much data is going through a rule, without giving 
> me the content of the packet itself.

  Maybe this tiny module is what you're looking for? (Although I've never
used it myself, it looks to me a viable approach to traffic accounting.)

  http://www.intra2net.com/opensource/ipt_account/

-- 
 KOVACS Krisztian


