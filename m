From: "Marius Mertens" <marius.mertens@gmx.de>
Subject: Re: SSH Brute force attacks
Date: Sun, 22 May 2005 12:09:11 +0200
Message-ID: <004501c55ebb$61a49b00$4206a8c0@loki>
References: <427B93EE.3030905@eccotours.dyndns.org>	<42898402.10507@eccotours.dyndns.org><4289E72F.7020901@wp.pl>
	<200505211200.28314.pvolkov@mics.msu.su>
	<428FB81F.6030403@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: netfilter@lists.netfilter.org

On Sunday, May 22, 2005 12:37 AM,
Taylor, Grant wrote:

>> Why this update here (see below)?
>>
>> $ipt -A SSH_Brute_Force -m recent --name SSH --update
>>
>> Every time packet passed --set rule it updates SSH. So if drop this
>> rule, nothing changes. Or am I wrong? Is there any idea behind this
>> that I missed.
>
> The "--set" rule is required because the testing that I did the
> "--update" rule would not effectively do the same thing as "--set"
> because there was no initial "--set" to be updated.  It's sort of a
> chicken and egg problem where you can not successfully have one with
> out having the other in this scenario.  The only draw back to having
> the "--set" that I'm aware of is that the hit count is incremented
> once per "--set" and "--update" thus you have to double the
> "--hitcount" value that you want to match against.

I might be misunderstanding something, but, Peter, is it correct that you 
wanted the "--update" rule to be removed?
In that case I also think it can be safely removed, for it also usually even 
does not seem to match anyway. It should rather match only when there are 
already too frequent connections, so "-j RETURN" won't hit, right? But i'd 
rather like to also hear the opinion of somebody more experienced with 
"recent" match than I am, for the helpfile did not say if the "--set" is 
updated if it already exists. (Though I expect that, and I admit it could be 
easily tested if "--set" updates an already existing "--set" or not, but I 
have to leave right now. I think I'll examine that when I'm back if nobody 
is faster ;-) )

Greetings,

Marius 


