From: "Michael K" <micke@klintan.se>
Subject: Rejecting udp
Date: Mon, 3 Mar 2003 18:28:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c2e1aa$3fc8f660$0200a8c0@klintan.local>
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

I saw this rule someware on the net.
$IPTABLES -A FORWARD -o $EXTERNALIF -p udp --dport 137 -j REJECT

Whats the use to use reject on a UDP packet? Isn't udp connection-less
A more correct shouldn't that be "-j DROP"? Or am I thinking wrong here?

Regards Klintan



