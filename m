From: shawn wilson <ag4ve.us@gmail.com>
Subject: Re: Linux Firewall Active/Active
Date: Wed, 5 Nov 2014 16:45:01 -0500
Message-ID: <CAH_OBifYvkOK-RqS76ODT2En1r0bN99oU8cCQFJdDE7CGH67_g@mail.gmail.com>
References: <CADuigkVbB2nt5P6y-JCaW_bh6v_GhjL9BRBiHRyvA_yH81v4RA@mail.gmail.com>
 <CAOkSjBgMu_wdy0_oJ=yQqtYHeRz0yiTy1C-LO-qO3xiE0gPDCg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=H6p5UucnWvBk8ybb550CGIAL0/AjEGnT/xGhA+kwRN8=;
        b=jnOyqJXJeklXrhV+tW0qeJ5WzSlg0n4OpK/0bNlZW/zLJKaM9UyImyoGWSpWnlpPTX
         Om6U79EcHUB17BSkamkCANEhfwCejrtVpSpllBQ+xA0XXklnESUxoWrpd+NrSgCop3/v
         eXdGXZXdxg6Mc2Kfx0y56oXk4sqLGYBGBKNajRy1ImrI5/81E5+qY78YyfffKmLBtrQN
         3K2dEtzmLYpcvb4/Db+mC8oUDBECR1d6VY/qLZg9IfBNw19w/ZzhbBwqecWF3p6J1/uy
         UIe7f8Wx/+IaNuPQEN/ce6v/MToqNI7JnIQ7+fZecqCh7jDJNBcuLuROGKbVDdu09IEh
         T+tQ==
In-Reply-To: <CAOkSjBgMu_wdy0_oJ=yQqtYHeRz0yiTy1C-LO-qO3xiE0gPDCg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Ricardo Klein <klein.rfk@gmail.com>, netfilter <netfilter@vger.kernel.org>

So I was thinking to use tc on the second box to delay the second
packet and it should be dropped by the destination (really bad way to
do it) but a quick google gives this:
http://parkersamp.com/2010/03/howto-using-linux-as-a-simple-load-balanc=
er-nat-router-firewall/#more-123

That said, idk you can actually do what you want within linux (I'm
pretty sure firewall vendors that support this either do it very badly
or have custom code)

On Wed, Nov 5, 2014 at 3:40 PM, Arturo Borrero Gonzalez
<arturo.borrero.glez@gmail.com> wrote:
> On 5 November 2014 20:15, Ricardo Klein <klein.rfk@gmail.com> wrote:
>> Hi there,
>>
>> I need to build a scenario with 2 linux servers (probably CentOS7)
>> acting as active/active firewall servers. What tools should I use?
>> I saw some articles with:
>>  - conntrackd + keepalived
>>  - conntrackd + corosync + pacemaker
>>
>> But, what is the most used/stable?
>>
>
> I would recommend Debian, corosync + pacemaker.
>
> I guess an active-passive cluster will do the job.
>
> Setting up an active-active firewall cluster is very difficult and
> presents some challenges hard to face (like proper statefull filterin=
g
> in two nodes simultaneously, and a consistent ruleset management
> between nodes of the cluster).
>
> --
> Arturo Borrero Gonz=C3=A1lez
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
