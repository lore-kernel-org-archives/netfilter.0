From: Michael Hissler <mhis38@freenet.de>
Subject: Re: Rate Limiting After a Threshold
Date: Fri, 06 Jul 2007 19:56:13 +0200
Message-ID: <468E823D.20105@freenet.de>
References: <468D63F2.7060402@siemens.com> <468E17E9.7030902@freenet.de>
	<468E6218.20800@siemens.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <468E6218.20800@siemens.com>
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
> Hi Michael,
> 
> Michael Hissler wrote:

>> iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
>> iptables -A INPUT -p tcp --dport 23 -m state --state NEW -m hashlimit
>> --hashlimit 1/hour --hashlimit-mode srcip --hashlimit-burst 1
>> --hashlimit-name test -j ACCEPT
>> iptables -A INPUT -p tcp --dport 23 -m state --state NEW -j REJECT
> 
>   This still doesn't quite do what I want it to do (I'm able to open up
> more than 1 telnet session per IP per hour), but it's close enough for
> what I need.

Sorry, my fault! I forgot to add '--hashlimit-htable-expire 3600000'.
Per default, hashtable entries expire after 10 seconds.
See /proc/net/ipt_hashlimit/test, the first column shows the remaining
time in seconds.

michael



