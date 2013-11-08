From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: A question about routing cache (for load balancing).
Date: Thu, 7 Nov 2013 21:39:16 -0300
Message-ID: <CACuyg25OkrrcSngu9MCUT3vwvQ87L7Y_HCaXvBkY80Hb2jWoqw@mail.gmail.com>
References: <5278501B.4040406@ngtech.co.il>
	<CACuyg26oOJY7puRHkH9ZZC5QM--H=EBvZuAGk34WxBTS2mNzpQ@mail.gmail.com>
	<527BC564.1000008@ngtech.co.il>
	<CACuyg25xzoDS7wMyc8Ah=ZpoEvRoqbwgMMwA-vtetFFRU0Q9Wg@mail.gmail.com>
	<527C0E1A.6050003@ngtech.co.il>
	<CACuyg25VT0RF7aC9Kdi2ehwjvzP2PBjn2_o=nNpgBnBtQcJ7XQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=AloxkLEWu5YmwlEvPi32h2cpILryUNnesxayoPjq0vM=;
        b=P4vbK22wFOSnwD1v06L+nPKUYY3CrTbOLC41dfK4dfUT5gxmQs/LbnKZf717X8DKFo
         TkziRBPTHQsfr+nJxDpdlNNMwHCR+P1YwZ9p0tUAXPlpaprwCfVh48G7+PYOeoza6HFw
         uieP68PbdCbkWTjYySwGZ+QOXCTyEK+0tJae1e/QW+s9q3tlBcCZpfG+oPhaK6iGfAGk
         0jANQCHHIqUYiV9tFzdy2u457hgdSK+VhAD9ThJJXifzV3s6rPSwRHzYzhhXQhLOmqlL
         CSNIBWVIjM99tz3Wgy5B6uJARzwlIbrWSMBUaaX1d5xss0J7s0nGyV5E1aSwV2RqQHCa
         i5uQ==
In-Reply-To: <CACuyg25VT0RF7aC9Kdi2ehwjvzP2PBjn2_o=nNpgBnBtQcJ7XQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eliezer Croitoru <eliezer@ngtech.co.il>, netfilter@vger.kernel.org

You're talking about this:
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D89aef8921bfbac22f00e04f8450f6e447db13e42

I will need to research about it too.

2013/11/7 Humberto Juc=E1 <betolj@gmail.com>:
> And another doubt
> How do you select the alternative paths... It is under the fib contro=
l
> (only route rules) or using fwmark (or mixed)?
