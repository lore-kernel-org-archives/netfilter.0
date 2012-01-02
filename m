From: Anton Melser <melser.anton@gmail.com>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Mon, 2 Jan 2012 23:14:56 +0100
Message-ID: <CAKywjPpK97N9hCVO7hsH4grCV62rmSbH_Dm5d=WcOutor3afWg@mail.gmail.com>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
 <op.v7e9nhxox1lyi3@debiandesk2.net> <CAKywjPpKpVdBz9boAhgj=-F488ayAtoLK1ua=GWKZ1hjNMWpZA@mail.gmail.com>
 <op.v7fekow7x1lyi3@debiandesk2.net> <CAKywjPprq497Ox7hZRMXNApC24nkm4syEbrAkX02N-QOPBpKiA@mail.gmail.com>
 <op.v7gsi0a4x1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=jMmVT4PVaZFHk1ffU6tR7iMdkl7tU5O34Fi5vxkT5iE=;
        b=oXGafGYyGuwqHUsbAuqMCp/PCYFs7Lcu5DDlDRdIiid7nrGtq1N396gYEcU9GbzVzD
         LvKdnI2vh85b+ajNH5z/pyqKKXJzZlMLHpYMq6mpVOaKN7FLsH+XXcboQ42VBY82gU3m
         WWro6sH4yvmIARwmkkzhgsJjjy6TIFlU2Hkj4=
In-Reply-To: <op.v7gsi0a4x1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

=2E..
> I have considerable experience running SMTP servers (Postfix), and I =
see no
> problem with having 1600 hosts. =C2=A0I understand that these hosts w=
ould be
> spread out among your 3-8 mail servers, so the number of hosts served=
 might
> be about 200 per SMTP server. =C2=A0What might be a worry is the fact=
 that they
> normally send bulk email. =C2=A0You may want to ask your customers to=
 send their
> bulk mail at certain times, to avoid overload.

This is what may be causing the confusion. The point of the exercise
is actually for each client to be able to send with their own IP 24/7
with no downtime. If a public IP is tied to a physical MTA machine
then if you want to take that machine offline for maintenance (or it
goes offline without you wanting!), the IP can no longer send. If you
have 200 customers on an MTA, then that's 200 customers that can't
send while you are doing maintenance. And if all 200 customers decide
to send at the same time then our poor MTA will not be happy, and
neither will the client whose newsletter takes 15 hours to send! Yes,
it is possible to move IPs, but there are ARP cache problems and this
is most definitely not HA (you have to move queues, etc.). There is
also bonding or any number of other HA solutions but I'll bet trying
to do that with MTA software and many machines is much more
problematic than doing it with just one or two failover FW machines.
It seems relatively easy to cluster iptables for HA with conntrack and
other tools, so FW uptime can be assured easily (and cheaply) that
way. It is also vastly preferable not to have machines directly
accessible from the internet, meaning there will be some sort of
firewall (transparent proxy) anyway. NATing seemed to me to be a
pretty good way of being able to do maintenance at reasonable times of
the day (like a Monday morning at 10am instead of Monday morning at
2am) and add/remove capacity, etc. Clients never, ever like downtime,
that is a given I think. They also don't like being told "you need to
send starting from 1am" - their research has shown them that their
subscribers want their emails at 10:30am (or whatever), so if we can't
send at that time then a competitor will... The idea is to provide a
secure, robust, flexible platform with (almost) no downtime and
without costing many hundreds of thousands of $$$.
So nothing really nefarious here except liking sleep and wanting to do
things with FOSS as much as possible (and saving money)...
In a nutshell, one client =3D one IP =3D one reputation =3D many MTAs (=
for
redundancy and capacity and for no other reason) is the goal.

> If you set up your machines as relays, Postfix and other MTAs will wr=
ite the
> public IP of the sender into each email in the first "Received" line.=
 =C2=A0Then
> the receiving ISPs can check the reputation of each sender IP. =C2=A0=
If that's
> your goal ("...newsletters from an IP that is used by only ONE client=
=2E =C2=A0We
> agree, this is how it should be."), that's the proper way to do it. =C2=
=A0Your
> customers would each require only an email client running on a regula=
r PC,
> not a full-fledged mail server as you imply. =C2=A0I'm sure that plen=
ty of email
> clients suitable for sending bulk email are available.
>
> However, I don't think you want those public IPs in the bulk emails, =
based
> on the link you sent
> (http://blog.mailchimp.com/should-you-send-from-a-dedicated-ip-addres=
s/)
> =C2=A0The whole idea of that service, which you pointed out as an exa=
mple of your
> own, is to circumvent the time-consuming process of building an IP's =
email
> reputation by sending it from another, "trusted" IP. =C2=A0Isn't that=
 what you're
> trying to do?

Nope, see above.

> Of course, this mailing list is not the place to debate this.
>
> Since SNAT is done in the POSTROUTING chain, you can't use SNAT to tr=
y to
> remove evidence of your customers' public IPs from mail sent on the *=
same*
> machine that does the SNAT. =C2=A0Even if you use a NATting router to=
 FORWARD the
> email to mail servers running on other machines, the MTAs will know t=
he true
> origin IP and will ignore the NAT IP when they write the mail header.
>
> Hiding the true sender IP is a violation of protocol. =C2=A0One way t=
o violate
> protocol is to do something like remove the Received header that cont=
ains
> your sender's public IP. =C2=A0That can easily be done, but I won't g=
o into
> details.
:-). That is most certainly not the idea at all! The idea IS to have a
big black box that sends newsletters - no one cares whether the actual
physical machine that generates an email is the one that queues it for
sending, or whether an IP points to a firewall machine or a physical
MTA. The "true" sender IPs are fully referenced in the whois database
with full contact details, including physical company address and
contact phone numbers. No one wants to hide anything. Email addresses
included in the whois databases are regularly checked and any
complaints are dealt with promptly and seriously. Any of our clients
who do not comply with the various anti-spam laws or our much stricter
terms of service are immediately cut off and contracts nulled. That is
the only way to have good working relationships with the ISPs - we get
called by postmasters "client X is causing complaints, get rid of
them", not blocked like what happens to some irresponsible industry
players. Transparancy and openness is the only way forward for email
marketing, and the only way to maintain good relations with the
receivers. ISPs don't want a sender (one "end client" of ours) using
lots of different IPs. They also prefer to have a single sender on an
IP if possible - that makes it much easier for them to classify and
filter if necessary. The best way to make sure newsletters get
accepted into subscribers' inboxes is to do what the ISPs/MSPs want.
ISPs/MSPs want their users to be happy, which means receiving the
newsletters they subscribe to in their inboxes and putting the spam in
the spam folder (or not at all). That is what we want to - it is a
sustainable and responsible business and has a future.

> As for limiting access to the spoofing mail server to your network ra=
nges,
> that's not necessary since your relaying mail servers will require
> authentication. =C2=A0However:
>
> Allow NEW port 25 connections from each of your IP ranges:
> iptables -A INPUT -p tcp -m state --state NEW -s x.x.x.x/23 -j ALLOW
> etc.
>
> I think you will need this (one rule only) to allow email negotiation=
:
> iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ALLO=
W
>
> Then set the default policy:
> iptables -P INPUT DROP

Thanks for the tips, particularly on the LAN-local sending IP in the
headers, I had forgotten about that... and it will need to be replaced
with the clients' dedicated public IPs when it leaves the FW. That
might be a job for a netfilter module?
Anton

ps. Sorry about the dancing email "anton at linux dot com" and the
gmail. I thought I'd finally use my linux.com address (support the
cause!) but gmail defaults to my default address for replies and I
missed it. What I don't understand is why the list accepted my gmail
address when I subscribed with @linux.com...
