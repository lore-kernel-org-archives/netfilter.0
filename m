From: "zze-Proxy GRALL O ext FTRD/SVA/LAN" <ograll.ext@rd.francetelecom.com>
Subject: RE : Apply rules to 1 UDP port but port used as a socket: possible?
Date: Wed, 11 Feb 2004 11:42:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D4EF10CCEB2CE742BEEA9838C590B0E80113FD3D@ftrdmel2.rd.francetelecom.fr>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Alex Satrapa <alex@lintelsys.com.au>
Cc: netfilter@lists.netfilter.org

My "monitor" is trying to do this (receiving on the socket and then =
trying apply rules...)

But rules are not applied and packets are all received by the socket.

How to force rules to be applied for the special source address?

Thanks.=20

-----Message d'origine-----
De : Alex Satrapa [mailto:alex@lintelsys.com.au]=20
Envoy=E9 : mercredi 11 f=E9vrier 2004 04:00
=C0 : zze-Proxy GRALL O ext FTRD/SVA/LAN
Cc : netfilter@lists.netfilter.org
Objet : Re: Apply rules to 1 UDP port but port used as a socket: =
possible?


zze-Proxy GRALL O ext FTRD/SVA/LAN wrote:
> I'm trying to use a socket (on port 1727) to decode some proprietary=20
> UDP
> packets. When I've decoded them I want to apply a DNAT rule (and then =
a=20
> SNAT  too) to this port using a filter on @IP:port source for all=20
> following packets...

So do you have Machine F which is the firewall, and machines A, B and C =
which are the ultimate destinations, and you want to have UDP packets =
from machine X (elsewhere) being sent to A, B or C  by F based on some =
information in the first packet F receives from a new host X? You could =
write your "monitor" to set up new rules based on the first packets that =
arrive, with the remainder being "deflected" by the firewall rules.



