From: Cynthia Wong <cindywon@engin.umich.edu>
Subject: UDP packet forwarding woes
Date: Sun, 10 Nov 2002 13:49:17 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.SOL.4.44.0211101348250.13079-100000@azure.engin.umich.edu>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I've read a couple HOWTOs on iptables, and I still can't figure out how
to do this.  Was wondering if you guys could help me out a li'.

I'm trying to do the following with iptables:

Recieve a UDP packet;

for the same packet:

forward it to multiple hosts in forwarding table (minus a TTL or so)
AND
pass it to user level to process

I was wondering if someone could give me a pointer or two.

Thanks,
cyn



