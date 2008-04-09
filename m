From: Minh Cao <minhcao123@yahoo.com>
Subject: RE: Iptables Rules
Date: Wed, 9 Apr 2008 10:01:00 -0700 (PDT)
Message-ID: <401296.6393.qm@web82604.mail.mud.yahoo.com>
References: <alpine.LNX.1.10.0804091153100.4411@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804091153100.4411@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@computergmbh.de>, Ukeme Noah <ukeme.noah@gmail.com>
Cc: 'Minh Cao' <minhcao123@yahoo.com>, netfilter@vger.kernel.org

Thanks for your help !

Please explain why these two acting differently.
On #2 I can login as anonymous, but ls.
Can I combine two rules into one ?

1/ 
-A INPUT -m state --state RELATED,ESTABLISHED -j
ACCEPT
-A INPUT -m state --state NEW -p tcp -m tcp --dport 21
-j ACCEPT

2/
-A INPUT -m state --state NEW,RELATED,ESTABLISHED -p
tcp -m tcp --dport 21 -j ACCEPT






--- Jan Engelhardt <jengelh@computergmbh.de> wrote:

> 
> >On Wednesday 2008-04-09 00:01, Minh Cao wrote:
> >>Hi, 
> >>Is that matter if I placed the options/extensions
> ( -m
> >>and -p ) in different orders ? 
> >
> >No, but it matters between multiple -m.
> 
> On Wednesday 2008-04-09 11:23, Ukeme Noah wrote:
> >Howdy,
> >The last two, the ones using the state machine
> might give you problems if
> >you use only those without specifying to allow
> established ssh connections.
> >
> >So, I'd suggest you add ,ESTABLISHED right after
> NEW to make the line
> 
> Adding random states to rules of which you do not
> have the context
> is unlikely to be fruitful.
> 
> --
> To unsubscribe from this list: send the line
> "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 

