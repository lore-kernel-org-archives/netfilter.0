From: "Carl Farrington" <carl@compsup.net>
Subject: PPTP/GRE conntrack for kernel 2.6
Date: Mon, 16 Feb 2004 11:03:18 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <739652C2AFA4834AAB5986A215F68CEC016591@svr1.home.compsup.net>
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

Is there a pptp / proto_gre nat/conntrack patch for kernel 2.6.2?

I seem to remember finding that p-o-m didn't work for 2.6.

Reason I ask is that the PoPToP guys have now got an MPPE module for
2.6.2, so there's really nothing holding us PPTP freaks back other than
Netfilters poor natting of outbound PPTP stuff.

Cheers,
Carl

