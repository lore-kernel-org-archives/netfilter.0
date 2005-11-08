From: Paul Goodyear <pgudge@gmail.com>
Subject: iptables on DLink DSL-502T Modem/Router
Date: Tue, 8 Nov 2005 01:47:00 +0000
Message-ID: <cc8f3f150511071747m64e3841ava98596bfe776fcf3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

Does iptables version v1.2.6a support forwarding from a source IP?

The reason I ask, is I have a DLink DSL-502T modem router, the router
has linux on and running iptables.

The webadmin for the router does not allow you to create ip filters,
port forwarding is there but not filtering.

I want to allow access to port 3389 from only 1 internet IP address.
Should this work? (81.81.81.81 being an example)

iptables -A INPUT -s 81.81.81.81 -d 192.168.1.2 -p tcp --dport 3389 -j ACCE=
PT

The router does no allow me to connect in once this rule is in iptables.

Thanks.

Paul.

