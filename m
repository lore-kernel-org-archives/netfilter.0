From: RRuegner <robert@ruegner.org>
Subject: Re: newbie struggling with p-o-m in kernel 2.6
Date: Sat, 13 Mar 2004 09:39:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4052C8C3.9080207@ruegner.org>
References: <MPG.1abbd219144e52d99896a5@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <MPG.1abbd219144e52d99896a5@localhost>
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
To: Andrew Schulman <andrex@alumni.utexas.net>
Cc: netfilter@lists.netfilter.org

Andrew Schulman schrieb:

> Hello.  I'm a newbie to patch-o-matic, though comfortable with patching 
> and building my own kernels.
> 
> I'm running kernel 2.6.3, and I'd like to install the 'condition' and 
> 'time' extensions to netfilter.  But I'm having a really hard time of 
> it.  Here's as well as I can figure it right now:
> 
> - patch-o-matic, it seems, doesn't work at all with kernel 2.6.  I can't 
> find any statement about this on netfilter.org, but someone in a 
> newsgroup said it was so, and when I try to apply patches with p-o-m it 
> fails with complaints about not finding Config.help etc.  Shouldn't this 
> be a FAQ?
> 
> - I grabbed patch-o-matic-ng-20040302, and tried it.  But it won't apply 
> the condition and time patches, because both of them are marked 'linux 
> < 2.6.0'.
> 
> So as far as I can tell, right now someone who wants to use the 
> condition and time extensions with kernel 2.6 is just out of luck.  Am I 
> right, or is there some other technique that I'm missing?  Do we have an 
> ETA for 2.6-compliant condition and time patches?
> 
> Also, a couple of minor complaints from a newbie:
> 
> - It seems that all of the old patch suite structure is gone, but the 
> docs haven't caught up yet.  The Netfilter Extensions HOWTO is very 
> nice, but unfortunately it's no longer accurate.  The newbie is left to 
> discover this for himself and guess that where before he would run e.g. 
> './runme extra/condition', the new command is './runme condition'.  
> 
> - Even though I try to run runme in batch mode, it always asks where my 
> iptables source code is.  Looking through the script, there doesn't seem 
> to be an environment variable to set for that.
> 
> I realize that p-o-m-ng is a work in progress.  Please consider these to 
> be constructive suggestions for improvement.
> 
> Longer term, what is the plan for getting all of these useful extensions 
> merged into the main kernel line?
> 
> Thanks for your help.
> Andrew.
> 
Hi Andrew,
youre right pom-ng is currently under Testing mode
watch out the list for statements from the coders
Regards

