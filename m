From: "Wennie V. Lagmay" <wlagmay@yanbulink.net>
Subject: Re: msn and yahoo messenger voice chat
Date: Thu, 14 Apr 2005 08:11:08 +0300
Message-ID: <007e01c540b0$5e0a6b10$dc0aa8c0@winntpro>
References: <1113309566.425bc17e6a46f@webmail.yanbulink.net><20050412123940.GA26073@bender.817west.com>
	<001101c53f6f$a198e9c0$dc0aa8c0@winntpro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Hi Jason,

iptables A POSTROUTING -s 192.169.10.0/24  -j SAME --to
xxx.xxx.85.113-xxx.xxx.85.115
iptables A POSTROUTING -s 192.169.10.0/24  -j SAME --nodst --to
xxx.xxx.85.113-xxx.xxx.85.115

the above rules are intermitent., the rule below is working fine.
iptables A POSTROUTING -s 192.169.10.0/24  -j SAME --to xxx.xxx.85.113

Im using iptables version 1.2.9, I'm just wondering if the above intermitent
rules will work fine on lattest iptables verion. Do you know the lattest and
most stable iptables version?

Thank you very much,

Wennie



