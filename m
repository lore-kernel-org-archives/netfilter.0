From: "Yannick Koehler" <yannick.koehler@colubris.com>
Subject: connection missing from ip_conntrack when redirected
Date: Fri, 20 Aug 2004 08:18:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <36DE81D1ABB46D44B54245FFB5F5F16001A27B83@exchange.colubris.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

  I wrote an HTTP proxy.  I used the iptables REDIRECT functionality to
get all my connection hi-jacked by the proxy.  I then also use iptables
for accounting and for this; I need to know the original destination
port of the connection.  That was easily done with kernel2.2 ipchains
using getpeername() function.

  Now inside the kernel2.4 I parse the /proc/net/ip_conntrack file.  But
what I have found is that sometimes, quite often actually, the entry for
the existing connection that the proxy is dealing with, there's no entry
inside the ip_conntrack file.

  Because I did receive HTTP data over that connection, I would have
assumed to have an entry with [ASSURED] and use=3D1 inside the
ip_conntrack but that is not the case.  I did a print of the whole file
when my code doesn't find an entry in order to have parse the file
myself and see if the code was or not problem but the entry was not
there either.

  As anyone have seen such behavior while using REDIRECT and attempting
to retrieve the original destination port?

  My test setup is running over kernel 2.4.26

--
Yannick Koehler


