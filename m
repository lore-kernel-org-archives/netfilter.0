From: "George J. Jahchan" <NetFilter@Tech.InteractiveNetworks.net>
Subject: http tunneling apps.
Date: Wed, 11 Sep 2002 16:46:56 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00d301c25999$c2662e60$0a0fa8c0@diabelec.com>
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
To: NetFilter List <NetFilter@Lists.NetFilter.org>

Is there a way to somehow mark non-browsing traffic encapsulated in http
packets? (ie. packets encapsulated by socks2http or httptunnel, there may
be others). Encapsulating (otherwise blocked by the firewall) applications
in http and sending/receiving them as http traffic allows users to
circumvent
firewall policies intended to stop these applications.

Any suggestions on how to handle these in NetFilter (if at all possible)?



