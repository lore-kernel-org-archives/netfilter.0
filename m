From: Mogens Valentin <monz@danbbs.dk>
Subject: Microsoft clients logon
Date: Thu, 17 Jul 2003 10:08:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F165979.B35B4411@danbbs.dk>
Reply-To: monz@danbbs.dk
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
To: Netfilter <netfilter@lists.netfilter.org>

After rewriting an ipchains firewall to iptables, I've got problems
having M$ clients logon to an w2k server; that is,  I do not administer
that server, so it actually might not be my firewalling.

The w2k server is on a dedicated internal serversegment, clients are on
three other segments. Problem clients are winxp.
It takes a looong tme to logon (I'm told upto nearly half an hour),
other traffic no problem; it' only the login procedure.

So far, I forward M$ related tcp/udp ports 137:139, 445, 135, ldap,
kerberos in both directions between server and client segments.
Tcpdump shows traffic on these ports in both directions, leading me to
believe it should work.

Port 135 is "DCE endpoint resolution", which is an rpc service, and
AFAIK very basic for M$ networking.
Googling for DCE endpoint resolution reveals that others have  had
problems here. What I found didn't really tell if those writing about it
really understood what's going on, neither what kind of firewall were
used.

-- 
Kind regards / venlig hilsen,
Mogens Valentin, Mr Dev

IT Networking, Security, Server Setup
www.danbbs.dk/~monz   mrdev@danbbs.dk

