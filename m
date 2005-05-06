From: Dimitri Yioulos <dyioulos@firstbhph.com>
Subject: Re: FTP access from outside
Date: Fri, 6 May 2005 07:47:44 -0400
Message-ID: <200505060747.44334.dyioulos@firstbhph.com>
References: <200505051437.j45EbauW006066@eden.inf.ed.ac.uk>
	<d5e96bf205050604367aef4e3a@mail.gmail.com>
	<d5e96bf205050604378818c3d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d5e96bf205050604378818c3d@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Friday May 6 2005 7:37 am, Vinay Amarnath wrote:
> >  I have added these modules to load during booting process by adding
> > the following lines to /etc/ec.local
>
> Sorry for the mistake. Its /etc/rc.local
>
> Thanks
> Vinay.K.A ,  RHCE
>
> System Administrator
> Intila Systems, Bangalore

Thank you all so much for your help. =A0Based on everyone's input, I've got=
 ftp=20
working from the outside ... sorta. =A0Yesterday, I tried accessing the ftp=
=20
server using another company in our building's system, and it worked=20
beautifully. =A0However, a user in the Phillipines who I'm trying to give=20
access to says he can't connect. =A0I've tried his uname and password and t=
hey=20
work fine. =A0Might it be a source port issue? =A0I realize this isn't an=20
ftp-related list, but may I ask, can he specify a source port on his end to=
=20
ftp into my site, rather than me having to tinker with anything on my end?

Once again, thanks.

Dimitri

