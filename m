From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Question on INPUT and PREROUTING chains
Date: Sat, 9 Nov 2002 14:42:56 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021109144300.JGFE21275.mta07-svc.ntlworld.com@there>
References: <E189XVl-0008TW-00@kashyyyk.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E189XVl-0008TW-00@kashyyyk.netfilter.org>
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

On Wednesday 06 November 2002 7:14 pm, Carlos.facanha wrote:

> I have a Linux box used as NAT server and firewall. All requests on its
> port 80 are forwarded to a local webserver inside my network. I want to
> block access to all services including http from a specific external host.

Note your (correct) use of the word "forwarded" in the above paragraph.

> I'm using the following rule to block the host
>
> iptables -A INPUT -i $extint -s $hostip -j DROP

Note your (incorrect) use of the word "INPUT" in the above rule.

Change the rule to the FORWARD chain and it should do what you want.

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

