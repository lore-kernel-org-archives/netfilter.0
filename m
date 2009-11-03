From: "fakessh@fakessh.eu" <fakessh@fakessh.eu>
Subject: Re: HTTP Access Blocked After iptables Update
Date: Tue, 3 Nov 2009 22:06:17 +0100
Message-ID: <200911032206.18489.fakessh@fakessh.eu>
References: <9A16A4503EA74DCAAF2C8A53A0DBF60F@RomoPC>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fakessh.eu; h=from:to
	:subject:date:cc:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:message-id; s=mail; bh=h
	8DjeLIoqMGhUEhIYvcJv6nzN4s=; b=dIZ8KsAlOe522nJr19ek1hQNPkyee6j8z
	3UgRSMgiiPVdbzDjuwdS2BExQPk17Eig5JZOyXmD8vSuMHLrokRQvU+fFHZG+CAd
	iLxmMcTEUC+3DRPg6WZMwJu7i9tEpYOqLFPVyCGiabqudfULphi5/MWvkNCeWH5g
	fABw5KbpS4=
In-Reply-To: <9A16A4503EA74DCAAF2C8A53A0DBF60F@RomoPC>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: JR <jdnromao@gmail.com>
Cc: netfilter@vger.kernel.org

after upgrade iptables via yum on my box Centos 5.4

I did not encounter such problems
described in your post

iptables work fine on my box

Le mardi 3 novembre 2009 20:23, JR a =E9crit=A0:
> Hello!
>
> Today I updated various things in my production server, one of them w=
as
> iptables (via yum)
>
> I'm running CentOS 5.
>
> 1) After the update I was not able to access any site hosted on my se=
rver.
>
> 2) I try to stop iptables and than I gain access again.
>
> 3) Than I've started iptables and no access again.
>
> 4) I rebooted my server.
>
> 5) After the reboot I verify if iptables was active, it was and all m=
y
> sites were accesible.
>
> 6) I've restarted iptables.
>
> 7) All sites went down again.
>
> 8) Rebooted my server and sites were accessible.
>
> 9) iptables was also running
>
> Basically the problem is, if I restart iptables, I have to reboot my =
server
> because my sites become offline.
>
> So, what can be the problem here? Any ideas?
>
> Help is highly appreciated!!!!
>
> Many thanks in advance.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
