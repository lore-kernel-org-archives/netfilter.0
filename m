From: Dimitri Yioulos <dyioulos@onpointfc.com>
Subject: Re: Rate-limiting to halt brute-force attack
Date: Fri, 16 Nov 2012 13:13:23 -0500
Message-ID: <201211161313.23312.dyioulos@onpointfc.com>
References: <201211160922.36606.dyioulos@onpointfc.com> <20121116180150.GT3672@harrier.slackbuilds.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20121116180150.GT3672@harrier.slackbuilds.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Friday 16 November 2012 1:01:50 pm /dev/rob0 wrote:
> On Fri, Nov 16, 2012 at 09:22:35AM -0500, Dimitri Yioulos 
wrote:
> >  A few days ago, a major brute-force attack was
> > launched against our (sendmail) mail server. It looks
> > like a bot is aiming lots of zombies at us. Here's how
> > OSSEC hids reports an attempt from one of the zombies:
> >
> > OSSEC HIDS Notification.
> > 2012 Nov 13 09:08:16
> >
> > Received From: (plymouth)
> > 192.168.1.2->/var/log/messages Rule: 40111 fired (level
> > 10) -> "Multiple authentication failures."
> > Portion of the log(s):
> >
> > Nov 13 09:07:44 plymouth ipop3d[29926]: Login failed
> > user=hod auth=hod host=201-93-132-240.dsl.telesp.net.br
> > [201.93.132.240]
>
> This is not Sendmail. This is ipop3d.
>
> > Nov 13 09:07:44 plymouth ipop3d[29925]: Login failed
> > user=lee auth=lee host=201-93-132-240.dsl.telesp.net.br
> > [201.93.132.240]
>
> Yep, this is a spammer looking for credentials for SMTP
> AUTH, probably, so it eventually could be targeted at
> Sendmail.
>
> > To remediate, I've put fail2ban in place on the mail
> > server, and it's working. However, the attacks are
> > still beating at the door, and it's significantly
> > increased the load on the mail server . I'm now
> > thinking of adding rules to our iptables/Netfilter
> > firewall to rate-limit the brute-force connections. The
> > rules I'd add are these:
> >
> > iptables -A INPUT -p tcp --dport 110 -m state --state
> > NEW -m recent --set
> >
> > iptables -A INPUT -p tcp --dport 110 -m state --state
> > NEW -m recent --update --seconds 15 --hitcount 3 -j
> > DROP
>
> First, I would not apply this only to POP3 (a protocol
> which should have died out 10+ years ago! IMAP can do it
> all, and better!) I'd apply this to "-m multiport
> --dports 110,143,465,587,993,995" to cover all the
> potential attacks, omitting any of those that you're not
> providing service on.
>
> No, 25 is not in that list. I'm not sure how safely to
> limit connections on 25, since MTAs are automated
> processes. Normal non-spam MUAs are driven by a human.
>
> Second, I'm not sure that 3 in 15 seconds is safe. MUAs
> are semi- automated, and it's possible that a real user
> could trigger that. I might try something like 5 in 10
> seconds, and a secondary check for more, maybe 10 in 30
> seconds.
>
> > As the mail server sits in a DMZ, and packets are
> > forwarded to it, is the INPUT chain the best place to
> > put these rules, or should they go in the FORWARD chain
> > (with appropriate modifications)?
>
> The mailing list is not a substitute for the man page.
> Packets which are forwarded through a host do not hit
> that host's INPUT chain. Please do take the time to learn
> what each built-in chain is for.
>
> > Of course, I don't want to stop legitimate mail. Is
> > this the best course of action?
>
> Mail exchange is done with SMTP on the "smtp" port, 25.
> POP3 is a protocol for users' access to a mailbox.
>
> http://en.wikipedia.org/wiki/Post_Office_Protocol
> --
>   http://rob0.nodns4.us/ -- system administration and
> consulting Offlist GMX mail is seen only if "/dev/rob0"
> is in the Subject: --
> To unsubscribe from this list: send the line "unsubscribe
> netfilter" in the body of a message to
> majordomo@vger.kernel.org More majordomo info at 
> http://vger.kernel.org/majordomo-info.html


Thanks very much.  Very helpful information.  And, apologies 
for not using the man page.  I wasn't trying to be lazy.

Dimitri

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

