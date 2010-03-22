From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: two default routes
Date: Mon, 22 Mar 2010 12:48:27 +0000
Message-ID: <56378e321003220548p4661d205j69edf31bc9212a78@mail.gmail.com>
References: <cfeab66d1003220335y1020f343u14097acc1ee50c09@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=VYZK+YM3UsBK5iR9DtPJ1bydpaz2X1xMMZiMxvuS6ts=;
        b=vfLmtZH1mLo+nSbsUU0tA0ydYpfSWtE+MKFCsKm/ITaTbPAOL0hPgMlvRvKdvQv87B
         x1QZoPFlqgdtRDhEYJmg8SCoQXNy7nji+P33/L4XZstxJrTigYlHeAJGEHJ70/DcUyd+
         68vuXUc/YytzvtSqcgYGVOERgq5Pk/BUSfiIU=
In-Reply-To: <cfeab66d1003220335y1020f343u14097acc1ee50c09@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

On 22 March 2010 10:35, ratheesh k <ratheesh.ksz@gmail.com> wrote:
> Hi ,
>
> =A0i have two default routes =A0, I used below two commands to add ro=
utes .
>
> =A0route add default gw 192.168.1.1 =A0dev eth0 metric 0
> =A0route add default gw 10.232.18.5 =A0dev eth1 metric 1
>

Without using rule based routing (part of iproute2) I don't believe
this will do anything - only one of the two default routes will ever
be used unless the eth0/eth1 interface itself changes to the down
state in which case its associated route should be removed.


--=20
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Fo=
rest Cats
http://www.pbase.com/arimus - My online photogallery
