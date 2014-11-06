From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: Linux Firewall Active/Active
Date: Thu, 6 Nov 2014 14:21:39 +0100
Message-ID: <CAOkSjBjSZYdunZamL7ukyOGnSWqqmhDfmpuAhBrqCAgso60a6w@mail.gmail.com>
References: <CADuigkVbB2nt5P6y-JCaW_bh6v_GhjL9BRBiHRyvA_yH81v4RA@mail.gmail.com>
 <CAOkSjBgMu_wdy0_oJ=yQqtYHeRz0yiTy1C-LO-qO3xiE0gPDCg@mail.gmail.com> <545B6CF8.9040603@heinlein-support.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=57gxqOuw+ZK7O5SXsE1a3YDl7BfsHerGY7CcRzI7H5g=;
        b=El0KUIQuJxHkFO6MPEcFwkXigYfdoG33y9/PfkTYuO+cyA8j338O0RYEWP6sbbLZ6c
         czp2gYhp9xTywI7D/5EHKhI+Ga6WFO3/jXOhfX5BTgnRG1jgcYBTdbxQcYQVSACWIkmz
         ha7HhQHOLdx7RjFzuo+xZXBvW1FjCBxV/3ay0lWmTgi/o+66dOrFWFiz+LkXOtiMcQB4
         Ao0HJrvZwnYMF7u+jF1r0bHAo9zRnDG5DbHJtbS32GH+xySsyfqWGOV4Dpx5uzHHtwuk
         6VhdmwlYwpdCycIa9D3gyd72ACpeKjdwYhdhGDEkT66spiA/Cu7CuTn5aDptdbuwD72V
         jHhA==
In-Reply-To: <545B6CF8.9040603@heinlein-support.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Robert Sander <r.sander@heinlein-support.de>
Cc: netfilter <netfilter@vger.kernel.org>

On 6 November 2014 13:43, Robert Sander <r.sander@heinlein-support.de> =
wrote:
> On 05.11.2014 21:40, Arturo Borrero Gonzalez wrote:
>>
>> I would recommend Debian, corosync + pacemaker.
>
> Keepalived easily outperforms corosync + pacemaker if all you need ar=
e
> managed IP addresses and routes in your firewall cluster.

Maybe, but is not the case. He needs squid and other things.

I prefer using corosync + pacemaker better than manually write a bunch
of scripts to manage the HA of services. Is more scalable and robust
from the 'services in HA' point of view.

--=20
Arturo Borrero Gonz=C3=A1lez
