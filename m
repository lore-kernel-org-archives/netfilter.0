From: Andreas Kretschmer <andreas_kretschmer@despammed.com>
Subject: Re: [despammed] Blocking ip
Date: Fri, 2 Jan 2004 14:15:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040102131555.GB5845@kaufbach.delug.de>
References: <20031225131942.D3FF41800099@mwinf0801.wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031225131942.D3FF41800099@mwinf0801.wanadoo.fr>
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
To: netfilter@lists.netfilter.org

am  Thu, dem 25.12.2003, um 14:13:53 +0100 mailte - folgendes:
> I would like to block a specific IP adress from the internet using an=20
> iptables rule (for all ports) - How does it looks like ? (iptables v 1.2.=
6)

Please read the f* man-page!
iptables -A INPUT -p TCP -s 111.111.111.111 -j REJECT

This blocks all incoming traffic from 111.111.111.111 with
icmp-port-unreachable.

Andreas
--=20
Diese Message wurde erstellt mit freundlicher Unterst=FCtzung eines freilau-
fenden Pinguins aus artgerechter Freilandhaltung.   Er ist garantiert frei
von Micro$oft'schen Viren. (#97922 http://counter.li.org)     GPG 7F4584DA
Was, Sie wissen nicht, wo Kaufbach ist? Hier: N 51.05082=B0, E 13.56889=B0 =
;-)

