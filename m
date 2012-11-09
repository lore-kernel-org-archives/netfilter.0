From: T L <tl196108@gmail.com>
Subject: Re: Ebtables NFQUEUE Support
Date: Fri, 9 Nov 2012 11:07:55 +0100
Message-ID: <CAGvFV4v=DK7PJDieMJ1ngqtrAF_pNbnbBQQjgLQTDaW5tuNo-Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=1RuTYToReWBQUMTsWUVL8EoNfI1b2tiQce+9aZkYGMA=;
        b=H7xCqbJ43cELcULFgXUd1AwK0IlQqGKa0Ht5OLk/vlbieDdfgJsMvfKi3Sdsr58VG+
         oZAzyS3W8mknzuhpN5pygT73wUDDE64pkYA3XAXpBrUnRPFgxIcpvaa15abTmGn3iH/j
         jIQd2577QgHWF6Z3TKdJEcD/eAgD6pgxnxjp4ogOgqbVdrL9ObYLAWbFFfRGEUb4/5hh
         gTWxNaiNz5JmXaJ1NUjj9qIOGn6zeNUCICz0bl+ejPdruxy5PTPIEaU4yH+G5gpSCxLz
         e6o97q1gqyP5s+d7hcbdFbVHYj0EIFhTc1+Bc7yewqVda5sSfV49OLmPGnpOQ+qsZCcX
         Scxg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Great!


I would like to try it out and have tried to apply both patches to
ebtables-v2.0.10-4, but not succeeded.

I can't figure out what to do with ebtables.c, the diff seems not
towards the 2.0.10-4 version.

Could you provide a new patch to 2.0.10-4 version?


/Torgny
