From: "Leandro Takashi Hirano" <takashi@alcidesmaya.com.br>
Subject: Port Scanner
Date: Wed, 5 Nov 2003 12:14:39 -0200 (BRST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <60101.200.180.170.253.1068041679.squirrel@www.alcidesmaya.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="windows-1252"
To: Lista de Mail netfilter <netfilter@lists.netfilter.org>

How does this rule work?

iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit =96limit
1/s -j ACCEPT

Is it safe to use only this rule to avoid port scanners?

Thanks for help!



