From: Ricardo Klein <klein.rfk@gmail.com>
Subject: Re: Dabase BAcked IPTables
Date: Fri, 28 Jun 2013 12:12:02 -0300
Message-ID: <CADuigkUCfERrvP3cM_nXPiP-27MP3FPRdf0rzPVNSqDEJ3YQMg@mail.gmail.com>
References: <CAGWRaZYZnq3bneKNdisrRAfk=9PvKD=cXVWN_b0ySVRMaPw9Dw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=lgZU2wdanSKlfoOmOierGMx9ZaV5ce7zFzoefNiU5+A=;
        b=yc/pqNa+ZMA9EZeaHTHyFReCCJjVVqgSIPzqql6RiDcKR8ysBTe2JEq48PaeuQO+TE
         k3CMTZaTqTA3of2CHSS8HV7dG4OSOVQ8A17EUpuYXBdXju9lMqThp7JLZn+FCuQ0w1YH
         WX6AD/ZFjOLfvT4+BTFt/KSOZTEg5CzHbXl5/dTDLRWvkAumFbnK+6Gwwe6qbdS8CVAi
         36FCjO1fX1qRkdLA/qNboa4tnxXMdsQsfuXUG5tO1QYXyQOXx2D12l9jAQG3w1AxduCr
         gu57QuJZbSuPkSZiINuVlqk2vWR4Bpofhp57egOyD6Zop6jUUDoFxn8JkKAqhhUwIXin
         0M+g==
In-Reply-To: <CAGWRaZYZnq3bneKNdisrRAfk=9PvKD=cXVWN_b0ySVRMaPw9Dw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Khamis <symack@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

I think someone is already working in a ipset module for that.
We need that here too...


--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com


On Fri, Jun 28, 2013 at 12:01 PM, Nick Khamis <symack@gmail.com> wrote:
> Hello Everyone,
>
> Is it possible to have a MySQL backed IPTables? What we are trying to
> accomplish is having our clients supply us with a mac address (or ip),
> and we would let them through our core network. This would be done
> automatically on our website i.e.:
>
> * User logs into the website, and provides mac address
> * We insert the record in the database as an allow rule...
> * Restart iptables?
>
> Kind Regards,
>
> Nick.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
