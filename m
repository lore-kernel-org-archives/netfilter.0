From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: prevent script kiddies to abuse my ppp connection
Date: Fri, 11 Oct 2002 10:57:11 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000b01c2714f$a00607a0$6601a8c0@s3ac>
References: <200210111717.g9BHH1L19776@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200210111717.g9BHH1L19776@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

,
> >
> > I left my computer for an hour and I was
> > surprised to see that the connection was still on! I=20
> thought that one=20
> > of my proces was using the connection so i did a quick dump=20
> of ppp0. I=20
> > was surprise to see that some script kiddy was looking at=20
> my netbios=20
> > port!
> >
> > Now I have been thinking of ways to prevent these silliness from=20
> > shutting down my conneciton within 3mn. If I firewall these=20
> incoming=20
> > packets I believe that it won't help me. The blocked packet=20
> will still=20
> > traverse the ppp link. So it will still be seen as=20
> "activity" to the=20
> > ppp daemon. Correct me if I am mistaken.
>=20

I'm no expert but the way I would go about this is to log established
outgoing connections, then have a perl script analyze this log if the
last entry is less than x minutes old and there is no existing
connection then kill your ppp deamon. Now those script kiddies are
probable nimda worms which seem to be everywhere. It shouldn=92t' be =
hard
you may even be able to do a cat /var/log/firewall | last | grep =
IN=3Deth0
.... Get my drift ..


