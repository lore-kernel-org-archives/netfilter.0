From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Using IPTABLES, cannot go to External Interface
Date: Wed, 18 Jun 2003 09:11:04 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6ED3@wardrive.citadelcomputer.com.au>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

> there won't be anyone to answer ARP requests on them
oh ok, well we have (unfortunately) a router in front of our firewall =
which I've added host routes to go via the firewall for those =
destinations. Just made it easier for me and I didn't have to worry =
about multiple IPs on the firewall as they are routed to it. Probably =
not a clean way but better than adding 32+ IPs to a firewall... not sure =
what the Linux limit was so this was the safest way for me.

Just for your information.

-----Original Message-----
From: Cedric Blancher [mailto:blancher@cartel-securite.fr]
Sent: Monday, June 16, 2003 11:41 PM
To: George Vieira
Cc: Netfilter (E-mail)
Subject: RE: Using IPTABLES, cannot go to External Interface


