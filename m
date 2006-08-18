From: matteo@cisilino.com
Subject: Re: block multimedia protocols
Date: Fri, 18 Aug 2006 15:44:20 +0200
Message-ID: <200608181544.21012.matteo@cisilino.com>
References: <018401c6c2c4$70759350$0419a8c0@fly>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <018401c6c2c4$70759350$0419a8c0@fly>
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
Content-Type: text/plain; charset="iso-8859-9"
To: netfilter@lists.netfilter.org

Alle 14:47, venerd=EC 18 agosto 2006, Pablo Sanchez ha scritto:
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org
> > [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of
> > matteo@cisilino.com
> > Sent: Friday, August 18, 2006 8:01 AM
> > To: netfilter@lists.netfilter.org
> > Subject: block multimedia protocols
> >
> > Hi all , I'd like to know if there's a way to block certain
> > multimedia casting
> > protocols , Is it possible?
>
> One thought is to use L7 (http://l7-filter.sourceforge.net/) to classify =
by
> protocol and DROP accordingly.  I don't believe there will be a single
> solution which will cover your needs so you'll have to cobble a solution
> together; not terribly difficult I would think.  Try to shoot to block 95%
> of the castings.  :)
>
> -pablo

