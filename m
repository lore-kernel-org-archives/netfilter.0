From: "Dmitry B. Khlonin" <dmitry@khlonins.com>
Subject: ARP mangling
Date: Sat, 14 Jun 2003 21:37:17 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EEB5D4D.7050902@khlonins.com>
References: <IHEHKFMEMKMGFDMIAHCIMEGEDNAA.borda@netwall.com.br> <1055604467.1853.30.camel@alpha.newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1055604467.1853.30.camel@alpha.newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Is it possible to mangle ARP packets with new netfilter extension?
I saw it configured in kernel but I have no see any related mans or docs.

This need to be resolved for me, because I have ebtables (same as 
iptables but on ethernel level)
and need to mangle ARP packets for normal ethernet NAT work. I looked in 
the ebtables archives and
saw answer to similar question - this is iptables possibility.



