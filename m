From: Ryan Beisner <ryanb@thedataarc.com>
Subject: Overriding REDIRECT for certain hosts (SQUID)
Date: 23 Nov 2002 09:46:19 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038066385.4859.12.camel@rbhome>
References: <20021123052657.30417.33449.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021123052657.30417.33449.Mailman@kashyyyk>
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


I don't know if anyone else has noticed, but SQUID doesn't treat some
websites very kindly in its http acceleration (transparent proxy). 
Mainly, Microsoft Outlook Webmail (I have a client using it).

[ BTW this is a strange breed of a web based mail system .. it looks
like you're using Outlook, within a webpage, released by MS.  Their
firewall info claims that HTTP is the only protocol in use. ]

I have already configured Squid not to cache that entire domain, and it
doesn't cache it.  I've flushed the cache, then looked at the "All Cache
Objects" SQUID report, to find none at domain XYZZZ.COM.

OK, so how would one turn this rule around into a couple of rules that
redirect port 80 to 3128, *unless* it's to/from "any-host.xyzzz.com" or
"any-host.anotherdomain.com"  etc ?


.......................}SNIP{...........................
$ipt -t nat -A PREROUTING -i $eth0 -p tcp --dport 80 -j REDIRECT
--to-port 3128
.......................}SNIP{...........................


I realize I could create a rule based on their IP range, but I want the
rule to be based on the domain name -- I haven't yet seen that in
action.  ;}


All help is appreciated!  

TIA

-Ryan Beisner




