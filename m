From: Isabelle Labbe <isabelle.labbe@crc.ca>
Subject: DSCP support in iptables 1.2.8
Date: Wed, 16 Apr 2003 15:14:24 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E9DAB90.9FFF600F@crc.ca>
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

Can anyone confirm that the DSCP target works in iptables 1.2.8 (or
1.2.7a) ?

I am running Red Hat 8.0.  I have upgraded the kernel to 2.4.20.  I have
also installed iptables 1.2.8 and when running the command:

iptables -A FORWARD -t mangle -j DSCP --set-dscp 0x1f

I get the following message:

iptables: No chain/target/match by that name

According to the docs on the netfilter site, the above command should
work. Does anyone know why it doesn't?

thank you

Isabelle

--
Isabelle Labbe
Communications Research Centre Canada
3701 Carling Av.
PO Box 11490, Station H
Ottawa, On
K2H 8S2

email: isabelle.labbe@crc.ca
tel:  (613) 998-1410
fax:  (613) 998-9648



