From: John Jung <john.j.jung@siemens.com>
Subject: Re: Rate Limiting After a Threshold
Date: Fri, 06 Jul 2007 08:39:04 -0700
Message-ID: <468E6218.20800@siemens.com>
References: <468D63F2.7060402@siemens.com> <468E17E9.7030902@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <468E17E9.7030902@freenet.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Hissler <mhis38@freenet.de>
Cc: netfilter@lists.netfilter.org

Hi Michael,

Michael Hissler wrote:
[...]
> The hashlimit match works the other way round. Try '-j ACCEPT' and
> append a rule to drop/reject connections to this port.
> You should also use the state match, as you want to filter connections,
> not packets.
> 
> So try this:
> 
> iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
> iptables -A INPUT -p tcp --dport 23 -m state --state NEW -m hashlimit
> --hashlimit 1/hour --hashlimit-mode srcip --hashlimit-burst 1
> --hashlimit-name test -j ACCEPT
> iptables -A INPUT -p tcp --dport 23 -m state --state NEW -j REJECT

   This still doesn't quite do what I want it to do (I'm able to open up more 
than 1 telnet session per IP per hour), but it's close enough for what I need.

   I want to rate limit people using download acceleration programs on my 
Website.  So I'm willing to let the first x connections in completely, then 
slow them down at a rate of y connections per minute up to z total 
connections.  Where x, y and z will be determined at a later date.  :)

   In the past, I've had people open up 8 connections in a second, drop them 
almost immediately, then repeat.  Do this for an hour, or have multiple 
people do this, and the load on my server starts going way up.  (My Web site 
requires a lengthy authentication process that's fairly resource intensive. 
So it's usually a badly configured download acceleration program that cause 
problems.)

   As to answer some other people's questions to me: I'm moving to vanilla 
Linux 2.6.21.3 and I'm only using telnet as a test port against my eventual 
port 80 goal.  If I can rate limit telnet connections then I can rate limit 
http connections.

   If anybody can improve on the above rules, please let me know.  If not, 
like I said, it does enough for what I want.  It's not perfect, but it'll 
work for me.

						John

-- 
+-------------------------------------+-------------------------------------+
| John Jung (john.j.jung@siemens.com) |    Siemens Automation and Drives    |
|           Support Engineer          |           UGS PLM Software          |
|       Customer Support - GTAC       |     10824 Hope Street, MS: 1177     |
|       Operating Systems Group       |      Cypress, California 90630      |
+--------------------------- +1 (800) 955-0000 -----------------------------+

