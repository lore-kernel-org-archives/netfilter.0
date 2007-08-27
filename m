From: "quesera2" <quesera2@earthlink.net>
Subject: Implement single firewall login for access to all ports on LAN?
Date: Mon, 27 Aug 2007 09:43:12 -0400
Message-ID: <00db01c7e8b0$3750f890$1ad8d346@rtt42p>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

The normal apologies for the noobie-type question...

We have IPCop nicely segregating our orange (DMZ) and green (blocked) LANs.
As time has gone on, I've realized that I'd like many more of our services
to be on the orange or red networks so they can be easily reached by
customers/consultants who may not have fixed IPs. Many of our users are not
SSH savvy and might not want us installing a tunneling client on their
systems.

Most of these services that I want to expose have some form of
authentication but some of that is not terribly robust (mediawiki, mysql,
bugzilla). Some are targets for DoS (SQL Server) or other attacks. 

My thoughts are to have a strong challenge/response login from a client to
the firewall. This could be done via https to a non-standard port on the
firewall. If this login succeeded, all (or configurable) ports would be
available from the client to services inside the firewall as long as the
'session' was active. The session would be based on the client's IP and
would have an inactivity time-out. The original https login would not need
to stay active.

Valid user logins could be either via statically configured tables on the
firewall or via LDAP, etc.

I think I remember a scheme like this when I was using the Wingate proxy
server. Is this available using iptables?



