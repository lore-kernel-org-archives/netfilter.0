From: Payal Rathod <payalrathod@gmail.com>
Subject: SNAT
Date: Fri, 9 Jul 2004 09:27:08 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <f51b72bc04070820577fd223df@mail.gmail.com>
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
While reading man page of iptables I stumbled in MASQUERADE section,

| This  target  is only valid in the nat table, in the POSTROUTING chain.
|  It should only be used with dynamically assigned  IP  (dialup)  connec-
|  tions: if you have a static IP address, you should use the SNAT target.

Can someone explain please why this is not valid when I am using a
permanent conneciton terminating at say eth0 and also a small example
on how SNAT can be used in the place?

Thanks a lot in advance.
With warm regards,
Payal

