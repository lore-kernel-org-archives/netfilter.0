From: vpn@raabjerg.net
Subject: what does this rule do??
Date: Wed, 18 Jun 2003 13:43:33 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030618114333.68AFD16114@post1.dk>
Reply-To: vpn@raabjerg.net
Mime-Version: 1.0
Content-Transfer-Encoding: binary
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

I'am working on learning how iptables work.

I've found some rules at http://www.yolinux.com/TUTORIALS/LinuxTutorialIptablesNetworkGateway.html

I understand the most of it but there is one rule I don't quite understand and I can't find any explanation. Can any of you please explain me what this rule does?

IPTABLES -A INPUT -p tcp --tcp-option ! 2 -j REJECT --reject-with
 tcp-reset

Bjarke R.

