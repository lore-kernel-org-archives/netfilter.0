From: Andreas Jellinghaus <aj@dungeon.inka.de>
Subject: iptables and 2.5.* ipsec
Date: 14 May 2003 11:53:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052906039.6883.24.camel@simulacron>
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

Hi,

How does 2.5.* ipsec and netfilter interact?

I guess this way, but I'm not sure:
(encrypted) network card -> routing -> INPUT -> decrypt
(decrypted) ipsec -> routing -> INPUT/FORWARD 

A normal packet is processed this way:
ipsec -> routing -> INPUT/FORWARD 

The first is easy to see: proto 50 or 51 (or udp port 500 for ike).
But how can I see whether an unencrypted packet came in unencrypted
or came in encrypted via ipsec?

with freeswan I could match -i ipsec0, but with kernel 2.5.* there
is no ipsec0 device. What shall I use instead? fwmark?

Thanks for your help.

Regards, Andreas


