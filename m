From: Felipe <fflores@millicom.com.pe>
Subject: SNAT question
Date: Mon, 01 Mar 2004 18:56:41 -0500 (PET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078185401.4043cdb979aab@milliweb.millicom.com.pe>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

It's necessary to set up phisically the public address used in SNAT rule ?
For this rule:

iptables -t nat -A POSTROUTING -s 172.21.0.0/16 -j SNAT --to 200.110.2.181

For that rule, its necessay set up phisically the IP 200.110.2.181 over the interface ?

Thanks for your response


Felipe

