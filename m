From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: NEW "SSH Brute Force " ruleset (20050628.0)
Date: Sun, 4 Sep 2005 14:59:33 -0500
Message-ID: <200509041459.33329.rob0@gmx.co.uk>
References: <42C0F7E4.4060805@riverviewtech.net>
	<431A1ED8.4090707@riverviewtech.net>
	<200509040001.17950.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509040001.17950.rob0@gmx.co.uk>
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

On Sunday 2005-September-04 00:01, I wrote:
> The new "Ssh" chain does this:
> -A Ssh -m state --state ESTABLISHED -j ACCEPT
> -A Ssh -m limit --limit 3/m -j ACCEPT
> -A Ssh -m limit --limit 1/m j LOG --log-prefix "SSH attack: "
[ note, a typo here ----------^ "-j" ]
> -A Ssh -j REJECT
[snip]
> Another curious thing about the --limit is that when I stress test
> it: for X in `seq 99` ; do
>     echo $X | nc target.hostname ssh & echo -n $X
> done
> with 3/m I get 5 connections through, and usually about 5 logged with
> the 1/m limit. That test just now got 8 connections through (not all
> made it in the first minute.)

RTFM:
--limit-burst number
     Maximum  initial  number  of  packets to match: this number gets
     recharged by one every time the limit  specified  above  is  not
     reached, up to this number; the default is 5.
So I've changed the above:
-A Ssh -m state --state ESTABLISHED -j ACCEPT
-A Ssh -m limit --limit 3/m --limit-burst 3 -j ACCEPT
-A Ssh -m limit --limit 1/m --limit-burst 1 -j LOG --log-prefix "SSH attack: "
-A Ssh -j REJECT

I still got 8 packets of the 99 through, but only 2 were logged, one
minute apart.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

