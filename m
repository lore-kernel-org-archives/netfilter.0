From: "Michael H. Warfield" <mhw@wittsend.com>
Subject: Re: some body hacked my system
Date: Wed, 9 Oct 2002 14:26:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021009182605.GA2974@alcove.wittsend.com>
References: <Pine.LNX.4.40.0210081711380.14946-100000@klepto.security.algx.lan> <002f01c26f15$16c571b0$8c01a8c0@sundaram>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <002f01c26f15$16c571b0$8c01a8c0@sundaram>
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
Content-Transfer-Encoding: 7bit
To: Sundaram Ramasamy <sun@percipia.com>
Cc: netfilter@lists.netfilter.org

On Tue, Oct 08, 2002 at 05:53:04PM -0400, Sundaram Ramasamy wrote:
> Thanks for all your mails, other than filling my hard disk he didn't do
> anything. I am running Redhat 7.1 wu-ftpd, in my firewall I opened only
> http, smtp, pop3, ftp and cvspserver ports.

	Hmmm...  Really...  RedHat 7.1 huh...

	What was that IP address again.  /;->=>

	Have you kept that very VERY up to date?  7.1 was one of those spins
with security problems from hell.

	Just the i386 binary rpm updates for 7.1 are almost 380 Meg worth.
The entire update directory for 7.1 (including sources and other platforms)
is over a Gig and a half.

	ftp	- Yup...  There's an update rpm in there for that.
	smtp	- Uh huh...  Sendmail too.
	http	- You betcha...  Apache problems fixed in there too.
	pop3	- That's in the imap package and that's got an update.

	You're at least 4 for 5 in the security hole department unless
you've updated those four to the latest rpms.  On top of those, since
you are running http, you can add problems in php and possibly others
than apache can access.  You didn't mention https, but that's got openssl
problems that could get you "slapped" (slapper Apache OpenSSL worm running
loose right now).

	Your earlier message didn't indicate a breakin.  But this one
indicates a potential for future breakins.  If you are not going to
upgrade that to a more recent distro, you are going to need to be
doubly sure to keep it up to date.  Running up2date and joining
RedHat networks (rhn) would probably be a good idea if you haven't
already.  :-)

> Thanks
> Sundaram


> ----- Original Message -----
> From: "Kevin Dwyer" <Kevin.Dwyer@algx.net>
> To: "Sundaram Ramasamy" <sun@percipia.com>
> Cc: <netfilter@lists.netfilter.org>
> Sent: Tuesday, October 08, 2002 5:12 PM
> Subject: Re: some body hacked my system
> 
> 
> > On Tue, 8 Oct 2002, Maciej Soltysiak transmitted the following:
> >
> > > And download, compile and run: chkrootkit. Which looks for rootkits and
> > > trojans in you binaries.
> >
> > And check the checksums of your binaries with the ones you saved off on
> > disk when you finished building the machine.  ;)
> >
> >
> > /* Kevin Dwyer                                Allegiance Internet */
> > /* network security engineer                   Commerce Center II */
> > /* email: Kevin.Dwyer@algx.net                7601 Ora Glen Drive */
> > /* phone: 240-616-2075                        Greenbelt, MD 20770 */
> > /*      >++++++++++[<++++++++++>-]<.+++++.----.[-]++++++++++.     */
> >
> >
> >
> 

-- 
 Michael H. Warfield    |  (770) 985-6132   |  mhw@WittsEnd.com
  /\/\|=mhw=|\/\/       |  (678) 463-0932   |  http://www.wittsend.com/mhw/
  NIC whois:  MHW9      |  An optimist believes we live in the best of all
 PGP Key: 0xDF1DD471    |  possible worlds.  A pessimist is sure of it!

