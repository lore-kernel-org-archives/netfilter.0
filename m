From: "Benjamin Case" <benjamin_case@yahoo.com>
Subject: problem with documentation
Date: Fri, 14 May 2004 09:34:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c439c0$a5ee79f0$28c8a8c0@polm.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

I have just completed the the installation of IPTABLES in Debian based on
Russel's "Packet Filter" documentation.

I am now attempting to create the rules that Russel has provided in the
"Rusty's Really Quick Guide To Filtering".

Unfortunately I am receiving an errror.

polm:/etc# iptables -N block
polm:/etc# iptables -A block -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables: No chain/target/match by that name

When I do an iptables -L , I can see the "block" chain.

Why does the second command return an error ?

Thanks,

Ben

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.681 / Virus Database: 443 - Release Date: 5/10/2004



