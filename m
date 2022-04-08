From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: Error when using 'time' statement in nftables 1.0.2 rule
Date: Fri, 8 Apr 2022 08:24:50 -0400
Message-ID: <CANf9dFProONAntMU2mtKLV7dHHsOvsBVrm1N6x010Oqa6z73Nw@mail.gmail.com>
References: <CANf9dFMQO4mHXFd88BHL5u9BWyp-v-Tu2L6x_oS1OdMp8UrhhA@mail.gmail.com>
 <Yk/vi+/HGMjfhjpr@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=IZdrbeJNk6e4ELWWjEtMyHpOJYHfL4sREWmgdRJOCR8=;
        b=oqgq2YMwP24CNILYg2mwuuVT97IBaMi6SRy7Gnhd8uJ68zWzDdUegUQzzbzR07IqSw
         m1/XJZGgdiPC0PrwVYdvhK5mwsanVRoOmjj9gepPi4mL75Y5DRAFXYjymwYPnvxm4OQA
         I8TebONk7KshhmYZz+JO0c8CvP2540JEWd31irCB1P/Q/qHDp4X2NC8ljaCwgVeghZtd
         yJxI0PhNhYAUqLcN8HFAeexMKXtRliT/hVSkMANwHylxBSxdc8egFBsCyq8g8x2cHgp5
         0D86ClQ6qPtn9fYEoXeWinN34zNA+ScFi+yA7w/BjKWcU3GVdiwFz6rDiEDWW1Asd8WU
         YG9A==
In-Reply-To: <Yk/vi+/HGMjfhjpr@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> It appears to be a bug.  I shall send a fix.
> No need.  Somebody else has already committed one.

> I can reproduce it, this is a bug.
> I cannot reproduce it though with current nftables git snapshot (it's
basically 1.0.2 with a few patches on top).

Thanks guys.

By the way, I have just noticed that while this gives an error on 1.0.2:

    add rule inet filter input iif lo time < "2022-07-01 11:00" accept

This does not:

    add rule inet filter input iif lo meta time < "2022-07-01 11:00" accept

The use of 'meta' in front of 'time' works around the bug.

-Martin
