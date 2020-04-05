From: Laura Garcia <nevola@gmail.com>
Subject: Re: extending element timeout
Date: Sun, 5 Apr 2020 19:59:06 +0200
Message-ID: <CAF90-WiP8pzgXaZB8cE5qkhD6nAtoPrazNLsvkHMBnm4APnpcw@mail.gmail.com>
References: <CALiBZbyqkMp4BWrTsS7EWB9COZr=Hj230xQL2rrCOGdRP0tAjw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6gAqGMq7PDmnhiShRKef53QOmxZPftXNM6VqgAEtFSE=;
        b=XgeNssdMPRy7gxAjtgzaZpLDDT/ZXFmRi8VT+lWqLY+/0gcPTvrlFxF1xs1ft6x0Kd
         joqunPg8mb2npZ/oEP3ASGztkez468VtvMHIh1nGOCSBe6D9Vbed3GMuVmyiWp1MHEtR
         afi/1qY4T6UmgysNMvt1oCE2+GnA8RDZEKK0Z4ciwnMEnL2gSSvMysC7KUXGgV6RlXWm
         xVGN0k0beAYXWRJesndjmfys6kwI2nb18d8s4Ipq3JF3UWkZY7Mrx4jBB+ZpjKWjhRhe
         V770qdmlfTQBRqOC/uMM5pucbF2A3SpSZ5elqHFBL36AhGCkbCgP+AajBhFpWyV2t3h9
         HK8g==
In-Reply-To: <CALiBZbyqkMp4BWrTsS7EWB9COZr=Hj230xQL2rrCOGdRP0tAjw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alvaro Leiva <alvaroflmiranda@gmail.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Sun, Apr 5, 2020 at 3:21 PM Alvaro Leiva <alvaroflmiranda@gmail.com> wrote:
>
> just have a simple question, someone knows if its possible to extend
> the timeout of an element in a set (with nft)?
> thanks in advance

Hi, it's only possible updating the element from packet path.

Please refer to the _Element timeouts_ wiki page [0] for further details.

Cheers.

[0] https://wiki.nftables.org/wiki-nftables/index.php/Element_timeouts
