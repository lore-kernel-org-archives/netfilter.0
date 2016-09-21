From: Lee Burton <lburton@mrow.org>
Subject: Re: Invalid argument on 1.4.4 w/DisableExternalCache On (Kernel 4.7.4)
Date: Wed, 21 Sep 2016 03:30:22 -0700
Message-ID: <CAMJqGp6NwbrdcyitkY=XnS3MP4=y4RK9+XAuy0V3u_yhNhEt-A@mail.gmail.com>
References: <CAMJqGp6c2SaAb=nrCaxPVVx3_yD+RvNwmxsqW3tLRGFBSFnB1w@mail.gmail.com>
 <CAOkSjBi9MzyYEnA3526Dq=QKsS-aPg5SCGLZkzwh0MNd+c=Qqw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mrow-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Tp7C/iGCSQhvuAXbjhFYrISyCPNHG7P5ckMzc33XB0Y=;
        b=CdLtkDgi5IaoH0o/5i0pAtzt7aXYbsMri0EcNOadJiq/aQKjyAm7YJKoKEpKRzsPGJ
         HS6PRQJ1UZtiPEmCGuHzViB0omdUkkKlJATQfFK45Yq+6mTOvWp88MKvA28yH2inYpv/
         6aGboZxRmjMIjEjF40lJSeUp601xA7nEFvi2PFb08cfFib9m+yLMmBFoNddMrYz/WWJp
         itmaWu/kMIfGMUxpHD+kj2hj5ev3aC9wNvJr7FSGKyJKBx4UIcEurOTpFtAuBnm/Nowp
         7r42wLAHuBxWHQ/Crc/ysSyuvzz8Stub15zhNq7GWew9WJTKP1kWoo5sSL8BrgHnF3Fy
         aYJQ==
In-Reply-To: <CAOkSjBi9MzyYEnA3526Dq=QKsS-aPg5SCGLZkzwh0MNd+c=Qqw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

It's not a custom kernel just Archlinux's standard kernel -- config:
https://paste.pound-python.org/show/n9iDruPANle9wi7szQkX/
lsmod: https://paste.pound-python.org/show/j4zCGcsKywUdrKpWqVSV/
config file (mostly borrowed from somewhere):
https://paste.pound-python.org/show/FqXslDwXlhn50jBKA6Tk/
I believe the traffic to be fairly normal.. I don't see anything
non-local when running conntrack -L on a machine so it looks like it's
all traffic having an issue?
Thanks,
Lee

On Wed, Sep 21, 2016 at 3:19 AM, Arturo Borrero Gonzalez
<arturo.borrero.glez@gmail.com> wrote:
> On 21 September 2016 at 12:00, Lee Burton <lburton@mrow.org> wrote:
>> Are there known issues with DisableExternalCache currently?  I was
>> trying it earlier and got a ton of:
>> [ERROR] inject-upd1: Invalid argument
>> [ERROR] inject-add2: Invalid argument
>> etc
>> A quick strace looking @ sendto,recvfrom of what libnetfilter is
>> sending is @ http://pastebin.com/XFSs5cQ6
>>
>
> Hi,
>
> any idea of what kind of traffic is triggering this?
>
> I would like to know a bit more about your environment.
>
> Could you please paste the complete conntrackd config, plus the kernel co=
nfig?
> Is a custom kernel?
>
> regards
> --
> Arturo Borrero Gonz=C3=A1lez



--=20
Lee Burton
lburton@mrow.org
301 910 0246
