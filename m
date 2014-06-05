From: Martin Kraus <martin.kraus@wujiman.net>
Subject: Re: conntrackd crash after few seconds
Date: Thu, 5 Jun 2014 18:06:40 +0200
Message-ID: <20140605160639.GB29302@finrod>
References: <53908A7E.4020802@yahoo.fr>
 <20140605154944.GA29302@finrod>
 <CAOkSjBifDQQNNQJbkdraYxNvStvK9CrWRNO7LtawpJJ5n=cTMg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOkSjBifDQQNNQJbkdraYxNvStvK9CrWRNO7LtawpJJ5n=cTMg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Nicolas RENAULT <nicolas_renault@yahoo.fr>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

On Thu, Jun 05, 2014 at 05:59:19PM +0200, Arturo Borrero Gonzalez wrote:
> On 5 June 2014 17:49, Martin Kraus <lists_mk@wujiman.net> wrote:
> 
> > On Thu, Jun 05, 2014 at 05:19:26PM +0200, Nicolas RENAULT wrote:
> > > informations :
> > >
> > > debian wheezy     3.2.0-4-amd64 #1 SMP Debian 3.2.57-3+deb7u2 x86_64
> >
> > Hi.
> >
> > We had crashes on debian wheezy which were solved by upgrade to
> >
> > linux-image-3.13-0.bpo.1-amd64
> >
> 
> 
> Is this the same as the Debian bug #746464 [0]?

probably not. we hit a kernel panic and when I redirected kernel console to
the serial port for another run it showed that there was a stalled cpu core running
conntrackd process and everything was just dead.

mk
