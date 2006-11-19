From: PINTU <pintu9@gmail.com>
Subject: Re: ipset: how to run non-root
Date: Sun, 19 Nov 2006 12:31:54 +0530
Message-ID: <fce4a540611182301i74440a65waf4d41e838c74e8@mail.gmail.com>
References: <455F8DE9.8060105@mailinator.com>
	<20061119001541.GA13056@outback.rfc2324.org>
	<455FB202.1060702@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <455FB202.1060702@mailinator.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Wright <xktnniuymlla@mailinator.com>
Cc: netfilter@lists.netfilter.org

You can also try sudo

On 11/19/06, Mike Wright <xktnniuymlla@mailinator.com> wrote:
> Maximilian Wilhelm wrote:
> > Am Samstag, den 18 November hub Mike Wright folgendes in die Tasten:
> >>
> >>I'm trying to use ipset from a php script on an apache server.
> >
> >>Does anybody know how I might accomplish this?
> >
> >
> > I never used ipset, but you could use a generic trick:
> >  Set the owner of the ipset binary back to root and set the suid bit
> >  which will result in the ability for everyone who can execute the
> >  binary to do this "as root".
> >
> Excellent!  Worked out of the box with no problems.
>
> > You might want to think about an execution restriction (e.g. via the group)
> > to prevent people who should no fiddle with ipset from doing so.
> >
> Done!  As a paranoid I really like that advice.
>
> > I hope you have some access control via your web application...
> >
> https, ip, user
>
> Danke,
> :m)
>
>
>

