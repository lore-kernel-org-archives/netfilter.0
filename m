From: "Carl Farrington" <carl@compsup.net>
Subject: p-o-m NG will not apply to kern 2.6.2
Date: Tue, 17 Feb 2004 20:16:53 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <739652C2AFA4834AAB5986A215F68CEC016595@svr1.home.compsup.net>
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

I have 2.6.2 kernel sources in /usr/src/linux and iptables-1.2.9 in
/usr/src/iptables, I have built a kernel and now am running "./runme
extra" to apply the ip_conntrack_pptp patch, but it will not apply.

There is no error reported, but when I choose either (t)est or (y)apply
patch, it just moves onto the next patch in the list.

I have been back through and it doesn't show the patch as 'already
applied'.

Is it necessary to apply some of the 'base' patches before the 'extra'
ones can be used?

Cheers,
Carl

