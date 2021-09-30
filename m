From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: nft set load metrics
Date: Thu, 30 Sep 2021 18:34:52 +0100 (BST)
Message-ID: <b943f279-73a-303e-3244-ed7fd4d4949@jubileegroup.co.uk>
References: <CANCV4NMrw5m_-DCwnFGahygVnMGuVnU-RouBCqOsg6QX7z4AKQ@mail.gmail.com> <YVXC5cPRHyaE3VRL@salvia> <CANCV4NP-9qTA+ehWNMT5-WEkomWkKrLWg30vcuEYaihs6a3sww@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        jubileegroup.co.uk; h=date:from:to:cc:subject:in-reply-to
        :message-id:references:mime-version:content-type; s=uk; bh=aSImv
        MrHacHtpSjWeym1yBlKvcHmY3xKAwJPZXwJVo0=; b=nLyqfirwV8KfNkR9K0sah
        2wfWKx9Bj8R9YzIEkwWy+JC6b8VxxPUG0RYnQ2tFtBIjEy2hK9i74IXDit1AwrDK
        uCDDkScBoIvdt47AcTciF6Af2mtBHvR7V16xH94fFTn1SyWPiiOSuMwIGnHRRI7/
        et9/CzRUe91sE+FrZlXAygXnlJHXogbwDgAG69hzveOdLmibPNobmS7HfEQPF8XE
        RXsFRGTvFs1muoYWUcVaG6ubPovpHvRF/XwU+enNwQjhqifEltU/BA/UltvFjFnw
        0VSwkkx87SNo0H6ykug0VPvE4Fh6z340cUQNMi77CvakI9McTNbeiQg/yeJlEnpD
        g==
In-Reply-To: <CANCV4NP-9qTA+ehWNMT5-WEkomWkKrLWg30vcuEYaihs6a3sww@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Cristian Constantin <const.crist@googlemail.com>
Cc: netfilter@vger.kernel.org

Hi there,

On Thu, 30 Sep 2021, Cristian Constantin wrote:

> ... reading large packets over netlink sockets just to count the
> elements in the sets does not seem very efficient.

Agreed.

It seems to me that if you need to read what you've put in the sets
for the purposes of some facility, then you need to store it in RAM.

It doesn't make sense to me to try to use netfilter as a kind of RAM;
as you say that will be very inefficient.

Presumably it was you who created the elements, can you not simply
store them e.g. in a Perl hash at the time they're created?  I do
something similar using Net::CIDR::Lite.  (I would never claim that a
Perl script is the most efficient way of doing it, nor anything else
for that matter, but it gets the job done. :)

-- 

73,
Ged.
