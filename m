From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: dst nat failover only while port is closed
Date: Fri, 13 Mar 2015 08:52:32 +0100
Message-ID: <CAOkSjBh+iMWtJwrbDQ9jMFUxUuaCPoYvp_6Qk54PA70Z2BZghw@mail.gmail.com>
References: <CAPhFQCvTHxvx+aExK1DkxutqONq-67ypApKUowQdFyj6fvbvfA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=HFsjPsQY7CBempmfZ9FgFAqLx4FDWLSN7Y6yF375jrM=;
        b=G9GRcc1SIWj1BEvBYdysMtamW+y4HhB9ExheMZXKLJxNQJbEJhhkLhqczTFIn2a/RH
         Vr3pF6P5ypeGyfDqG054tFR5s0U/ZPBfFqYsDGiInHCNSwqQjVFFZOZfXnugW1otrp3Y
         hDN7QaDk/rqmEotGa3x5pXXIOg2ySmov/cFUCe8ElvGsk9Wa4CYreAOEMoLkdAWoJuX9
         bMSvZVQCYtddq3cqCJTvBlIoWKnZVDVvJxNQOWUi7LFOJ2iu40CIHPPbQChHbXDBpA6a
         q/Up/P18HHkBe3eMbZOhBsnlyTu+RVr4tEFnkoUW41BaFL08V8cfbyiLWs5XUeVH1jK/
         afxg==
In-Reply-To: <CAPhFQCvTHxvx+aExK1DkxutqONq-67ypApKUowQdFyj6fvbvfA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Stefan Certic <stefan@cs-networks.net>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 13 March 2015 at 04:15, Stefan Certic <stefan@cs-networks.net> wrote=
:
> Hello World :)
>
> I am interested in following scenario with iptables (if such is possi=
ble).
>
> Setup:
>
> 1. Ext Firewall nats port Z to server A.
> 2. Application X listens on port Z of server A
> 3. It happens that application X crashes for a couple of seconds and
> get's restarted by a monit.
>
> Question:
>
> Is it possible to perform Nat on server A itself, to server B, that
> will took place only until application is restarted (only while no on=
e
> is listening on port Z) otherwise expose port Z to back to
> application.
>
> Reason:
>
> The idea is to provide a failover, uninterrupted service even when ap=
p
> crash occurs.

I think this is what LVS does.

You can configure a loadbalancer which listen on a virtual address.
Then, you have several real servers in the backend. The LVS can do
health checks and deliver connection to real servers in the backend if
they are alive.

Your "firewall --> server A --> server B" architecture seems very weird=
=2E

best regards.

--=20
Arturo Borrero Gonz=C3=A1lez
