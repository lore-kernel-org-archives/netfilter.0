From: Matthias Ziegler <MatthiasZiegler@siemens.com>
Subject: iptables / DSCP
Date: Mon, 17 Mar 2003 16:21:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E75E7FD.4A78EB97@siemens.com>
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

Hi netfilter gurus,

On a SuSE 8.1 system I get an error when trying to set a DiffServ
codepoint (DSCP):

# iptables -t mangle -A OUTPUT -j DSCP --set-dscp 0x30
iptables: No chain/target/match by that name

The same happens when I try to match a DSCP:

# iptables -t mangle -A INPUT -m dscp --dscp 16 -j DROP
iptables: No chain/target/match by that name

(iptables does work e.g. for changing or matching TOS values.)

Does anyone know what this message means?

Thanks in advance,
	Matthias

