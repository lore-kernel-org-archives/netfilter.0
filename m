From: "Nolan, Timothy" <timothy.nolan@verso.com>
Subject: DNAT/SNAT efficiency?
Date: Wed, 1 Sep 2004 10:42:37 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <3A6E2F2950688040B9D3127FFC06345C064F62@ndm01-mxc01.needham.verso.com>
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
To: netfilter@lists.netfilter.org

I'd like to use iptables to map addressA/portB to addressC/portD. I need =
to support up to 8000 address/port pairs (can be coming from any =
address, so I don't think the NETMAP target will suffice). I was =
planning to use the NAT table and add a DNAT=20
target for each address to change the destination address and a SNAT =
target to change the source (total of 16000 rules).

It's my understanding that iptables uses a linear search and that hipac =
doesn't support NAT. Does anyone have any opinions on whether iptables =
will scale to support what I have described?

Thanks,
Tim


