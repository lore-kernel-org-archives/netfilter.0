From: "Rakotomandimby (R12y) Mihamina"
	<mihamina.rakotomandimby@etu.univ-orleans.fr>
Subject: just a remind
Date: Fri, 13 May 2005 13:53:35 +0200
Message-ID: <1115985215.4563.37.camel@ngeza>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello.

I have a rule set and I want to disable the acces of my server to some
ips (they are "request flooding" me, and it's just a temporary
rejection, just to give me the time to set up the scaling of the server)

- I have the policy rules at the beginning (they DROP all by default)
- then I have the allowing rules for the port 80 TCP (web server)
- then allow ssh for all (dynamic IP at the admin's home)
- then follows the rectrivtion, I rejects the IPs I want to reject on
all ports.

Is that the right steps? or should I reject them _before_ allowing 80
TCP for all?

It's iptables 1.2.10 and 1.2.11
Thank you for all.


--=20
ASPO Infog=E9rance       http://aspo.rktmb.org/activites/infogerance
Unofficial FAQ fcolc   http://faq.fcolc.eu.org/
LUG sur Orl=E9ans et alentours (France).
T=E9l : 02 34 08 26 04 / 06 33 26 13 14


