From: cmbb@dslr.net
Subject: iplimit module refuses to work
Date: Mon, 11 Aug 2003 13:26:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <63349768828.20030811132640@dslr.net>
Reply-To: justin <justin@dslr.net>
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


I can't get the iplimit module to work for me,
this is an SMP AMD machine.

# iptables -A TcpLimit -m iplimit --iplimit-above 125 -j OverX

iptables: Invalid argument

strace -f ...


