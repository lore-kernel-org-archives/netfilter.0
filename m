From: David Cannings <lists@edeca.net>
Subject: Re: Not forwarding?
Date: Sun, 28 Mar 2004 22:14:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403282214.48757.lists@edeca.net>
References: <20040328155231.32b07799@darna.vectec.net> <200403282148.46815.Antony@Soft-Solutions.co.uk> <20040328165948.66bef4ef@darna.vectec.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040328165948.66bef4ef@darna.vectec.net>
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

On Sunday 28 March 2004 21:59, Cody Harris wrote:
> On Sun, 28 Mar 2004 21:48:46 +0100,
> Someone named Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> > 1. Is any other protocol being forwarded correctly?
> I'm only forwarding tcp, i don't know what the deal is with ICMP.

What about other application level protocols, such as HTTP, FTP or IMAP?  
Note that you should try to connect to something other than your 
netfilter machine, for the reasons described below.

> > 2. What does "cat /proc/sys/net/ipv4/ip_forward" return?
> 1

This is fine.

> > 3. What do you mean by "properly"?   Does ssh work at all? 
> > Sometimes?   From some machines?   Only for a certain time, then
> > stops?   What?
> It logs into my firewall. We've tested that by creating "phoneyuser" on
> the firewall and logging in as that.

You can log in to the firewall because your INPUT chain has a default 
ACCEPT policy and you don't drop packets coming in on 22.  Can you 
connect to SSH servers on the other side of the netfilter machine?  This 
is where the FORWARD chain comes into action.

As an aside, note that creating "phoneyuser" doesn't really test netfilter 
at all.  You either can or can't connect to the port, netfilter wont stop 
any specific user from logging in.

As Anthony asked, please paste at least your FORWARD chain using the -v 
switch to iptables so we can see the counters.

David

