From: Mattia Martinello <mattia@mattiamartinello.com>
Subject: Multiple -d flags
Date: Sat, 11 Jan 2003 21:58:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E20855F.9040006@mattiamartinello.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi

I wish to create a rule that allow a packet to a specified IP on a 
specified port.

The rule:

iptables -A FORWARD -s 0.0.0.0/0 -d 213.21.136.8/255.255.255.255 -dport 
80 -j ACCEPT

shows me the following error:

iptables v1.2.5: multiple -d flags not allowed
Try `iptables -h' or 'iptables --help' for more information.

How I can solve my problem?

Thank you very much
Bye
Mattia


