From: =?iso-8859-1?Q?Omar_Casta=F1eda_Acosta?= <omar@idea.com.mx>
Subject: H323 Rule list
Date: Fri, 8 Nov 2002 13:53:08 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3450D7F41847FE489C49F2568F0DE27601F2FE@neptuno.idea.com.mx>
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

Hello list:

What would be the best list of rules for H323?
My current setup includes iptables 1.2.7a + path-o-matic on kernel =
2.4.19. It works nicely on all rules (NAT, DMZ zone, redirect, etc). I =
have a Switch that gateways VoIP to regular lines. All I need is the =
ability to redirect (SNAT/DNAT) my calls to my external firewall =
interface to this host and the ability to call h323 host on the internet =
from the internal network.

I appreciate in advance all the help I could get.

Omar


