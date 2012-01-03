From: Anton Melser <melser.anton@gmail.com>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Tue, 3 Jan 2012 09:56:48 +0100
Message-ID: <CAKywjPq1m33xZPMobhS4WAu-=ugcEdBbVOPnz1b90to66WqnLg@mail.gmail.com>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
 <op.v7e9nhxox1lyi3@debiandesk2.net> <CAKywjPpKpVdBz9boAhgj=-F488ayAtoLK1ua=GWKZ1hjNMWpZA@mail.gmail.com>
 <op.v7fekow7x1lyi3@debiandesk2.net> <CAKywjPprq497Ox7hZRMXNApC24nkm4syEbrAkX02N-QOPBpKiA@mail.gmail.com>
 <op.v7gsi0a4x1lyi3@debiandesk2.net> <CAKywjPpK97N9hCVO7hsH4grCV62rmSbH_Dm5d=WcOutor3afWg@mail.gmail.com>
 <op.v7hgf5rkx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=LFJbMWZmEvcOd4QWHPH0eUzD6Zi7iwCaDAwI/Ty4vFk=;
        b=Ra9CEaOKXfg/kl2pudrxhEosexYkcHLtM4wJjVlxYoDz7gWx0To5FtSLy137s+zBOB
         avEC57qVqIba5JrVd7QsXFRlHM9T4aRdHciS1x1rgf4dbl/rSaK0dSpb/1Kd380SnuRa
         hWRyijOeQ+erPIKhqDu3NiZhAZ7k7fdUS18LY=
In-Reply-To: <op.v7hgf5rkx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

> I think the above makes it very clear why I understood that your serv=
ice
> seeks to send out email for customers with source IPs *other* than th=
e
> customers' own IP, at least during the IPs "break-in period".
The link was meant to provide an introduction to some of the issues.
You are obviously focusing exclusively on possible ways the current
situation can be gamed or abused. Unfortunately there are not 15
different ways to "warm up" IPs. It takes time and so costs money, as
most people are still doing this at least semi-manually. You need to
build up slowly, that is how the ISPs/MSPs require it. In any case, it
takes weeks for an IP to earn a reputation and all that can be
destroyed in a single send (couple of hours). When an IP has a
reputation then you can dedicate it to a customer and the customer
then becomes responsible for their own reputation. Again, this is the
goal and there is only really one way to get there. If there were some
magic program that all ISPs/MSPs adhered to and required a large bond
to be posted in terms of guarantee, we would jump on it. If we could
just say, "here are many thousands of dollars, if anyone sends
anything dodgy from this IP then it is forfeit" that would save lots
of time and hassle. It doesn't exist. Even whitelisting services like
Return Path SenderScore certification require a minimum of 3mths on a
dedicated IP before they will *consider* accepting an IP in the
program! We have multi-year contracts with our clients - we are not at
all interested in customers that come, send crap for a week or two and
leave. That is not possible with our infrastructure because we have an
involved acceptance process where databases are analysed, marketing
programs reviewed, etc, and you sign a (absolute minimum) 12-mth
contract. Sign up costs are also significant, and spammers need for
things to be cheap. I recently read that on average 12.5 million spam
messages need to be sent for $100 of "viagra" to be sold. You would be
losing a LOT of money sending these messages on any reputable email
service provider!

> Now you explain what you are really trying to do is provide mail serv=
er
> redundancy. =C2=A0You can do that easily and cheaply with DNS failove=
r. =C2=A0But that
> is off-topic.
Sending and receiving email are two quite different needs. I would be
very, very surprised if, say, Yahoo! did sending and receiving on the
same machines. The various SMTP standards never suggest that email
should only be sent from machines in the MX. The ISPs and MSPs don't
care if you use machines referenced in the MX records. I know because
anti-abuse masters have told me so. Sure, you need to provide robust
infrastructure for dealing with bounces and any complaints (to
postmaster@, abuse@, etc.) but that has nothing to do with sending
infrastructure. You should also provide rDNS but again, that has very
little to do with reputation indexes based on IP address. DNS failover
isn't an option for providing MTA sending uptime from a particular IP.
What I am trying to do is DNS failover for IPs - so having a public
token (in DNS it's a name, for me it's an IP) that is translated to
one or many internal values (IP for DNS, LAN local IP for me). Isn't
this NAT?
I am all up for alternative means for making sure a particular IP can
be available for sending 24/7 cheaply, if there are any. (Don't
mistake cheap for provider as cheap for sender though!) I thought
iptables/netfilter would be a good way of doing it but I might be
wrong...
Cheers
Anton
