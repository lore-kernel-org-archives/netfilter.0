From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: bind 9 and iptables
Date: Fri, 27 Aug 2004 17:19:07 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41834.4621699818$1093641639@news.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Hi
>
> Thanks this seemed to have done the trick.I had to add
> another rule for tcp aswell. Is it possible for these rules
> to slow my browsing abit? Because it seems asif my browsing
> is abit slower now since i used the rules?

quick answer:  no.

long answer:  it has been discussed on this list previously that =
connection tracking DNS queries/responses on or for a busy DNS server (i =
think the number was ~ 200 queries/second) will slow the name resolution =
process down.  the reason being that the state creation adds noticeable, =
unnecessary latency, as most (all?) queries are one packet request--one =
packet response.

somehow i don't think this applies here.

oh--and i'll chime in with the obligatory:  don't run a DNS (or any =
other) server on your firewall.

-j

