From: Georgi Alexandrov <tehlists@hotpop.com>
Subject: Re: matchlimit
Date: Wed, 20 Apr 2005 14:46:40 +0300
Message-ID: <42664120.4090700@hotpop.com>
References: <4266383E.5000002@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4266383E.5000002@eccotours.dyndns.org>
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

Brent Clark wrote:

> Hi all
>
> What would be the recommended the rule for matchlimit FROM a specfic
> ipaddess.
>
> Last night I found that I was a victim of a dictionary brute force 
> attack.
>
> From what I gather I can see that no access was granted.
>
> If anyone has any tip, advice, etc it would be most appreciated.
>
> Kind Regards
> Brent Clark
>
> ====================================================================
> Copy and paste below from logwatch
> ====================================================================
>
>    --------------------- SSHD Begin ------------------------
> Failed logins from these:
>      Ionutz/password from 80.84.248.224: 1 Time(s)
>      Melk/password from 80.84.248.224: 1 Time(s)
>      aaron/password from 80.84.248.224: 1 Time(s)
>     

*snip*

> Illegal user portmap from 80.84.248.224
> Illegal user x from 80.84.248.224
> Illegal user jas from 80.84.248.224
>    ---------------------- SSHD End -------------------------
>    ###################### LogWatch End #########################
>
>

This will be kind of pointless too (baning ip addresses after they have 
attacked you) ... like having an umbrella but after the rain has stopped.
The better solution (my opinion) will be to secure your sshd to the 
highest level possible.
tips:
keep it up to date,
use strong passwords (long, containing numbers, special characters, up 
and lower case),
change the default port sshd listens to,
allow only ssh version 2,
disable password authentication at all and use pub/priv keys if possible,
allow only specific users and/or groups if possible,
disable root logins,
and finally, if possible (i don't like this option but someone may find 
it useful) - allow connections to the sshd port only from trusted/known 
ip addresses.

Everything written above is just my point of view and is concerning openssh.

regards,
Georgi Alexandrov

