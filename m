From: "Gary W. Smith" <gary@primeexalia.com>
Subject: Re: bridge and FORWARD chain
Date: Tue, 24 Jan 2006 11:48:06 -0800
Message-ID: <BFFBC476.E681%gary@primeexalia.com>
References: <536155680.20060124162302@alternativa.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <536155680.20060124162302@alternativa.com.br>
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
To: Marcelus Trojahn <trojahn@alternativa.com.br>, netfilter@lists.netfilter.org

Marcelus,

I only know a little about bridging so if I'm wrong please jump in.
Netfilter is designed to work on the interface that the data is traveling
across.  When you have two interfaces that are bridged they are now one
interface.  You need to treat the bridge as such.  If you have the
following:
eth0 - inet
eth1 - DMZ
eth2 - lan
brd0 - (eth0 + eth1)

Forwarding from eth0+eth1 is automatically occurring (via the bridge).
Forward rules on eth0 or eth1 no longer apply as it's brd0

Now forwarding from brd0 to/from eth2 should work.

If you need to limit forward traffic between eth0 to eth1 you need to look
towards ebtables.

That's my understanding.

Hope that helps.

Gary Wayne Smith

On 1/24/06 11:23 AM, "Marcelus Trojahn" <trojahn@alternativa.com.br> wrote:

> Friends,
> 
>   I  have  a linux bridge, using bridge-utils... I've worked with bridges
> before
>   and never had the problem I'm having now...
> 
>   The  packets go from interface to interface, but never reach the FORWARD
> chain
>   on iptables... How is that possible?
> 
>   Here's  an  example...  The  bridge  has  an  uptime of 17hrs, working with
> no
>   problems at all, yet, no packets on FORWARD chain...
> 
> # uptime
>  17:54:46 up 17:54, load average: 0.00, 0.00, 0.00
> # iptables -L -vn
> Chain INPUT (policy ACCEPT 5262 packets, 1012K bytes)
>  pkts bytes target     prot opt in     out     source
> destination
> 
> Chain FORWARD (policy DROP 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
> 
> Chain OUTPUT (policy ACCEPT 2953 packets, 940K bytes)
>  pkts bytes target     prot opt in     out     source
> destination
> 
>  The  main  reason of this bridge is to filter some unwanted traffic coming
> from
>  the network behind it... So, I need the FORWARD chain for that...
> 
>  Anything on /proc or something that can disable it?


