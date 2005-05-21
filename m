From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks
Date: Sat, 21 May 2005 17:37:19 -0500
Message-ID: <428FB81F.6030403@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	<42898402.10507@eccotours.dyndns.org>
	<4289E72F.7020901@wp.pl> <200505211200.28314.pvolkov@mics.msu.su>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200505211200.28314.pvolkov@mics.msu.su>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> Why this update here (see below)?
> 
> $ipt -A SSH_Brute_Force -m recent --name SSH --update
> 	
> Every time packet passed --set rule it updates SSH. So if drop this rule, 
> nothing changes. Or am I wrong? Is there any idea behind this that I missed.

The "--set" rule is required because the testing that I did the "--update" rule would not effectively do the same thing as "--set" because there was no initial "--set" to be updated.  It's sort of a chicken and egg problem where you can not successfully have one with out having the other in this scenario.  The only draw back to having the "--set" that I'm aware of is that the hit count is incremented once per "--set" and "--update" thus you have to double the "--hitcount" value that you want to match against.



Grant. . . .

