From: William Stearns <wstearns@pobox.com>
Subject: Re: iptables related
Date: Mon, 8 Dec 2003 14:36:59 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0312081433430.2784-100000@sparrow>
References: <20031208191947.GA1603@msservices>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031208191947.GA1603@msservices>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeffrin <jeffrin@gamebox.net>
Cc: ML-netfilter <netfilter@lists.netfilter.org>

Good afternoon, Jeffrin,

On Tue, 9 Dec 2003, Jeffrin wrote:

> hello all,
> 
> iptables -A INPUT -sport 80 -j ACCEPT
> 
> shows error ...
> 
>  msservices:~# iptables -A INPUT --sport 80 -j ACCEPT
> iptables v1.2.9: Unknown arg `--sport'
> Try `iptables -h' or 'iptables --help' for more information.
> 
> please help me ...

	You haven't specified which protocol.  Unlike some firewall types 
that interpret your request as "please match tcp source port 80 or udp 
source port 80", iptables requires you to specify which protocol, and make 
two seperate rules if you want to match tcp or udp.
	Since I assume you're looking to match _tcp_ port 80, try the 
following:

iptables -A INPUT -p tcp -sport 80 -j ACCEPT

	By the way, this will allow someone to portscan your systems as 
long as they're using a source port of 80.  I'd suggest you look into 
using the "state" module to remember outgoing connections, and then allow 
incoming tcp source port 80 traffic _if_ it's part of an extablished 
connection.
	Cheers,
	- Bill

---------------------------------------------------------------------------
	Having Microsoft give us advice on open standards is like W.C. Fields 
giving moral advice to the Mormon Tabernacle Choir
	-- Scott McNealy, Sun Microsystems Inc.
(Courtesy of Michael Remski <mremski@ix.netcom.com>)
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   http://www.stearns.org
Linux articles at:                         http://www.opensourcedigest.com
--------------------------------------------------------------------------


