From: Drew Leske <dleske@uvic.ca>
Subject: Re: Login load balancing
Date: Wed, 26 Apr 2006 11:27:51 -0700
Message-ID: <444FBBA7.2020501@uvic.ca>
References: <444FAEFF.1040100@uvic.ca>
	<1146073387.24375.74.camel@sehe-c4.berlin.teles.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1146073387.24375.74.camel@sehe-c4.berlin.teles.de>
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
To: Sebastian Heidl <s.heidl@teles.de>
Cc: netfilter@lists.netfilter.org

>> I'm looking for a solution (and I'm not afraid of devving one if necessary)
>> to load-balance SSH logins over several mostly identical systems.
> 
> This sounds like a job for LVS. Have a look at
> http://www.linuxvirtualserver.org/

Thanks Sebastian.  I should have mentioned however that I have looked at
this and I'd like to avoid it.  I'm not afraid of compiling my own kernel or
software, but here at work we avoid using anything but our distribution's
standard kernel package.  If it comes down to the choice between using LVS
and not providing the load-balancing service at all, I will probably have to
choose the latter.

-- 
Drew Leske :: Systems Group/Unix, Computing Services, University of Victoria
  dleske@uvic.ca / +1250 472 5055 (office) / +1250 588 4311 (cel)

