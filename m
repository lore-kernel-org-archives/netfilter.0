From: zynkx <skydive@megamail.pt>
Subject: Re: (no subject)
Date: Wed, 26 Nov 2003 20:38:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069879109.3fc50f45e7331@paris-hme1>
References: <1069853846.3fc4ac966be15@paris-hme1>
 <20031126151015.GB4486@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20031126151015.GB4486@cannon.eng.us.uu.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

hi Ramin and tanx for your trouble ;))

what i am looking for is the adresses from hotmail and=20
yahoo from wich smtp connections may come from :)

i have a smtp running and i need to allow traffic=20
coming from these two, (hotmail and yahoo).

i would need to know from where hotmail and yahoo send=20
their mail, so i could make a ruleset accepting=20
connections from those ips :))

tanx  ;)))



C=F3pia Ramin Dousti <ramin@cannon.eng.us.uu.net>:


> mx1.mail.yahoo.com.     1800    A     =20
> 64.156.215.5
> mx1.mail.yahoo.com.     1800    A     =20
> 64.156.215.6
> mx1.mail.yahoo.com.     1800    A     =20
> 64.157.4.78
> mx1.mail.yahoo.com.     1800    A     =20
> 64.157.4.79
> mx1.mail.yahoo.com.     1800    A     =20
> 64.156.215.7
> mx2.mail.yahoo.com.     1800    A     =20
> 64.156.215.5
> mx2.mail.yahoo.com.     1800    A     =20
> 64.156.215.6
> mx2.mail.yahoo.com.     1800    A     =20
> 64.157.4.78
> mx4.mail.yahoo.com.     1800    A     =20
> 66.218.86.254
> mx4.mail.yahoo.com.     1800    A     =20
> 66.218.86.253
> mx4.mail.yahoo.com.     1800    A     =20
> 216.136.129.5
>
> mx1.hotmail.com.        3600    A     =20
> 64.4.50.99
> mx1.hotmail.com.        3600    A     =20
> 65.54.252.99
> mx1.hotmail.com.        3600    A     =20
> 65.54.166.99
> mx2.hotmail.com.        3600    A     =20
> 65.54.166.230
> mx2.hotmail.com.        3600    A     =20
> 65.54.254.145
> mx2.hotmail.com.        3600    A     =20
> 65.54.252.230
> mx3.hotmail.com.        3600    A     =20
> 65.54.167.5
> mx3.hotmail.com.        3600    A     =20
> 64.4.50.239
> mx3.hotmail.com.        3600    A     =20
> 65.54.253.99
> mx4.hotmail.com.        3600    A     =20
> 65.54.167.230
> mx4.hotmail.com.        3600    A     =20
> 65.54.254.151
> mx4.hotmail.com.        3600    A     =20
> 65.54.253.230
>
>
> I don't know what you're asking but these are
> the mx records
> for yahoo and hotmail. Like the following which
> is the mx for
> megamail.pt
>
> mx.vodafone.pt. 86400   A       212.18.167.163
>
>
> Ramin
>
> On Wed, Nov 26, 2003 at 01:37:26PM +0000, zynkx
> wrote:
>
> > yahoo and hotmail ip ranges? does anyone
> knows this ip
> > ranges? need to allow them in my smtp
> prerouting
> > rulez  :))
> >
> > danke !
>
>=20



unix is user friendly. it's just selective when=20
choosing=20
friends.

-------------------------------------------------
Email Enviado utilizando o servi=E7o MegaMail


