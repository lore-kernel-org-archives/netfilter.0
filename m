From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: Contributing changes to conntrack
Date: Wed, 24 Feb 2016 18:13:21 +0100
Message-ID: <CAOkSjBjU3qEmHnkbP_bxxLX1GsFyqfUKbCJe3Ygtt1Hc8_QhVQ@mail.gmail.com>
References: <CAKJ7aR7bsKMbNZ4D0AaqoxyuhOv9dctzviR1tpGBLw4Df7GXqg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=a1Bt1Y58kD/Ik3rKAKuFBo+VIf6lrF/zUVG1JB1YsCY=;
        b=gO/hHBHhY/aDeMyxxDke6bdPfQRiF0LSXz4TORmuHoKPPE/bwQDfJ9HoVvvJJyqdz9
         3JIFXzBEGNW42qXYsQ22YuehVtxN0lQWmckhH/PWYUrIJSBxkg4u6eW37ILEVn84z+eb
         UF/0CAiBDZNMToxilgX2aW0/2YeaRr5kUkea/iDUeT099AKYM1dX/MsLB/JzJqEFLb54
         tQRB3E5erC+EyDpj+uZwSevZCj2+I/LZjqupE3vJfK7mWV2zseJsAhAiphX/uidzve3o
         A4kcIrvg384XO6Eg8gwqjxuOjYuURcppDqn1uRVoXrqrMioe8e+EbarpmyOpuDHRzcDU
         FQVg==
In-Reply-To: <CAKJ7aR7bsKMbNZ4D0AaqoxyuhOv9dctzviR1tpGBLw4Df7GXqg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Gadre Nayan <gadrenayan@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 24 February 2016 at 17:56, Gadre Nayan <gadrenayan@gmail.com> wrote:
> Dear All,
>
> If I wanted to contribute (not a major contribution, just few functio=
n
> which I recently added in conntrack for my project) code extensions t=
o
> conntrack, what can be the procedure.
>
> Who should I send to, in what format, how will it be reviewed and how
> can i follow up with the process.
>

Please submit the patch to netfilter-devel@vger.kernel.org in a proper
format, with a formal description and a Signed-off-by line.
The netfilter project uses same rules as the kernel project [0] in
regards to patch submission.

[0] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/SubmittingPatches
--=20
Arturo Borrero Gonz=C3=A1lez
