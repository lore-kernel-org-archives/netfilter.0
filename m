From: Sargun Dhillon <sargun@sargun.me>
Subject: ctnetlink_change_conntrack - cannot change NAT - alternative:
 (atomic) destroy and create
Date: Wed, 16 Dec 2015 09:25:18 -0800
Message-ID: <CAMp4zn-anZcOPDFUC8CqJQXa1=YDaYWLut2RiQF6jx_N86mA8Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sargun.me; s=google;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=t5KZZaHxpk0VlT5KlXqiBf4MAjzr9y8gKFvPqHuuacA=;
        b=eQ3ZshZENw/latdQio3IajahEgPztH3Ei81BJ4rqYCdJasgWquK4KS+AntRGqFh2kM
         WIaStqbsci4MfsAt8YegSA0ohWHeJAgaNCy5JzG0GaB7plyZd/bzyVKjIvCoA6eNCiLg
         3ct9gnNRlQxJPBSuUfQfC8ekMTjGWz3dEJCYU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I noticed that ctnetlink_change_conntrack has a stanza that looks like
the following:

/* only allow NAT changes and master assignation for new conntracks */
if (cda[CTA_NAT_SRC] || cda[CTA_NAT_DST] || cda[CTA_TUPLE_MASTER])
return -EOPNOTSUPP;

Preventing me from changing the NAT entry for a given connection, even
if it's in time_wait. Why is this the case?

An alternative for my use case would be the ability to send a command
to destroy and create a new entry. Is there a mechanism to do this
without having to monitor the conntrack events, and change my
behaviour depending on whether or not I find a colliding entry?
