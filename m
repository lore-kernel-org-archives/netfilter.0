From: serguey.forcade@emelytours.com.do
Subject: Incomming packets
Date: Mon, 10 Mar 2003 22:21:51 -0400 (AST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030311022151.022CCBFD2@webserver.emelytours.com.do>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="bound1047349311"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

--bound1047349311
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello:

    I'm trying to set a rule in my iptables configuration to accept incomming connections from an specific host, (ie. iptables -A input -i eth0 -p tcp --dport 21 -s test.host -j ACCEPT ) and I keep getting the error:

iptables v1.2.6a: host/network `test.host' not found
Try `iptables -h' or 'iptables --help' for more information.

Does anyone know about it?

Thanks

--bound1047349311--


