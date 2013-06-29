From: Nick Khamis <symack@gmail.com>
Subject: Re: Dabase BAcked IPTables
Date: Fri, 28 Jun 2013 20:05:44 -0400
Message-ID: <CAGWRaZYeBkaVrY3YgmgZdi7oUb9jGOkwtCZSnNU0c31wssYkpQ@mail.gmail.com>
References: <CAGWRaZYZnq3bneKNdisrRAfk=9PvKD=cXVWN_b0ySVRMaPw9Dw@mail.gmail.com>
	<20130628231910.GE10741@harrier.slackbuilds.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=tZUT3BRVAuTlrKxMOK1Y6shz5z9jy2DnMIh0hfb2ICU=;
        b=V60XKMnlDQBKrcWtDY1yotnfgKFYwrRId03FmP+Y25HZis4kPF0KmdsS1x8xCDXZNh
         e1G7+HqJn9vS829/5m9Q1fL8lcJLwMGXD8xekCnJwjol6nUm71LUZ/yI1ilsUyrnscPd
         HpaFVVua9rvOItdf0rkqp5hANkxxkMwCpimnUlPDMVoBbbibB4alU//h5nO1SKHMkSic
         8FuNKeOBJi7bJQ6DQmyf5edeO4PNR6VO2dWt9PCSGGWUFZfMo3AUfzm+dzkxPePFjccD
         g0MTpuods+0+imCpS9rrSycWQidPwlHVSwvXsmiR3/zFdV/F9h37e+hLM3wLbmz8BEiM
         n5JA==
In-Reply-To: <20130628231910.GE10741@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 6/28/13, /dev/rob0 <rob0@gmx.co.uk> wrote:
> On Fri, Jun 28, 2013 at 11:01:10AM -0400, Nick Khamis wrote:
>> Is it possible to have a MySQL backed IPTables?
>
> No, network packets need to be handled in real time. Your SQL query
> would take too long.
>
>> What we are trying to accomplish is having our clients supply us
>> with a mac address (or ip), and we would let them through our core
>> network. This would be done automatically on our website i.e.:
>>
>> * User logs into the website, and provides mac address
>> * We insert the record in the database as an allow rule...
>
> Sounds like a job for ipset(8).
>
>> * Restart iptables?
>
> Restart? What does that mean? iptables is not a daemon.
> --
>   http://rob0.nodns4.us/ -- system administration and consulting
>   Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

How did I overlook ipset? By restart I mean ./iptables && iptables-save

Kind Regards,

Nick.
