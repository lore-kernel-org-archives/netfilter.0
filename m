From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: From where the browser takes the  "Address"
Date: Mon, 7 Jul 2003 09:30:04 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DEB@alderaan.smgtec.com>
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
To: Blesson Paul <blessonpaul@softhome.net>
Cc: netfilter@lists.netfilter.org

The browser address is the last page connected to a web site.

There are a few times that this gets weird.

CGI posts don't change the address screen, so if I have a URL
http://www.fooseballsinc.com and my / page relates to a CGI scripts, I
might be navigating too many pages, but since it is through the CGI, I
don't see that on the browser page.

A lot few DNS Providers host HTTP forwarder services like described
above, so if the site was hosted off them, it would always look like the
site was http://babalala/ even if it was a different page inside.

-----Original Message-----
From: Mogens Valentin [mailto:monz@danbbs.dk]=20
Sent: Monday, July 07, 2003 3:42 AM
To: Blesson Paul
Cc: netfilter@lists.netfilter.org
Subject: Re: From where the browser takes the "Address"

Blesson Paul wrote:
>=20
> Hi all
>                          I think this question is encountered by all
> irrespective of the platform they are working. In both IE and
Netscape,
> there is a  location showing the "Address" of the page. My question is
from
> where, browser will takes the  "Address" ?.
>=20
> Is the HTTP Respose from the Web Server contains the Address and will
the
> browser takes it from there.
> Is the browser itself will do the work. I mean, will the browser
simply
> put the "URL" clicked by the user in the Address Box.


