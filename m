From: "Michael Hudin" <hudin@zoetrope.com>
Subject: Outgoing SMTP Mystery Resolved
Date: Wed, 5 Jun 2002 12:06:18 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <007d01c20cc4$12e0c940$5227a8c0@michael>
References: <3A5DC36EC1506C40825C05BE65E62AEF0E8B2A@neptuno.idea.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Totally bone head move.  The domain I was sending to was the only one of the
group I manage whose MX record was set to an older mailserver that didn't
have forwarding for it set up in the tables.  I updated the MX and the
problem is solved.  Thanks to all who helped and were also right that it
wasn't a problem with iptables.  They work fine and are part of a great
piece of software.

-michael

----- Original Message -----
From: "Omar Castaneda Acosta" <omar@idea.com.mx>
To: "Michael Hudin" <hudin@zoetrope.com>
Sent: Wednesday, June 05, 2002 11:31 AM
Subject: RE: Outgoing SMTP Mystery


Hey, you are welcome!

Telnet does only a plain text TCP connection, it doesn't authenticate at
all.

A typical test would be like this: (all lines with a number on them are
server response)

$ telnet your.firewall.external.ip 25
220 qmail server name ESMTP
EHLO
250-Your welcome message
250-PIPELINING
250 8BITMIME
MAIL from: somebody@outthere.com
250 ok
RCPT to: somebody@yourdomain.com
250 ok
DATA
354 go ahead
Subject: Test
Just  a Test
.
250 ok  someserialnumber qp 2765
QUIT
221 Goodbye message

If you can manage to get this conversation with your qmail smtp daemon,
then iptables is correctly setup, anyway your problem may be when you
specify the RCPT, you may see an error message from qmail, and that
would be the hint to fix this setup!

Regards,
Omar

PS. As I believe this is a problem related with qmail configuration and
could be considered off-topic on the list, so I'm not replying to it
anymore. Good luck!


-----Original Message-----
From: Michael Hudin [mailto:hudin@zoetrope.com]
Sent: Wednesday, June 05, 2002 12:21 PM
To: netfilter@lists.samba.org
Subject: Re: Outgoing SMTP Mystery

That would be a good way to test.  Unfortunately I don't have telnet
setup
on any machines that are external to the firewall and have qmail
running.
When I went to port 25 using telnet, it did appear to authenticate me
through one of the usernames, but I may be mistaken since I'm not very
knowledgeable about telnet.

Omar, thanks for the offlist help with the port forwarding by the way.
This
has to be one of the useful and helpful groups of people out there.

-michael

----- Original Message -----
From: "Omar Castaneda Acosta" <omar@idea.com.mx>
To: "Michael Hudin" <hudin@zoetrope.com>
Sent: Wednesday, June 05, 2002 11:03 AM
Subject: RE: Outgoing SMTP Mystery


Well, if you can connect to port 25 from the someplace on the external
side of your firewall, then the port forwarding is working ok.
try manually (using telnet) sending an email thru a connection being
portfw'ed to your qmail server.

-----Original Message-----
From: Michael Hudin [mailto:hudin@zoetrope.com]
Sent: Wednesday, June 05, 2002 11:59 AM
To: netfilter@lists.samba.org
Subject: Re: Outgoing SMTP Mystery

Yeah, I was assuming that there were no default drop rules.  I'll make
sure
to implement those.

I did realize that my /etc/hosts file was still set to the old subnet.
I
corrected that, but it still is having the same problem.  The gateway on
the
mail machine is set correctly and remember that I can POP in and out and
SMTP out.  I just can't get SMTP in for some mind boggling reason.

-michael

----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.samba.org>
Sent: Tuesday, June 04, 2002 4:46 PM
Subject: Re: Outgoing SMTP Mystery


> On Tuesday 04 June 2002 11:18 pm, Michael Hudin wrote:
>
> >  I've always assumed that the numbers in the brackets were port
allowances
>
> No, they're not (although I can't say what they are - I don't use
> iptables-save).   If you look at the numbers, many of them are larger
than
> 65535, so they're certainly not port numbers :-)
>
> > Here are my tables:
> >
> > *nat
> >
> > :PREROUTING ACCEPT [241:88600]
> > :POSTROUTING ACCEPT [0:9862]
> > :OUTPUT ACCEPT [68:4275]
> >
> > *mangle
> >
> > :PREROUTING ACCEPT [18365:3221456]
> > :INPUT ACCEPT [10886:760348]
> > :FORWARD ACCEPT [7269:2438049]
> > :OUTPUT ACCEPT [8009:752540]
> > :POSTROUTING ACCEPT [15177:3182145]
> >
> > *filter
> >
> > :INPUT ACCEPT [0:229546]
> > :FORWARD ACCEPT [363:1553786]
> > :OUTPUT ACCEPT [2:619341]
>
> I find this interesting - you have a default ACCEPT policy on all your
chains
> - specifically on FORWARD, and I cannot see any rules you have
included
which
> DROP or REJECT packets..... so is there really any filtering going on
in
your
> firewall, or is it in fact just an open router doing some network
address
> translation !?
>
> I know this doesn't exactly solve your problem, but I wonder if it
means
the
> problem isn't on your firewall ?
>
> Perhaps you could check the routing table on your SMTP server - what
does
it
> have for a default gateway address ?
>
>
> Antony.
>
>
>








