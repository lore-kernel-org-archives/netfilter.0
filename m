From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: connection tracking without iptables?
Date: Wed, 29 Sep 2004 14:22:41 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679531@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Jiann-Ming Su <sujiannming@gmail.com>, netfilter@lists.netfilter.org

Jiann-Ming Su wrote:
> This is probably a dumb question, but is it possible to track
> connections without iptables/netfilter?

Yeah, use libpcap and parse it out yourself! (snicker)

Exactly what are you looking for and why? A good chunk of netfilter is
*just* connection tracking. What do you expect to get out of just
conntrack?


