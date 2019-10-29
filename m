From: Laura Garcia <nevola@gmail.com>
Subject: Re: Named sets with timeout
Date: Tue, 29 Oct 2019 09:00:43 +0100
Message-ID: <CAF90-WiguQF4PfU=8jGBSeC+PrbizWj8hXNAUQUkzOpsoLcYjA@mail.gmail.com>
References: <cd3973f01a86ebc50a7fae9da40f29ce@mailtower.de> <87wocowgab.fsf@goll.lan>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tvKhNiwa0VQanzW3JUBVSqyRx9TjCZal9CNthcDwSDw=;
        b=PHPCq1cT9hPFCbrJ4VMMzHOl3pHxo1qKuSS1JITsbbOE0ceTF1HNBbLFxKAKCndumd
         SjJk+uZE7Pzswi1gmINsDsGvzpwnk6lBO1JjWwQWPlrjMRoqtpDoWCKR8IpWYahZH5SJ
         rZiEVemku40qWs1kgcf+75JfOxLxNvbjAq/+zM73jvlVJDSdkgoPqdp3Ix49awRFp8Er
         Uu7gkcKMYNeDD6dVa0ahWbPCDQ5UT4pdlQwhTxwXf9KFqkgB+D9QZPaA9LiEudYSSUKS
         bg4EIL4W74nIAzoFNYSPYwG/rHaMugIy9dnK6rwdoox5kAyANFq+DlNW2yVhckl6t2JZ
         GlBw==
In-Reply-To: <87wocowgab.fsf@goll.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Trent W. Buck" <trentbuck@gmail.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Tue, Oct 29, 2019 at 8:00 AM Trent W. Buck <trentbuck@gmail.com> wrote:
>
[...]
>
> I think you are right, but see this recent commit (in 0.9.2+):
>
>     24f33c7 2019-06-17 18:15 +0200 LGL
>     src: enable set expiration date for set elements
>
>     https://git.netfilter.org/nftables/commit/?id=24f33c7
>
> ...which sounds like there is a new (as-yet-undocumented?) keyword for
> changing (as opposed to initializing) the timeout of a set element.
>

Hi,

No new or undocumented keyword, it uses the already created syntax to
dump expiration values in order to modify it. Please refer to [1] and
[2].

As Duncan states, "update" is what you're looking for. Please check
the first example of [2].

[1] https://wiki.nftables.org/wiki-nftables/index.php/Element_timeouts
[2] https://wiki.nftables.org/wiki-nftables/index.php/Updating_sets_from_the_packet_path

Cheers.
