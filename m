From: =?iso-8859-1?Q?HSS_-_Laborat=F3rio_de_Inform=E1tica?= <labinf@hss.com.br>
Subject: ip_conntrack messages
Date: Thu, 2 Dec 2004 17:17:25 -0200
Message-ID: <003901c4d8a3$8fad88c0$2201a8c0@hss.com.br>
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

Hi.

At the first time the netfilter modules are loaded this message is =
displayed: ASSERT ip_conntrack_core.c:630 &ip_conntrack_lock not =
readlocked

I=B4m using debian woody with compiled kernel 2.4.28 ( or 2.4.27 ) and =
iptables 1.2.11compiled from the source (occur with 1.2.6a originally =
packed with debian).

The rules works ok, I=B4m only need to eliminate this message, so the =
system start clean of errors.

Thanks,

Marcos
