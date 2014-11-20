From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: Redirected packets being dropped
Date: Thu, 20 Nov 2014 08:58:52 +0100
Message-ID: <CAOkSjBiVfUKjeenCeKE7AkryCvKPEhiAS+dKpyJR6tjwPZBPig@mail.gmail.com>
References: <671BE3C4E5B04522B7149F6A8EAEA8BD@na.mvk.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=oVDPM3nrOvD79SCXhR+0UJzTLeP7TtI5ePfHfdPe58o=;
        b=snEQ7GrYW8b2qNrshnCdshd6q5Jkl4JG2osVGEqfb8Cg5sljJYYFoXOCkbpfXQfNHC
         s5yxFDVFuKA1/sHJMv3cf69Tmdxmgr+NND8q8tpfV9BYcyDalYGW+o9R7LDnrXUXVpsI
         bGn4WEJxgK1cXif9k/O6FGmTKXMiSByfGDHKxct8QzJMvIad6S4HYMxgEGceEVGkrliY
         vL7yO4hk1/hepwesOtVQtYTJdy6KPBXuyUI/31xl0cPLp1/qaDKyaP8bcE6IVGqK1Yi1
         a+Aq7SjrQ8uBc1QbC3ziHe9ZtCqQf32EPEaRmbJiyrLAApon5GPb+PDbc/9U63oWN0ub
         WoNA==
In-Reply-To: <671BE3C4E5B04522B7149F6A8EAEA8BD@na.mvk.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: karl@asl4.net
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 20 November 2014 03:34,  <karl@asl4.net> wrote:
> I'm trying to redirect traffic to a transparent Squid proxy.  The red=
irect
> works, but then the traffic gets dropped on the input chain of the fi=
lter
> table.  I can hit the Squid port (3129) directly, so I know my accept=
 rule
> is working for other traffic.  I just can't figure out why the redire=
cted
> traffic is being blocked.
>
> Here's the setup.  My Internet gateway runs both iptables and squid, =
so the
> redirect is going to the same server.  Eth0 is the Internet connectio=
n, eth1
> (192.168.2.254) is the internal LAN.
>
> I've set the nat rules like this:
>   -A PREROUTING -i eth1 -p tcp -m tcp --dport 80 -j REDIRECT --to-por=
ts 3219
>   -A POSTROUTING -o eth0 -j MASQUERADE
> And the filter rules like this:
> #8  -A INPUT -i eth1 -m state --state NEW -m tcp -p tcp --dport 80 -j=
 ACCEPT
> #9  -A INPUT -i eth1 -m tcp -p tcp --dport 3129 -j ACCEPT
>   ...
> #36 -A INPUT -j DROP
>

Maybe your problem is 3129 !=3D 3219.

--=20
Arturo Borrero Gonz=C3=A1lez
