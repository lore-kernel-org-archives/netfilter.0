From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: REJECT target not as policy
Date: Mon, 20 Aug 2007 17:52:02 +0200
Message-ID: <46C9B8A2.5040201@plouf.fr.eu.org>
References: <20070820135206.GA18644@bart.bertram-scharpf.homelinux.com>
	<200708201608.39032.r.laban@ism.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200708201608.39032.r.laban@ism.nl>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Ruben Laban a =E9crit :
> On Monday 20 August 2007, Bertram Scharpf wrote:
>=20
>>on one of my machines the REJECT target doesn't behave as I
>>expect. It is inserted into a chain but it is not accepted
>>as a policy.

It behaves as expected. REJECT is an extension, not a built-in target,=20
and cannot be used as a policy. Check man iptables.

> The REJECT target is only valid when either the tcp or udp module is lo=
aded.=20

AFAIK, REJECT is not dependant on tcp or udp and can be used with any=20
protocol. Only the "--reject-with tcp-reset" option can be used only=20
with tcp.

