From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: Chain Policy DROP versus ACCEPT and logging
Date: Sun, 12 Oct 2003 11:06:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065971170.2922.104.camel@alpha.newkirk.us>
References: <1065967220.5801.10.camel@tarkus>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1065967220.5801.10.camel@tarkus>
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
To: tedkaz@optonline.net
Cc: netfilter@lists.netfilter.org

On Sun, 2003-10-12 at 10:00, Ted Kaczmarek wrote:
> I have seen many setups where the default CHAIN Policy is to accept
> packets by default versus dropping them. 
> >From my perspective a firewall should implicitly deny everything, hence 
> INPUT and FORWARD should be DROP. 
> Then rules are put in to allow what you want. 
> But, one seems to lose some logging capabilities with such a setup.
> Is their a way to log the default INPUT and FORWARD policies for dropped
> packets with them set to DROP as opposed to having them set to ACCEPT
> and putting in logs for any deny rules.

Yep, just make a log rule last in the chain...

iptables -A FORWARD -j LOG --log-level 7 --log-prefix "FWDDROP:"

for instance.  Just remember that any rules added after this cannot
simply be "-A", or they'll be appended after the log rule.  They'll
still work properly but the packets they accept would be logged as
having been dropped.

j




