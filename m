From: David Cannings <lists@edeca.net>
Subject: Re: problem with nmap
Date: Mon, 16 Feb 2004 14:30:55 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402161430.55591.lists@edeca.net>
References: <001901c3f496$5feac900$7b00000a@optusclub.gr>
Reply-To: david@edeca.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001901c3f496$5feac900$7b00000a@optusclub.gr>
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

On Monday 16 February 2004 14:08, Galiatsis Sokratis wrote:
> I want to know if there is a "special" rule which blocks all nmap
> scanning methods. I have something here for fragments, xmas, nmap etc
> but whenever i try to test it my server ports are always shown as open
> instead of stealth. I tried Online Symantec Security Scan and nmapping
> from another host from an external network. Both show the same results.

Are these scans coming from places that should be able to access your 
services or not?  The whole point of having your ports open is so that 
people can access what is behind them, the whole point of using nmap to 
scan is to see what ports are open.  The TCP connect scan in nmap 
connects exactly the same as any other client application would, 
therefore you'll never completely stop a scan unless you want to block 
access totally.

Perhaps rate limiting to 5 SYN-only packets (or other, for the special 
cases) per second might help.  This will slow a scan considerably, though 
you may have to play with the timing:limit ratios.  Blocking invalid 
packets (those unrelated to existing connections) and packets with flags 
that are bogus (such as SYN and FIN at the same time, to give a poor 
example) will also block scans.

David

