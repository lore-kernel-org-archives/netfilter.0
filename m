From: Richard Horton <arimus.uk@gmail.com>
Subject: Re: block network access for certain users/groups
Date: Thu, 29 Jul 2010 20:33:35 +0100
Message-ID: <AANLkTi=T0qzC5ptm+dyUh+Wk3Jk-X6mu65HMQ7bNoD_W@mail.gmail.com>
References: <op.vgmctfy22qajpl@imac.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type;
        bh=Qenkt16Yv9QI0wiGP5pm4gespgM1umoAfIL+VA8nWTw=;
        b=Kr3ZEIt3yPpsjzGg9FWk1Wai+g/CApQ7xsuhr2k9m5+2BeUDtdTurnFlVicJvdSMbX
         eiUc8Ozn/L2LCFiVziqwVRNBGvwxf2a2hHMkxzqsiRoAl2mqFRYIJU0YAm3arakw7jHZ
         RPCuHEzSY9VFVFs0iDuNsOygvsh19qKEp5ClU=
In-Reply-To: <op.vgmctfy22qajpl@imac.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Elmar Stellnberger <estellnb@gmail.com>, netfilter@vger.kernel.org

On 29 July 2010 20:09, Elmar Stellnberger <estellnb@gmail.com> wrote:
>
>
> I need to block network access for certain users/groups, fully:
>
> iptables -A mychain -m owner --gid-owner blockedusergroup -j DROP
>

Err... I know this is stating the obvious but your output chain does
jump to the mychain at some point doesn't it ;)

Also some apps remember do not run with the groupid of the person who
launched the application - gid-owner matches the *effective* group id
of the process.




--
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.pbase.com/arimus - My online photogallery
http://www.richardhorton.info
