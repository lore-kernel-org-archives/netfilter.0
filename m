From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: NEW "SSH Brute Force " ruleset (20050628.0)
Date: Mon, 5 Sep 2005 15:14:02 -0500
Message-ID: <200509051514.02728.rob0@gmx.co.uk>
References: <42C0F7E4.4060805@riverviewtech.net>
	<200509040001.17950.rob0@gmx.co.uk>
	<200509041459.33329.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509041459.33329.rob0@gmx.co.uk>
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
To: netfilter@lists.netfilter.org

On Sunday 2005-September-04 14:59, I wrote:
> -A Ssh -m state --state ESTABLISHED -j ACCEPT
> -A Ssh -m limit --limit 3/m --limit-burst 3 -j ACCEPT
> -A Ssh -m limit --limit 1/m --limit-burst 1 -j LOG --log-prefix "SSH attack: "
> -A Ssh -j REJECT 

Originally when I did this I used DROP. DROP sent the bots away. But
results with REJECT today indicate a sort of tarpitting effect: one bot
took 11 minutes from start to finish, logging 33 attempts to
authenticate and 11 --log-prefix "SSH attack: " entries.

So it depends what your goal is. If you don't feel safe enough with
your sshd, use DROP. If you want to interfere with their operation,
REJECT.

I think that REJECT gives them an opportunity to DoS, to a small
extent. During that 11-minute attack I probably would not have been
able to SSH in. If that's so, DROP should effectively limit the DoS to
one minute per attack.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

