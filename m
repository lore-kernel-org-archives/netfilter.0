From: Ricardo Klein <klein.rfk@gmail.com>
Subject: Re: Dabase BAcked IPTables
Date: Fri, 28 Jun 2013 21:00:25 -0300
Message-ID: <CADuigkVsbOfWBp9fSfnN6FPdnpbkYunaTAj-jy_VYrOrPZumzg@mail.gmail.com>
References: <CAGWRaZYZnq3bneKNdisrRAfk=9PvKD=cXVWN_b0ySVRMaPw9Dw@mail.gmail.com>
	<20130628231910.GE10741@harrier.slackbuilds.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=ld3RsWkkgF7JVjgsfjRLMWsL2HaJw82XugZ9QycBFg4=;
        b=itz4BqoyGzGu28xwRI21vwwQb5VME9FQEGOxZLnPybNA+Ok5V882OonfE8jdkPLHYS
         9I/asjQYDTr3Wq9+MxivI0mFrsL8/1ur9Gh8vjoPfytvCEp6Shh3RIjXwgvAo3PRILdE
         uOdt+mG8n84HWbJPtK/rzDecZvJXStTrd4l82MhRrf52v17A+wT8LHEQMVmy8M9For4l
         7/Ui5rfLhwPcvio+V3ROj2u2luAaOZ9SFPXZbQC9gn46M+/f5coM8MZsAkRYnMVa43/V
         39GlgHxn+YD1QFiLBQEHA+wiZIJeXcuhu/WYs0HDYXRRfyicWiZQJqZtEEzB/GvWK0Rl
         apBQ==
In-Reply-To: <20130628231910.GE10741@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Rob,

do you know the actual status of ipset "mac only" module? Someone has
told me that it is being developed...
I tried to make this work with mac_ip module and using "0.0.0.0/0" to
match the mac address with any ip, but, it didnt worked...
--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com


On Fri, Jun 28, 2013 at 8:19 PM, /dev/rob0 <rob0@gmx.co.uk> wrote:
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
