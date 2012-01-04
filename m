From: Anton Melser <melser.anton@gmail.com>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Wed, 4 Jan 2012 16:15:39 +0100
Message-ID: <CAKywjPrqwnUJNrF3jEcXsFnpNcvFp7=YXEZJmkKq-J2Wr50Tww@mail.gmail.com>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
 <op.v7e9nhxox1lyi3@debiandesk2.net> <CAKywjPpKpVdBz9boAhgj=-F488ayAtoLK1ua=GWKZ1hjNMWpZA@mail.gmail.com>
 <op.v7fekow7x1lyi3@debiandesk2.net> <CAKywjPprq497Ox7hZRMXNApC24nkm4syEbrAkX02N-QOPBpKiA@mail.gmail.com>
 <op.v7gsi0a4x1lyi3@debiandesk2.net> <CAKywjPpK97N9hCVO7hsH4grCV62rmSbH_Dm5d=WcOutor3afWg@mail.gmail.com>
 <op.v7hgf5rkx1lyi3@debiandesk2.net> <CAKywjPq1m33xZPMobhS4WAu-=ugcEdBbVOPnz1b90to66WqnLg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=MGgMJxbmUs+xkXC9XTwInvWYSHtb73/x0F5DZGxpJhU=;
        b=E3pJVcqrT6DfkO5nGJEgcZjJ+C74AXdQi+6KPGN2tkIpB0ZSlveCzICX4ImTvEvHfJ
         Nrnw7ulsy2sJidNNzZuc+i4yUy1spVRJRJ2Ao6ONyiMgBzNfMXOIaqoKKbzOFty2LE4W
         CTcgP7883dqmjM8d22F9D2YGJyTZDIhI2qM2A=
In-Reply-To: <CAKywjPq1m33xZPMobhS4WAu-=ugcEdBbVOPnz1b90to66WqnLg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

...
> I am all up for alternative means for making sure a particular IP can
> be available for sending 24/7 cheaply, if there are any. (Don't
> mistake cheap for provider as cheap for sender though!) I thought
> iptables/netfilter would be a good way of doing it but I might be
> wrong...

In the hope that one final example shows the fact that what I want to
do is completely legitimate. Here are the headers of a *LINUX
FOUNDATION* newsletter I received today:

Received: from email-gaia.pd27.com (email-gaia.pd27.com. [208.43.21.70])
        by mx.google.com with ESMTP id gj7si35742626qab.7.2012.01.04.06.13.51;
        Wed, 04 Jan 2012 06:13:52 -0800 (PST)
Received-SPF: pass (google.com: domain of
undelivered+6342+158668917@pd25.com designates 208.43.21.70 as
permitted sender) client-ip=208.43.21.70;
Authentication-Results: mx.google.com; spf=pass (google.com: domain of
undelivered+6342+158668917@pd25.com designates 208.43.21.70 as
permitted sender) smtp.mail=undelivered+6342+158668917@pd25.com
Received: by email-gaia.pd27.com id h0hfa00oaq85 for
<my_email@gmail.com>; Wed, 4 Jan 2012 09:09:16 -0500 (envelope-from
<undelivered+6342+158668917@pd25.com>)
Return-Path: <undelivered+6342+158668917@pd25.com>
Message-ID: <1325686156.4f045d8cb7f92@swift.generated>
Date: Wed, 04 Jan 2012 09:09:16 -0500
Subject: CFP Deadline This Friday To Speak at Android Builders Summit and
 Embedded Linux Conference in February
From: Linux Foundation Events <no-reply@linuxfoundation.org>

208.43.21.70 is an IP (that seems to be, see the whois) registered to
Pardot, an online marketing (including email) infrastructure provider,
NOT the Linux Foundation. All the newsletters from the Linux
foundation that I have received since 2011-10-11 have come from the
same IP (hurrah, so it's a dedicated IP!). Pardot have declared many
thousands of IPs as valid IPs that receivers might receive email from
on their behalf (nslookup -type txt pd25.com, then keep digging into
the SPF records to get the actual IPs). They almost certainly have
thousands of clients.
If Pardot have the same issues as we do (they do, they are a
competitor for some products, including email sending), and the Linux
Foundation are a client of theirs and use their email marketing
services, then... the Linux Foundation are SPAMMERS! Yikes! We are all
doomed... :-).

So in other news - does anyone have any suggestions or advice on the
best way to do NAT + multi-routing via several gateways using
netfilter/iptables with 1600+ IPs?
Thanks,
Anton
