From: Christoph Gossen <gosen@conterra.de>
Subject: invert problem with multiport
Date: Tue, 18 Jun 2002 17:50:17 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D0F56B9.5952D779@conterra.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hello,

I think there's a bug in the behaviour of the multiport module - for
example, a line like

        iptables -p tcp -A OUTPUT -m multiport ! --dport 25 -j DROP

causes the same behaviour as

        iptables -p tcp -A OUTPUT -m multiport --dport 25 -j DROP

or

        iptables -p tcp -A OUTPUT --dport 25 -j DROP

and NOT (as one would expect) that one caused by

        iptables -p tcp -A OUTPUT ! --dport 25 -j DROP

Inverting the (set of) port(s) due to the "!" sign in the first line
above is just ignored
(no syntax error occures)!

Any comments?

Thanks,

Christoph

