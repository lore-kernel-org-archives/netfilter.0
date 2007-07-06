From: Michael Hissler <mhis38@freenet.de>
Subject: Re: Rate Limiting After a Threshold
Date: Fri, 06 Jul 2007 12:22:33 +0200
Message-ID: <468E17E9.7030902@freenet.de>
References: <468D63F2.7060402@siemens.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <468D63F2.7060402@siemens.com>
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

John Jung wrote:

[...]

>   I think hashlimit is the key, but it really just doesn't want to work
> for me.  For example, I've tried:
> 
>     iptables -A INPUT -p tcp --dport 23 -m hashlimit --hashlimit 1/hour
>       --hashlimit-mode srcip --hashlimit-burst 1 --hashlimit-name test
>       -j REJECT


The hashlimit match works the other way round. Try '-j ACCEPT' and
append a rule to drop/reject connections to this port.
You should also use the state match, as you want to filter connections,
not packets.

So try this:

iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 23 -m state --state NEW -m hashlimit
--hashlimit 1/hour --hashlimit-mode srcip --hashlimit-burst 1
--hashlimit-name test -j ACCEPT
iptables -A INPUT -p tcp --dport 23 -m state --state NEW -j REJECT

(If you enter the rules in this order, you can omit the '-m state
--state NEW' in the last rule, but OTOH it doesn't hurt.)


michael


