From: Nick Khamis <symack@gmail.com>
Subject: Re: Dabase BAcked IPTables
Date: Sat, 29 Jun 2013 16:39:06 -0400
Message-ID: <CAGWRaZbQXv=J8YfofS4HEUYovcLTdoW5yvLpKdfP83rOkyRyng@mail.gmail.com>
References: <CAGWRaZYZnq3bneKNdisrRAfk=9PvKD=cXVWN_b0ySVRMaPw9Dw@mail.gmail.com>
	<CADuigkUCfERrvP3cM_nXPiP-27MP3FPRdf0rzPVNSqDEJ3YQMg@mail.gmail.com>
	<alpine.DEB.2.00.1306292014350.26742@blackhole.kfki.hu>
	<1372536635.3924.89.camel@andrew-desktop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=u5K8hFQbScqIARq1bEmm1HzN+PJYdgqgYGKd88a25uk=;
        b=ezMbsQJo3cz3a1ImkK/kcQsCLJNAVpv6YqK/zt4ZlonY1glu4pZnqkLNShwOMMDxQL
         vmuH8uoEfxIbYxzhYPUNg9XJyYrw4tRsX3skRBoRb8ZCszizj2oaH2T1ZG5xZX9cthjd
         lJ1OmlKaJf6HU1RmlQG5cXVH5fjqhbVgnLxNTleE4aQVGkjV9Z22zxO944xOdQA53H44
         qMCmSGdr7WsPwQEhu7c+cGhlrMrjo0CwCcFC1aweVOIkwCnuElyeFQRFv4gh7AlZK0l3
         uf9eAGtES6u/rzCwnfOybVP3z/iuVduBd+D2d0mUF1ZUvVaH1R91Xtn8GamOP2soDkky
         j6xA==
In-Reply-To: <1372536635.3924.89.camel@andrew-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Ricardo Klein <klein.rfk@gmail.com>, netfilter <netfilter@vger.kernel.org>

I love you guys!!! I am sorry that I have left out important details
that left you speculating. We offer a SIP phone service to our
clients. In netfilter speak that's:

-A UDP -p udp -m udp --sport 5060 ---dport 5080 -j ACCEPT :)

Anyone can use our SIP server however, they will first need to create
an account through our website, and provide the mac of the device that
will be connecting to us. The website does not have to capture their
info.

Why we prefer mac is because the device will not be static, it will be
on the move hopping on different networks all happy and stuff :)....

Andrew, that is kind of what we are looking for but as you mentioned
ipset would be a much better way of doing it. Until this post I did
not know of ipset, will have to educate myself regarding it.

What is unclear at this moment is, do we have mac support, or is it
called *ip*set for a reason? Secondly, can we update and remove
existing entries in our config.

Kind Regards,

Nick.
