From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: iptables wishes
Date: 01 Apr 2003 12:17:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049192271.9857.49.camel@tux.rsn.bth.se>
References: <200304010341.48281.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304010341.48281.netfilter@newkirk.us>
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
To: netfilter@newkirk.us
Cc: Netfilter <netfilter@lists.netfilter.org>

On Tue, 2003-04-01 at 10:41, Joel Newkirk wrote:

> Personally I have four:
> 
> 1 - revamped LOG entry format, especially cleaning up MAC.

see the next remark.

> 2 - completely separate netfilter logging from kernel log streams.  (not 
> just redirecting infrequently-used kernel streams, but actual dedicated 
> netfilter streams)

use ULOG
you can easily modify the format it uses for the logfile.
that part of the source isn't complicated at all.
 
> 3 - Ability to match "original DestinationIP" of a DNATted packet in 
> subsequent chains.  Useful with a single physical interface but multiple 
> IPs bound to it.

Already there, look at the conntrack match (ipt_conntrack)

iptables -A FORWARD -m conntrack --ctorigdst 1.1.1.1 -j ACCEPT

> 4 - addition of support for a REM field in rules.  Would do nothing 
> whatsoever except print the specified REMark text at the end of the rule 
> in -L listings.  Something like:
> iptables -A INPUT -p tcp --dport 22 -s a.b.c.d -j ACCEPT -REM JoelSSH
> So that a -L listing could be easier & quicker to decipher sometimes.  It 
> would also allow "iptables -L -v -n | grep Joel" to list only rules, in 
> all chains, with "Joel" in the comment.

Has been debated frequently, you can probably find some of the
discussions by using google.

-- 
/Martin

