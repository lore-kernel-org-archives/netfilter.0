From: "Phillips, Matthew USA" <mdphilli@nps.navy.mil>
Subject: NAT for IPv6
Date: Wed, 10 Mar 2004 15:58:30 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <63B4989DE77A11468B4562182B203AD10EBAF4@cole.ad.nps.navy.mil>
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

Is it possible to do strictly v6 to v6 NAT'ing, not 6to4 tunneling? I =
know I'm going to get the reponse that we don't need NAT for IPv6 due to =
the increased address space, but NAT also provides the added security =
benifit of network topology hiding. So, my question is, is it possible =
to port over the NAT functionality from iptables to ip6tables and also, =
has it been done already? Thanks for any input.

Matt

