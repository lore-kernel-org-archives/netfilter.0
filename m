From: David Cannings <lists@edeca.net>
Subject: Re: iptables dnat to loopback
Date: Sat, 7 Aug 2004 11:15:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408071115.31300.lists@edeca.net>
References: <D5C9032B2B09C64EA2409D6214E91AC905124D@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC905124D@asimail2.alphanumeric.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Friday 06 August 2004 18:13, Jason Opperisano wrote:
> however, after some further testing--your original DNAT *should*
> work--the problem is probably somewhere in your filter rules.  i just
> tested this with a machine that has sendmail bound only to 127.0.0.1:
[..]
> note the inbound interface is "lo" and both the src and dst IP's are
> 127.0.0.1.  if you need to filter this kind of connection--make sure
> you specify a "-s x.x.x.x" in your DNAT rule.

Apologies if I am taking your mail seriously out of context, I missed the 
original mail.  In short, DNAT to 127/8 wont work unless both source and 
destination IPs are 127/8.  This is correct and is to do with the way the 
kernel filters "martians".

If you want to DNAT from an external interface to loopback, bind a private 
(RFC1918) address to loopback, then DNAT to that address.

For more, I posted the following a while back:

http://www.linuxarkivet.se/mlists/netfilter/0403/msg00770.html

The idea of binding an RFC1918 address to loopback to solve the issue was 
provided as a follow-up to that mail by somebody else.

David

