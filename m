From: "Michael P. Soulier" <michael_soulier@mitel.com>
Subject: portforwarding difficulties
Date: Thu, 23 Jan 2003 14:45:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030123144544.V8675@e-smith.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

    People,

    My apologies if this has been asked before. 

    I'm setting up iptables to permit a DMZ configuration to be managed by
a Linux box with 3 NICs. Currently, in the PREROUTING chain of the nat
table, I have a rule stating:

/sbin/iptables --append PREROUTING --protocol tcp \
               --dport 6800 \
               -d $external_interface/32 \
               -j DNAT --to-destination $server

    Now, from the internet on the external interface, this works fine. The
server box receives the forwarded traffic. However, from a box on the
private network, the DNAT rule is skipped, and the client ends up trying to
connect to the gateway, which fails since nothing is listening on that
port. 

    My question is, if a client on the private network tries to connect to
$external_interface, should the DNAT rule in the PREROUTING chain match? It
does not appear to be.

    I can see the traffic arrive with tcpdump, but my logging rule in the
firewall that records DNAT'd traffic, which works fine from the internet,
logged nothing in the private network case. 

    Thanks,
    Mike

-- 
Michael P. Soulier <michael_soulier@mitel.com>, 613-592-2122 x2522
SME Solutions, Mitel Networks Corporation
"...the word HACK is used as a verb to indicate a massive amount
of nerd-like effort."  -Harley Hahn, A Student's Guide to Unix

