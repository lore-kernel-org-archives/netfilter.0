From: Tarak Ranjan <contacttrm@yahoo.co.in>
Subject: RE: Rules For MailServer
Date: Mon, 4 Aug 2008 06:58:12 +0100 (BST)
Message-ID: <650807.79359.qm@web94006.mail.in2.yahoo.com>
References: <000001c8f5e7$4cfe8be0$e6fba3a0$@info>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000001c8f5e7$4cfe8be0$e6fba3a0$@info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Sterenborg <rob@sterenborg.info>, netfilter@vger.kernel.org


--- Rob Sterenborg <rob@sterenborg.info> wrote:

> > Hi List,
> > I'm running a mailserver on qmail, it has
> > eth0(192.168.1.100) & eth1(x.x.x.x), issue is that
> > lots of unwanted SMTP connection has been
> established
> > on that due to this reason socket has timeout
> > frequently.
> > 
> > any kind of limit on connection, or any kind of
> > solutions of securing SMTP will be appreciable.
> 
> I'm don't think netfilter rules will really help you
> here because you'll never know *from where* a
> connection will be made: you won't be able to block
> it before it's already there and you don't want to
> limit legitimate email. Are you already using
> DNSBL's like ZEN from Spamhaus or something like
> that?
> 
> 
> Grts.
> Rob
Hi Rob,
Yes, using RBLSMTPD there are zen,spamcop & another 2
RBL sites i have been configured. even though the lots
of unwanted connection is established...

/\
Tarak


      Unlimited freedom, unlimited storage. Get it now, on http://help.yahoo.com/l/in/yahoo/mail/yahoomail/tools/tools-08.html/
