From: Jason Opperisano <opie@817west.com>
Subject: Re: pptp-conntrack-nat
Date: Tue, 14 Sep 2004 13:31:53 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095183113.1895.14.camel@wolfpack.ljm.dom>
References: <20040914161050.8788.qmail@web52403.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040914161050.8788.qmail@web52403.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset=; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Tue, 2004-09-14 at 12:10, lucas baresi wrote:
> Hi people.
>=20
> I have a dumb question, If my pptpd server and my
> firewall netfilter are in the same box, I need the
> module pptp-conntrack-nat?, no! it=C2=B4s rigth?

no--you do not need the pptp-conntrack-nat patch.

allow TCP port 1723 and IP protocol 47 (GRE) inbound and you'll be good
to go.

-j

--=20
Jason Opperisano <opie@817west.com>


