From: Martin Zdila <Zdila@Antik.SK>
Subject: /proc/net/ip_conntrack
Date: 20 Mar 2003 08:38:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048167520.2118.16.camel@martin>
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

Hello

We have local network with about 2000 users and all of them are going to
the Internet through main gateway using masquerade. The problem is IRC
and oident. It uses file /proc/net/ip_conntrack for searching the IP
address using known source and destination port numbers. But the oident
takes for it all CPU time, because file /proc/net/ip_conntrack grows and
changes very quickly. When I type cat /proc/net/ip_conntrack, the screen
scrolls with huge amount of conntrack lines forever.
Is there a another way how to find IP address belonged to known port
number? For example using kernel functions like ip_conntrack_get or
something similar?

Please HELP!
Thanks a lot!

Martin Zdila
zdila@antik.sk



