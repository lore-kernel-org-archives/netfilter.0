From: Jeffrin <jeffrin@gamebox.net>
Subject: iptables related
Date: Tue, 9 Dec 2003 00:49:47 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031208191947.GA1603@msservices>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hello all,

iptables -A INPUT -sport 80 -j ACCEPT

shows error ...

 msservices:~# iptables -A INPUT --sport 80 -j ACCEPT
iptables v1.2.9: Unknown arg `--sport'
Try `iptables -h' or 'iptables --help' for more information.

please help me ...


