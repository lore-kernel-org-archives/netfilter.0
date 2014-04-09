From: "oatech" <oatech7402@gmail.com>
Subject: Re: /proc/net/netfilter/nf_log boot setup / persistence
Date: Wed, 9 Apr 2014 10:50:28 +0200
Message-ID: <7C01E827EED843848848C75555310BB2@PEGGYPC>
References: <001a11c16772e52ced04f661a84d@google.com> <0828E69AE2D243E4AFDB81850D33C0B8@PEGGYPC> <1396803104.21935.4.camel@ice-age2.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:from:to:references:in-reply-to:subject:date:mime-version
         :content-type:content-transfer-encoding:importance;
        bh=U5rZ1vc8nId8YKssYpmLXf7en0DGHamH6nSbCinM+WU=;
        b=wdDaTg7ss1MqWPy1vkmbuUGRbiUug74L84961P1L2JEI7Ij+bXSgIRu8LGb6vrbw69
         mZvkm+ga0Ki4ZUcCJxl7fS+l22Qk1T4JSRJtv/bvkNExHnnwO1LbtW1CYvRZ/EpO7AJj
         6EO15uqEWm3DIUfvv65gYOMhdIr8Q+XndG+ql4RKKFD/PK2b42WwnZy+daLf1eCia6lv
         QlTt5auW64rBugzSe9OvfZv0ne7VymdxnK4oTTVxgaRB5/9SWPp9PbOkFqaDGrKZTeEN
         pTYJafr3qfudYvOYi2FiKC9apO1BnBJg+6WXk+K/59OCPkGuh5KZ08cUMFObkf2byLtB
         /sGg==
In-Reply-To: <1396803104.21935.4.camel@ice-age2.regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	reply-type=original"
To: netfilter@vger.kernel.org



>Subject: Re: /proc/net/netfilter/nf_log boot setup / persistence
>
>Bonjour,
>
>On Sun, 2014-04-06 at 18:24 +0200, oatech wrote:
>>
>> Hi
>>
>> I manage to change the /proc/net/netfilter/nf_log flags using echo >
>> /process/sys/netfilter/nf_log/ ...
>> ( For IPv6 nflogging )
>>
>> But it gets deleted at reboot.
>> Worse, using a boot-time script fails ( the flags get overwritten )
>> Using /etc/sysctl.conf doesn't seem to work.
>
>I fear your firewall script is running after sysctl.conf settings are
>installed. Usually the firewall script is triggering the loading of
>logging modules.
>
>> I end up using a 1minute cron job that rewrites the flags each minut=
e.
>>
>> Is there a better way ? Or a sysctl.conf kind config file ?
>
>The most handy way can be to load the Netfilter modules at start For
>example by putting them in /etc/modules (at least for debian). Then wh=
en
>sysctl settings will be evaluated you should get a working config.
>
>> Thanks  :-)
>
>You're welcome (if my suggestion works) ;)
>
>BR,
>--=20
>Eric . <eric@.>

Hi

Thanks for the answer
I'm not a Linux Sysadmin ( I'm a network admin mostly, just using Linux
networking daemons for learning ) so I tried
your suggestion but got confused.
I'm Using Ubuntu Trusty Beta ( almost Debian so ).
I did found /etc/modules and try to play with it, but just managed
to breack the whole nflog thing : cat .../netfilter/nflog went totally
emptied.
Did reinstall thus ..

Please could someone help me precise what would need to be :
1) in /etc/modules
2) in the firewall start script ( just the main lines ... some modprobe=
s=20
maybe ?
=2E...)

Thanks


---
Ce courrier =E9lectronique ne contient aucun virus ou logiciel malveill=
ant parce que la protection avast! Antivirus est active.
http://www.avast.com

