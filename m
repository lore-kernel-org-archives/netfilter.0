From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Iptables execution time
Date: Fri, 17 Oct 2008 13:53:19 +0200
Message-ID: <48F87CAF.9000507@netfilter.org>
References: <48F77A0F.1050405@unipex.it> <48F77E8A.6080502@netfilter.org> <48F7853A.20500@unipex.it> <002301c92fe5$3234ff00$969efd00$@bourke@mobileinternet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <002301c92fe5$3234ff00$969efd00$@bourke@mobileinternet.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: John Bourke <john.bourke@mobileinternet.com>
Cc: 'Michele Petrazzo - Unipex srl' <michele.petrazzo@unipex.it>, netfilter@vger.kernel.org

John Bourke wrote:
> Folks,
> 
> I ran some tests tonight.  I took our usual firewall rule count of about
> 5000 rules and added another 25,000.  At every 100 added I measured the time
> taken to add the last of the 100.
> 
> After the first 100 rules, a rule was added in 29ms.  After 25,000 rules
> were added last the rule was added in 169ms.  The total number of rules at
> the end was 29716.
> 
> On another system, the 100th rule added in 40ms, the 25,000th rule added in
> 90ms, and the total rule count at the end was 32227.
> 
> The rule add was a simple 
> 
> iptables -I FORWARS -s 10.0.a.b -j ACCEPT
> 
> Where a was from 1 to 250 and b was from 1 to 100.  So I was not doing
> anything more complex.
> 
> Even at 40ms, I can only load 25 rules a second.  As I have a dynamic
> firewall which changes every second, and each of my users has about 25
> rules, I can only handle one user addition or removal a second.  I would
> like to do 10 per second, 250 rules per second.
> 
> Are there better ways to do this, iptables-restore, ipset ?

Use iptables-restore -n and pipe the rules updates for dynamic rule 
addition and deletion.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
