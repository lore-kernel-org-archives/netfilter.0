From: Cristian Constantin <const.crist@googlemail.com>
Subject: Re: nft set load metrics
Date: Thu, 30 Sep 2021 21:01:01 +0200
Message-ID: <CANCV4NOYjECUywOcB9Bpi0oq+f_mO+Orb5TcsFCog4ibvF5t+A@mail.gmail.com>
References: <CANCV4NMrw5m_-DCwnFGahygVnMGuVnU-RouBCqOsg6QX7z4AKQ@mail.gmail.com>
 <YVXC5cPRHyaE3VRL@salvia> <CANCV4NP-9qTA+ehWNMT5-WEkomWkKrLWg30vcuEYaihs6a3sww@mail.gmail.com>
 <b943f279-73a-303e-3244-ed7fd4d4949@jubileegroup.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9vnpkT6yPslejrw2H6vjiWzQUog6iM2fHkIW+BCNKyM=;
        b=N4BnnD+9CjsOnByiSOHXrDTLfUlydPQQ3zjgZGzkoRU2q+jsNbyACFseSfbU5Oy2eZ
         2oOJHzHfy3W8SFT5eHcifj2lFZebDuJr2qv3xYgPBjuJqjaQ1Ggs2A9YdRYbit52c+f6
         Ntouga7MGRfEKZDc6tSBQCAFh2FeGHYX6wACY9ZmNqzaw58Ui66aMiV/upCmMyH9enC5
         kpAjs7l9XFduE8Tw4VLxpE1iCSrerZ/y0HJjlM8lt44KSUpFQHhJDPF7C3gM27S/sgwH
         bTkPgMLrj1E1AERKLzG8a1lJu+5kHuoktX+9kNMdWu/gzDpDr00YW8rAwVbKL73t/eix
         E3Yg==
In-Reply-To: <b943f279-73a-303e-3244-ed7fd4d4949@jubileegroup.co.uk>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "G.W. Haywood" <ged@jubileegroup.co.uk>
Cc: netfilter@vger.kernel.org

> Presumably it was you who created the elements, can you not simply
> store them e.g. in a Perl hash at the time they're created?  I do
> something similar using Net::CIDR::Lite.  (I would never claim that a
> Perl script is the most efficient way of doing it, nor anything else
> for that matter, but it gets the job done. :)

cristian: you are basically proposing a kind of user space cache of
kernel nft sets maintained by the application which pushes the
rules/sets to the kernel.

I have also thought of that. it can get complicated though especially
when the sets are dynamic, with their entries expiring. implementing
performant timers in application is yet another beast to deal with...

On Thu, Sep 30, 2021 at 7:35 PM G.W. Haywood <ged@jubileegroup.co.uk> wrote:
>
> Hi there,
>
> On Thu, 30 Sep 2021, Cristian Constantin wrote:
>
> > ... reading large packets over netlink sockets just to count the
> > elements in the sets does not seem very efficient.
>
> Agreed.
>
> It seems to me that if you need to read what you've put in the sets
> for the purposes of some facility, then you need to store it in RAM.
>
> It doesn't make sense to me to try to use netfilter as a kind of RAM;
> as you say that will be very inefficient.
>
> Presumably it was you who created the elements, can you not simply
> store them e.g. in a Perl hash at the time they're created?  I do
> something similar using Net::CIDR::Lite.  (I would never claim that a
> Perl script is the most efficient way of doing it, nor anything else
> for that matter, but it gets the job done. :)
>
> --
>
> 73,
> Ged.
