From: "Minh Cao" <caom@statsus.com>
Subject: Help: Iptables rules
Date: Wed, 14 Jan 2004 17:04:03 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF22A0643A.09EB3DB8-ON88256E1C.00058296-88256E1C.0005DD77@statsus.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I am new to iptables.
Please help me to create a rules, which allows everything in and out both
interfaces.

What I have but not worked:
iptables -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
iptables -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT

iptalbles -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE


Thanks
Minh



