From: Roberto Nibali <ratz@tac.ch>
Subject: Re: IPTables Feature set and performance.
Date: Wed, 04 Dec 2002 14:17:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DEE004C.1010102@tac.ch>
References: <OE22IyhXMOYdOiQ4rYn000056cb@hotmail.com> <3DEBEB33.2070806@iprimus.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael <mutk@iprimus.com.au>
Cc: netfilter@lists.netfilter.org

Hi,

> In addition to this, I have found one mention of throughput capabilities 
> of iptables. According to this reference :http://www.hipac.org/  (The 
> performance test links), iptables does have significant limitation of 
> throughput when large (Sequential) rulesets are used. I believe under 

Exactly.

> ideal circumstances, and with carefull attention paid the impact can be 
> minimised.

Exactly.

But simply consider the fact that some people do not write their fw rules by 
hand, they generate it via a meta language layer. It is apparent that the 
generation of rulesets which span over multiple packet filter instances are 
implicit non-optimised.

Also consider the fact that the way nf-hipac is implemented, the matching rule 
lookup will always be equally or faster to netfilter's table lookup per 
definition and code.

> I haven't replicated the tests, and also do not know how authoritative 
> the tests are.

Preliminary tests were done by me and you can certainly consider them to be 
authoritative. Unfortunately due to health reasons and limited spare time I had 
to stop further tests. I will pick up the conduct of tests maybe in the 
beginning of next year. Together with a friend of mine I've also written a paper 
(for a link, please search this mailinglist archive) about the inefficiencies of 
various rule matching algorithms based on observation, pragmatic testing and 
code reading.

> If the tests results are accurate, this might help in making comparisons 
> and decision making. Does anyone have evidence to backup the findings of 
> nf-hipac peaple?

I do have some numbers and I have posted them to various mailinglists. Also if 
you go to the nf-hipac page itself, you see a quite a convincing test result.

Best regards,
Roberto Nibali, ratz
-- 
echo '[q]sa[ln0=aln256%Pln256/snlbx]sb3135071790101768542287578439snlbxq' | dc


