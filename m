From: "Bo Jacobsen" <subs@systemhouse.dk>
Subject: Problem seperating FTP & ms-streaming traffic
Date: Sun, 14 Mar 2004 22:49:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000d01c40a0e$450f0a50$de0aa8c0@comp>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have a problem allowing forwarding of passive internal ftp traffic =
and, at the
same time disallowing ms-streaming (port 1755).

Whenever I allow the passive ftp, it also allows ms-streaming going =
through.

My rules are:

iptables -A FORWARD -m state --state NEW,ESTABLISHED -s local_lan =
--sport highports --dport ftp -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -s local_lan =
--sport highports --dport highports -j ACCEPT

ms-streaming is a highport (1024:) but as there are no NEW in the second =
rule, it should
not apply to new ms-streaming connections.


Any idears=20

Bo Jacobsen



