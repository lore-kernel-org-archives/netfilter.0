From: "Wayne N. Phillips" <waynep@airloom.com>
Subject: Using netfilter as a reverse proxy
Date: Fri, 7 May 2004 11:26:41 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <603E36FCA8EFFB4A94F0F47C7479C96E1AA41B@exchange.airloom.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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


Is Netfilter a suitable solution to use as a reverse proxy? I want to =
employ a bouncer for an IIS server that I have... I've chosen Linux for =
the job. I can easily turn the Linux server into a router, and route the =
traffic to the server, but this doesn't sound secure. I can do some DNAT =
translation to redirect specific port traffic, but that doesn't sound =
much better. I'm just redirecting dangerous traffic to the box I'm =
protecting. I could just build the box, sit back and think I've done a =
great job. Maybe nobody will attack my box, but that doesn't mean it's =
secure? I would like somebody to point out the security benefits I could =
employ to truly protect my lowly IIS server.
I would like to redirect 80, 443 and couple of other ports.
I known it's quite broad but you don't have to be specific, but if you =
feel in a good mood you could always post the rc.firewall-2.4 file for =
me.  =3D!)


Wayne

"If it wasn't for us newbie's, you wouldn't have that self confident air =
of superiority, stupid guys rule"

