From: Ran Shalit <ranshalit@gmail.com>
Subject: Re: using PREROUTING to change destination
Date: Tue, 14 Mar 2017 14:08:54 +0200
Message-ID: <CAJ2oMhKz612uEXA=GyUxWcEkocBMU1VaGLWt9CM2BDQH0LjTQQ@mail.gmail.com>
References: <CAJ2oMh+hJ30EYbMJqrWTBuPjkoimuYukdNtcGDaF0dhKw+w5DQ@mail.gmail.com>
 <30f19523390f4222a80fd8fb4150eb1f@CCDEX021.corp.corpcommon.com>
 <CAJ2oMhLpOJ2qAebiV6SMkA+bxJYDuEaJ5OpQvo20+U+N93=rMw@mail.gmail.com> <fd694cd0-4186-6d72-af78-3f23c06aedfd@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CS1vwDkdadz76zJVRLfFKhuGwn4HElahp/dLjFI0ivw=;
        b=oVYslxsxfqn/vye0CdnD4/AkTxJmM5/D0bxuy3viSZ0RSWs0XK4cMFRvCqLUxIok9i
         5DwkX/E+51uYtMSSn1yiwKp1uXrv8CYItMje/lATnyMmJsDpNirDBe0IgWLa5qZ4ZEWu
         BoMWoxbLYfsitlOvioIlnAvF1pLUj8DlzxsI9nStrdQ5aillW+8vKIvPsj47eiHuZ5bQ
         GJqW84l/rSdBAXjRe/Lldw2aOO0LAC6U0iDrV6I2cAeu/Fgz++x0HR9i85BWRQ8pLnA5
         VQQCMX0jEwYv6vkReh/1VaLpRP9pQA8P1Ya7dDq9mNbQCCMnhXMXk2L9dWGyZPD/L0q7
         Qvmg==
In-Reply-To: <fd694cd0-4186-6d72-af78-3f23c06aedfd@pobox.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Robert White <rwhite@pobox.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Paulsberg=2DCsibi_=28IBM_Consultant=29?= <Andre.Paulsberg-Csibi@evry.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, Mar 14, 2017 at 1:29 PM, Robert White <rwhite@pobox.com> wrote:
> On 03/14/17 09:56, Ran Shalit wrote:
>>
>> I understand from your reply that REDIRECT rule for the destination
>> port will change the destination port, so that the real
>> destination(=3D"final destination") is in the packet header  (and there
>> is no memory for the original destination any where else).
>
>
> REDIRECT is totally different from DNAT. Destination Network Address
> Translation sends the packet off to a different machine (well IP address,
> which could be another address on the current machine but that's _super_
> _rare_) so one might DNAT some packets arriving on your firewall through =
to
> your Web Server, and others over to your XBox witch is clearly never the
> same machine as your firewall.
>
> REDIRECT says "this service is here on the firewall, but at a different p=
ort
> than this packet thinks it would be.
>
> Here's a REDIRECT example.
>
> I want to run a web server. I decide to run it on the firewall. I don't w=
ant
> the WebServer processes to be run as root because if someone breaks into =
the
> WebServer I don't want them to have any special root privileges. A proces=
s
> needs to be a root process to take over port eighty because its less than
> port 1024.
>
> So now what?
>
> Well I create the web server user with no dangerous privilege and tell it=
 to
> use an unprivileged port (typically 8080).
>
> Then...
>
> iptables --table nat --append PREROUTING --protocol tcp --dport 80 --jump
> REDIRECT --to-port 8080
>
> So the web server user can now open and close 8080 as needed with Just Pl=
ain
> User=E2=84=A2 rights, and I don't have to tell the entire world to use 80=
80 instead
> of the default.
>
> And again the connection tracking system is going to do all the translati=
ons
> automagically for the connections after you DNAT, SNAT, or REDIRECT the
> first packet. So if you do a "iptables --table nat --list --verbose" the
> packet count is more-or-less the 'new connections' or 'new flows' count f=
or
> the rule. The connection tracker keeps the necessary records of what's be=
en
> changed for what so that you don't have to think about that part of this =
at
> all (in most settings).
>
>
> Again, saying/spelling the whole long-form arguments out is very helpful =
in
> picking all this skill set up more quickly.
>
> --Rob

Rob,

Thanks a lot. It is much more clear to me now.

Ran
