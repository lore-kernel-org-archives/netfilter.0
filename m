From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: NAT, MANGLE, and TOS
Date: Thu, 23 Oct 2003 11:30:09 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E3766@alderaan.smgtec.com>
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
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>, nf <netfilter@lists.netfilter.org>


> $iptables -t mangle -A OUTPUT -p tcp -m state --state=20
> NEW,RELATED,ESTABLISHED -m tcp --sport 80 -j TOS --set-tos 0x08

You probably want this on the FORWARD chain to boost the performance of
your actual client machines instead of just the firewall.

