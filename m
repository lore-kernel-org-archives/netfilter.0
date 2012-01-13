From: Anton Melser <melser.anton@gmail.com>
Subject: Re: Simplest failover solution for iptables firewall (router)
Date: Fri, 13 Jan 2012 21:15:04 +0100
Message-ID: <CAKywjPqQyznfSJ8iyZffosWP9oXrCK+8sP8o4fKsxeqKAeq_Eg@mail.gmail.com>
References: <CAKywjPpp3xsP=Rkvnfxo_7T-5xcZZuuzqSWy6M8u4bqX0C-KOA@mail.gmail.com>
 <Pine.LNX.4.61.1201101605190.24418@soloth.lewis.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=Z+/iXLZNYaj6TEKn87KuJvorvNp+01h+ziG8GF0Qebw=;
        b=xWrQ3H2nngT/6yGEEwDRN6iR3Prb5Z7jjAvS1gS8FEvvJAdtf25JzEIz3OY74YSLQi
         CYyt2oA4DC0dtBQP3Sfqnn2qm0h1PigAsfqqQuB1FjLhWjzljqDrWDMeQkYIfOoGGXg1
         xxdvhv5ePWxeVzAMz8UGvZL+4L1Q4v0OioQCY=
In-Reply-To: <Pine.LNX.4.61.1201101605190.24418@soloth.lewis.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jon Lewis <jlewis@lewis.org>
Cc: netfilter@vger.kernel.org

=2E..
> Heartbeat can do this. =C2=A0You'll want to setup something (could ju=
st be a
> shell script either run by hand or by cron) to rsync certain things l=
ike the
> iptables config to the standby FW...and setup a cron job on the stand=
by FW
> to restart iptables when necessary, i.e.
>
> # has iptables been updated?
> * * * * * root test /etc/sysconfig/iptables -nt /var/lock/subsys/ipta=
bles &&
> service iptables restart
>
> Setup properly, if FW1 dies or loses its uplink, etc., FW2 will take =
over,
> and open connections will be lost, but other than that, life will go =
on.

That's perfect.

> I've been using the old heartbeat (comes with CentOS/RHEL 4/5.x) for =
this.
> As of 6.x, heartbeat is deprecated and you're expected to use pacemak=
er
> instead.

Perfect thanks. I'll give it a try this weekend.
Cheers
Anton
