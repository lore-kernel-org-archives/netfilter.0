From: "Manestro Oliveira" <manestro123@hotmail.com>
Subject: Re: bypassing a prerouting rule
Date: Fri, 25 Jun 2004 17:27:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY22-F9LKfUkngan0V000b8c81@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: john.sullivan@nexusmgmt.com

>On Wed, 2004-06-23 at 09:24, Manestro Oliveira wrote:
>Hi,
>       I am a begginer to Linux and I have a PREROUTING rule that makes 
>port redirection on incoming packages. But there is a server that don`t 
>accept that, and works only without that rule. How can I bypass the rule 
>for that server specifically?
>
>      If iptables works by matching rules and leaving the other ones 
>without checking them, then I should insert a rule before that and the 
>problem is solved. Is this correct?
>
>      Sorry if the question might be stupid, but I am taking the chance for 
>being stupid now (and maybe not forever). >)
<snip>
>Yes, you can place an ACCEPT rule before the REDIRECT rule and that will
>halt processing in the PREROUTING chain for that match.  Thanks for
>asking :-) - John
>--

   From what I've learned so far, one can only use on chain PREROUTING the 
tables nat and mangle.
How can I use an ACCEPT rule on these tables? Doesn't that suppose to use 
the filter table, which can't be used in the PREROUTING chain?

Thanks

_________________________________________________________________
MSN Hotmail, o maior webmail do Brasil.  http://www.hotmail.com


