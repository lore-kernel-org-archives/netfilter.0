From: "gene bene" <phacoboy@hotpop.com>
Subject: port translation on the same network
Date: Sun, 18 Jul 2004 19:34:28 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001701c46caa$6d99c290$d802d98a@smaug>
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

I have a print job in my network which comes in on port 10001 raw packets
(from a citrix server)

I need to use iptables to translate the port number to 9100

I have tried to set up a virtual ip (eth0:0) and use DNAT and SNAT to
translate the port with no success.

Can anyone help me with the correct settings?

Gene



