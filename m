From: "Leszek Zur" <lzur@record.com.pl>
Subject: POSTROUTING & DNAT
Date: Thu, 22 May 2003 15:01:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000501c32062$42b751e0$6901a8c0@tailor>
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

Hello

iptables -t nat -A OUTPUT -d 1.1.1.1 -j DNAT --to-destination 2.2.2.2
iptables: Invalid argument

Can anyone help me understand what is happening?

iptables v1.2.8
kernel 2.4.20

thnx

Leszek



