From: Alexander Demenshin <aldem-nf@nospam.aldem.net>
Subject: Re: strange log
Date: Sun, 4 May 2003 02:35:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030504023531.A22082@base.aldem.net>
References: <20030502094726.13204.qmail@web9802.mail.yahoo.com> <1052004558.25879.35.camel@elendil.intranet.cartel-securite.net> <20030504014530.A21679@base.aldem.net> <1052007023.25877.40.camel@elendil.intranet.cartel-securite.net>
Reply-To: Alexander Demenshin <aldem-nf@aldem.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1052007023.25877.40.camel@elendil.intranet.cartel-securite.net>; from blancher@cartel-securite.fr on Sun, May 04, 2003 at 02:10:24AM +0200
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, May 04, 2003 at 02:10:24AM +0200, Cedric Blancher wrote:

> DHCP is a very weak system from security point of vue, that can easily
> lead to DoS and traffic redirection.

  When you have few hundreths servers, there is no better way to
  assign/change IPs. And even without DHCP, there are a lot of ways
  for traffic redirection (ARP poisoning and so on).

> A customer server compromise could be a serious threat for other servers...

  When server is not managed, or when attacker is inside of hosting segment
  - perhaps. But when attacker is outside - there is no way to compromise
  the host through DHCP. If it is compromised by other means - DHCP is not the
  cause, so? :)
  
  Even MAC filtering is weak - modern NICs may have any MAC, it is configurable.
  
  No system is secure - unless it is plugged off and burned out. And even then...
  but this is another story :)

Regards,
/Al

