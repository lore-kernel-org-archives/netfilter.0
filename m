From: Payal Rathod <payalrathod@gmail.com>
Subject: MASQUERADE
Date: Fri, 9 Jul 2004 09:19:58 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <f51b72bc040708204912ab0cc7@mail.gmail.com>
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
Is there any different way to do MASQUERADE in kernel 2.6.3-7  with
iptables v1.2.9?
I get,

# iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables: Invalid argument

A quick look at the man page did not suggest anything.
Any ideas to what is missing?

With warm regards,
-Payal

