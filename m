From: Mayank <linuxblr_in@yahoo.com>
Subject: Re: how to execute command on match?
Date: Sun, 19 Feb 2006 23:52:51 -0800 (PST)
Message-ID: <20060220075251.20042.qmail@web37804.mail.mud.yahoo.com>
References: <859616420602192230i78f13206r@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <859616420602192230i78f13206r@mail.gmail.com>
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org
Cc: David Vogt <beunlovable@gmail.com>

Well, I want to make a blocking call, for example, if
the netfilter finds a TCP SYN packet, I want to
execute user defined program and this program will in
turn do some processing (which may include some
communication with some other system on lan)=20

Basically, I am looking for some sort of a target
match code, =93-j exec /usr/bin/myprog=94 , as soon as
myprog gets the control I want to do some processing
and then tell the netfilter whether what to do with
the packet, which could be allow, drop, reject etc.

Please help.

Cheers,
Mayank.

--- David Vogt <beunlovable@gmail.com> wrote:

> Do you need the actual program for the packet? Or is
> it just some kind
> of trigger you want?
>=20
> 2006/2/19, linux blr <linuxblr_in@yahoo.com>:
> > hi all,
> >
> > plz let me know how can i execute a program
> everytime
> > there is a match, for example,
> > everytime my Linux box receives a packet with SYN
> bit
> > ON, instead of taking normal actions like
> > ALLOW,DROP,REJECT, i want to execute a command.
> >
> > google wasn't able to help me, hope this list
> will..
> >
> > cheers,
> > mayank.
> >
> > __________________________________________________
> > Do You Yahoo!?
> > Tired of spam?  Yahoo! Mail has the best spam
> protection around
> > http://mail.yahoo.com
> >
> >
>=20


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around=20
http://mail.yahoo.com=20

