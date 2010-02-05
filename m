From: Dan Daugherty <rescue@ddaniscool.com>
Subject: Re: IP Forwarding works on local port but not a remote port
Date: Fri, 5 Feb 2010 13:16:05 -0500
Message-ID: <81ed8b881002051016o2c2d2b1dk7569746e2257ea76@mail.gmail.com>
References: <81ed8b881002050747s73a79b0fqcb35ac2d15f3ddfd@mail.gmail.com>
	 <1265389890.3910.11.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=643VE/WEDWCAJwWxdFcu/MFcVd7Yn2YfZx7Erz7mBA8=;
        b=R8/Sq06IvFzZDYQL3utediW+plZP6LsUYJx7uxt/zsTkO2DZTy6gXnHnoZEBTFkg8W
         RjjqylpsiUIigTy935qiAPlZlqhseH2vAMMhLJRP7dAhuVw1FTlDiOGHaQWaq/hjEjfQ
         Z1MH6fdJ8tJbHc8aWKlkzNY0twarIbFcwMRS0=
In-Reply-To: <1265389890.3910.11.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Thanks. =C2=A0I tried adding the SNAT entry and it still fails the same
way. =C2=A0I need to enable logging to see where the packets are still
being dropped. =C2=A0I've never had to enable logging so I need to chec=
k
the docs and get some results.

2010/2/5 =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=
=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>
>
> =D0=92 =D0=9F=D1=82=D0=BD, 05/02/2010 =D0=B2 10:47 -0500, Dan Daugher=
ty =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Normally I wouldn't have a problem with this but I'm doing somethin=
g a
> > bit different than I would normally do.
> > I have a RHEL5 server with one NIC that is being used as a router. =
=C2=A0My
> > problem is that I can't seem to completely forward requests off of
> > this box using iptables. =C2=A0If I specify a port redirection to a=
 local
> > port, it works fine but when I specify forwarding that port to anot=
her
> > machine, it fails. =C2=A0I think the request is being sent through =
but the
> > response isn't making it back to me. =C2=A0I can have a clean iptab=
les to
> > start and only need to execute one command to make the local forwar=
d
> > work and since I'm not technically using the machine as a gateway, =
I'm
> > not sure if all the INPUT, OUTPUT and FORWARD chain commands are
> > necessary.
> >
> > 10.117.1.205 is the server in question
> > 10.117.1.203 is the server I am trying to forward to
> >
> > Working command:
> > iptables -t nat -A PREROUTING -p tcp --dport 1524 -i eth0 -j DNAT -=
-to
> > 10.117.1.205:22
> >
> > Using telnet to test:
> > telnet 10.117.1.205 1524
> > Trying 10.117.1.205...
> > Connected to -----------.
> > Escape character is '^]'.
> > SSH-2.0-OpenSSH_4.3
> >
> > Failing command:
> > iptables -t nat -A PREROUTING -p tcp --dport 1524 -i eth0 -j DNAT -=
-to
> > 10.117.1.203:1524
> >
> > Telnet never completes:
> > telnet 10.117.1.205 1524
> > Trying 10.117.1.205...
>
> The problem here is that no actual routing is being done because all
> hosts are in the same IP net.
>
> This is what happens:
>
> 1. You send request: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x.x.x.x:X =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -> 10.117.1.205:1524
> 2. Server is doing DNAT: =C2=A0 =C2=A0 =C2=A0 x.x.x.x:X =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 -> 10.117.1.203:1524
> 3. 10.117.1.203 is responding: 10.117.1.203:1524 -> x.x.x.x:X
> 4. x.x.x.x doesn't expect packets from 10.117.1.203, because it was
> initially connecting to 10.117.1.205 and drops the packet.
>
> For this to work you should also do SNAT:
>
> iptables -t nat -A POSTROUTING -o eth0 -d 10.117.1.203 -p tcp --dport
> 1524 -j SNAT --to-source 10.117.1.205
>
> This way responce packets will go back to 10.117.1.205 and then to
> sender:
>
> 1. You send request: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 x.x.x.x:X =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -> 10.117.1.205:1524
> 2. Server is doing DNAT: =C2=A0 =C2=A0 =C2=A0 x.x.x.x:X =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 -> 10.117.1.203:1524
> 3. Server is doing SNAT: =C2=A0 =C2=A0 =C2=A0 10.117.1.205:X =C2=A0 =C2=
=A0-> 10.117.1.203:1524
> 4. 10.117.1.203 is responding: 10.117.1.203:1524 -> 10.117.1.205:X
> 5. Server is doing unSNAT: =C2=A0 =C2=A0 10.117.1.203:1524 -> x.x.x.x=
:X
> 6. Server is doing unDNAT: =C2=A0 =C2=A0 10.117.1.205:1524 -> x.x.x.x=
:X
> 7. x.x.x.x gets legal responce 10.117.1.205:1524 -> x.x.x.x:X
>
> --
> =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=
=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>
>
