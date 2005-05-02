From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: rules for skype
Date: Mon, 02 May 2005 10:58:46 -0500
Message-ID: <42764E36.7080300@riverviewtech.net>
References: <20050502150901.DAEF39E9F4@dd6816.kasserver.com>
	<42764919.60507@lopsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42764919.60507@lopsch.com>
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

> I can also block https by blocking port 443 that=B4s not the point. The=
=20
> point is to block "bad" 443 port traffic and let "good" traffic pass.

One thing that might be able to be done is to limit on the amount of traf=
fic that can pass through any given HTTPS (443) connection.  Namely if an=
 HTTPS connection is on going and has carried a meg of data or more (any =
thing that would be more than any legitimate HTTPS web submit would be) y=
ou could probably know that the traffic was not standard HTTPS traffic an=
d thus safe to shut down.  This might trap some STunnel (?) (SSL tunnelin=
g) but then you would know the IP of the other end and you could explicit=
ly allow ongoing HTTPS connections to that IP.  This amount of data match=
 could possibly be matched via the "connbyes" match extension from Patch =
- O - Matic Extra Repository.



Grant. . . .



