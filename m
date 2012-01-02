From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Mon, 02 Jan 2012 10:10:02 -0600
Message-ID: <op.v7gsi0a4x1lyi3@debiandesk2.net>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com> <op.v7e9nhxox1lyi3@debiandesk2.net> <CAKywjPpKpVdBz9boAhgj=-F488ayAtoLK1ua=GWKZ1hjNMWpZA@mail.gmail.com> <op.v7fekow7x1lyi3@debiandesk2.net> <CAKywjPprq497Ox7hZRMXNApC24nkm4syEbrAkX02N-QOPBpKiA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKywjPprq497Ox7hZRMXNApC24nkm4syEbrAkX02N-QOPBpKiA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: Anton Melser <melser.anton@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, 02 Jan 2012 03:00:23 -0600, Anton Melser <melser.anton@gmail.com> wrote:

> No, you misunderstand. (At least with IPv4) Reputation ~= IP. The goal
> is 1 client = (at least) 1 IP. Reputation DOES take time to build up,
> and the best way to build it up is by sending relevant, permissioned
> newsletters from an IP that is used by only ONE client. We agree, this
> is how it should be. But lots of clients = lots of IPs...
> But this is *WAY* OT...

I have considerable experience running SMTP servers (Postfix), and I see no problem with having 1600 hosts.  I understand that these hosts would be spread out among your 3-8 mail servers, so the number of hosts served might be about 200 per SMTP server.  What might be a worry is the fact that they normally send bulk email.  You may want to ask your customers to send their bulk mail at certain times, to avoid overload.

If you set up your machines as relays, Postfix and other MTAs will write the public IP of the sender into each email in the first "Received" line.  Then the receiving ISPs can check the reputation of each sender IP.  If that's your goal ("...newsletters from an IP that is used by only ONE client.  We agree, this is how it should be."), that's the proper way to do it.  Your customers would each require only an email client running on a regular PC, not a full-fledged mail server as you imply.  I'm sure that plenty of email clients suitable for sending bulk email are available.

However, I don't think you want those public IPs in the bulk emails, based on the link you sent (http://blog.mailchimp.com/should-you-send-from-a-dedicated-ip-address/)  The whole idea of that service, which you pointed out as an example of your own, is to circumvent the time-consuming process of building an IP's email reputation by sending it from another, "trusted" IP.  Isn't that what you're trying to do?

Of course, this mailing list is not the place to debate this.

Since SNAT is done in the POSTROUTING chain, you can't use SNAT to try to remove evidence of your customers' public IPs from mail sent on the *same* machine that does the SNAT.  Even if you use a NATting router to FORWARD the email to mail servers running on other machines, the MTAs will know the true origin IP and will ignore the NAT IP when they write the mail header.

Hiding the true sender IP is a violation of protocol.  One way to violate protocol is to do something like remove the Received header that contains your sender's public IP.  That can easily be done, but I won't go into details.

As for limiting access to the spoofing mail server to your network ranges, that's not necessary since your relaying mail servers will require authentication.  However:

Allow NEW port 25 connections from each of your IP ranges:
iptables -A INPUT -p tcp -m state --state NEW -s x.x.x.x/23 -j ALLOW
etc.

I think you will need this (one rule only) to allow email negotiation:
iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ALLOW

Then set the default policy:
iptables -P INPUT DROP

-- 
Lloyd
