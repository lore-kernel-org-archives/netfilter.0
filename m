From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: port redirect for localy generated request
Date: Fri, 29 Aug 2003 09:55:46 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c36e35$3f7cee60$8c01a8c0@RSUNDARAM>
References: <MCEJJKCAIMHFOKODABEIGEDCHNAA.cox@sinistro.net>
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


Hi,

With this rule incoming request for port 80 redirected to port 8080. But
this is not working localy generated request.

iptables -t nat -A PREROUTING -p tcp --dport 80 -d LISTEN_IP -j DNAT --to
LISTEN_IP:80

How will i redirected local request port 80 to port 8080 ?

Thanks


