From: "giovanni costagliola" <giovanni.costagliola@nexusat.it>
Subject: iptables: troubling identifying  devices
Date: Thu, 12 Feb 2004 18:29:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BFEIJHPOPCCMOPEKHHMOOEDOCNAA.giovanni.costagliola@nexusat.it>
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

hello guys,
	I'm experiencing a strange problem with iptables nat configuration.

I've set up a star firewall with 3 physical NIC. I've configured two oh them
with multi-ip assignement.

let's go to the core of the problem. it seems that the iface identified by
eth0_1, eth0_0 are not recognized by iptables. if I change the name using
the less qualified eth0 (adding some more details to discriminate the
source) it works.

where I am wrong?

I have also noticed that iptable accept any name to identify the NIC.

my workaround is not so elegant. there's another way to name the iface
multiIPed?

thanx in advance


*g

    Giovanni Costagliola
    [IT Senior Consultant]


