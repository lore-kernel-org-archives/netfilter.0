From: "gustav gundacker" <gg0815@gmx.net>
Subject: Re: SMTP Routing Based On Recipient
Date: Tue, 23 Dec 2003 22:57:18 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <30807.1072216638@www24.gmx.net>
References: <1072121282.10935.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: aellis@saberlogic.com
Cc: netfilter@lists.netfilter.org

a solution is smtpd/smtpfwdd from juniper see
http://www.obtuse.com/smtpd.html

gunnar

> I am running a MS Exchange 5.5 server and am getting hit with the NDR
> (non-delivery report) Reverse Spam Attack as described here:
> =20
> http://www.tek-tips.com/gviewthread.cfm/lev2/3/lev3/15/pid/10/qid/725829
>=20
> As the thread describes, there is no way to just turn off NDRs in
> Exchange 5.5 - Microsoft is recommending third party utilities.  What I
> am wondering is this - would it be possible to redirect SMTP to my Linux
> server, use iptables to check that the recipient matches a valid user
> >from a list I'd supply, and, if so, route the message to the Exchange
> server?  And, if no valid recipient is found, the message is simply
> dropped.  Is this even a logical way to handle this situation?  Should I
> be looking at something like snort instead?  I'm all ears!
>=20
> Thanks,
> --=20
> Adam Ellis <aellis@saberlogic.com>
> SaberLogic
>=20

--=20
+++ GMX - die erste Adresse f=FCr Mail, Message, More +++
Neu: Preissenkung f=FCr MMS und FreeMMS! http://www.gmx.net



