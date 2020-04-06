From: Laura Garcia <nevola@gmail.com>
Subject: Re: extending element timeout
Date: Mon, 6 Apr 2020 15:31:38 +0200
Message-ID: <CAF90-WjOvBq4HKQpFvWfu6oESsU=_H=WQ3fL7QHLKUv5Te1-Mg@mail.gmail.com>
References: <CAF90-WiP8pzgXaZB8cE5qkhD6nAtoPrazNLsvkHMBnm4APnpcw@mail.gmail.com>
 <20200405182926.8B32F3651C3@zimbra.mdabbs.org> <CALiBZbwtDbmJbeecWDthpoZ82sS+Oa2t6=7N5D=Lhnthy4q2Nw@mail.gmail.com>
 <CAF90-WiftiMPB1dJX+c4TkmU7a9=JkUJPBsCScpXN1BNXDyyLQ@mail.gmail.com> <CALiBZbxh-zMF4XBc+HcZeug1tNeq0rot71_y-qDiFtVuTp0oqA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+lG8HwrYw3daxhoMUNaD8hKZE/jRx6pQ46N5Q7f2wfo=;
        b=QbRQL/s8FYOJ/v3hbGmz1n+tqGwemDP6DwRQlH/us5Jx4X1ce4NpmbZEPWxYhc9ykW
         t8iAQRLR9IfTubkD0DIJh4hw3mT39IFW6klTnpRvp6lyts7xnToJ7lKCVZczvjXrJ/tJ
         81286vNmOcpGanbu4QgCu/tZFsbldppFAIMTeszEVuOyfcgtWCz/K370kYvtHDyMRmpQ
         XnLoz99bu38e48gZxMDxDYpDDnSlPNr19oJKNKXM+hIy4Ko07YUck9A2Hn8I5zdy9Njh
         jwPLf2rzfICzvbZqx9r1meXiYvwJynYvoeBq3hczI0m+45o2F4D0RpHuieuq+3vuQ4w/
         t98A==
In-Reply-To: <CALiBZbxh-zMF4XBc+HcZeug1tNeq0rot71_y-qDiFtVuTp0oqA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alvaro Leiva <alvaroflmiranda@gmail.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Mon, Apr 6, 2020 at 2:55 PM Alvaro Leiva <alvaroflmiranda@gmail.com> wrote:
>
> Thank you so much Laura !
> one last thing : this delete and and add operation is atomic?,
> ensures that no packet would be dismissed ?
>
>

You can do it atomically by executing them as a batch:

nft "delete element inet myfilter myset { 10.0.0.1 }; add element inet
myfilter myset { 10.0.0.1 timeout 7s expires 5s }"

Cheers.
