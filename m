From: Patrick Schaaf <bof@bof.de>
Subject: Re: Nat OUTPUT chain
Date: Sun, 16 Jun 2002 09:43:39 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020616094339.A32016@oknodo.bof.de>
References: <OE35qimrMh0R1hY55Zo00015235@hotmail.com> <200206152359.g5FNxwA32623@Networker.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <200206152359.g5FNxwA32623@Networker.rockstone.co.uk>; from Antony@Soft-Solutions.co.uk on Sun, Jun 16, 2002 at 12:59:56AM +0100
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

Hi all,

> Why do you DROP in the nat table instead of the filter table ?

Note that there are situations where this is advisable, and other
approaches result in more complex rulesets.

Imagine a situation where you want to REDIRECT certain incoming
connections, e.g.  everything to --dport 80, with the local service
running on port 3128. However, you DON'T want to have those redirected
clients access 3128 DIRECTLY. Using REDIRECT, both the direct and
redirected connections arrive in the filter table's INPUT chain,
and cannot be easily distinguished there, because the filter table
sees the rewritten destination IP and port.

My first solution involved the mangle table, tagging the different
incoming packets with an fwmark, and using that fwmark in both the
NAT and filter tables.

My current solution does the desired REDIRECTs in the NAT table,
and DROPs everything unwanted right there; the filter table just
permits the redirected port 3128 traffic. So that's where I found
good use for DROP in the NAT table.

An alternative, not doable with stock iptables (there's something
in p-o-m, I think), would be a filter table target which is capable
of matching the ORIGINAL_DESTINATION of the REDIRECTed connections.

best regards
  Patrick

