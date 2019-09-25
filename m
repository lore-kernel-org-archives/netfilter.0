From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: How is nftables + IFB
Date: Wed, 25 Sep 2019 17:37:19 +0300
Message-ID: <CAEzD07LBL8AQMJtOqB=OFTGnfPREFKnECJpqoiJDuJR7BFFGVg@mail.gmail.com>
References: <CALYzA8GZY1cJYsibQDOmA3DuUsV3d=KUdc6z04WgUxu-4Ya0jg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KAg4AC8j6Nbu19JqKwB62mUzPcJpHIbftQOpaGzV/7w=;
        b=itRvRqoszFpcnq3S0SvmWyWPAK9d8en+9v8ge+0wiZr9jkw2c0cAMZBLXweaxxs/kJ
         L/ghY8copHBD32RSGqvQWAjvYP5M0+enAUUqaCY8rWG/e7vsPxHe/DQSo89gkAL6Wo9p
         5oWzsHOzzFoCbVYY2iQhM/njlnC8uAtHq1gl0BgZ2HAzI/sXR0EED9atRuqxDgNFgpoY
         8Sax7ceSZbSmUAzoYyVrF+ftuh/JaklsmtBEtcKCAdwFbG/U5FCu9MbdlRhZyvBc+55h
         icIjFS9syXT/n8aVvV5j58qjVSgifgXmsmmn2b/KGoPyh11WtpRJdN1B/z+iri8f56yJ
         JpOA==
In-Reply-To: <CALYzA8GZY1cJYsibQDOmA3DuUsV3d=KUdc6z04WgUxu-4Ya0jg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Mok <a9121431@gmail.com>
Cc: netfilter@vger.kernel.org

Hi.
How exactly do you use the iptables + IFB for traffic shaping?

On Wed, 25 Sep 2019 at 13:29, John Mok <a9121431@gmail.com> wrote:
>
> Hi all,
>
> I have been using iptales + IFB (Intermediate Functional Block) for
> traffic shaping, How is the status of nftables + IFB (or its
> successor) ?
>
> Thanks a lot.
>
> John Mok



-- 
Anton Danilov.
