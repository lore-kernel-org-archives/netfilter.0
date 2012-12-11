From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: About cluster deployments.
Date: Tue, 11 Dec 2012 07:19:36 -0300
Message-ID: <CACuyg25y_0DHZumvdLUY0455t+AJeckNkYKmCmZj747C3S1vqg@mail.gmail.com>
References: <CACuyg27siFFNibqe4rZCQnUX0KGatmGscoKyA7ViCi1uGg=drw@mail.gmail.com>
	<E7E899956E6065488DBC6623F76F36A275BF60EA6B@RAMNL-EX02.Ram.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=FAztOVpomsPVxJEDSy9/bUxGZOU8PZ3rrbi/Gclm5eM=;
        b=NJGLE23KNJfLcMIAMsgOKkgufj9CQjFLgQT0iY6DA6ylwNYDioeLcrNFJbcJQyg3cL
         X1TO7au/f8QnRELW3OefxGS9Gt1TBa8lRegLR1/IB/1kPHbuvP424WGNzmx/3CqaDNmA
         3SwrKwg0tCeLKwcdoNR4nxLzi4G1JC+PR+gOBb/f4QPd7f8rlKRdkdmHOlK4nbx7S3Dl
         EB8HVUBqUIMO7txg+mXmDAIRY6kybQNskB/8563x+ikr257+EEmdcCB8hnygbzgW9PVa
         bxSIashgFXe9VkdZtDFNZmvHewPZmBX/LmBqede0V3JZjUozt8d4F4V86Crmr0LMR9D7
         SB6w==
In-Reply-To: <E7E899956E6065488DBC6623F76F36A275BF60EA6B@RAMNL-EX02.Ram.nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Arnoud Tijssen <ATijssen@ram.nl>
Cc: netfilter@vger.kernel.org

Hi, thanks for response!

But I like to known what were your experiences.

You already made active/active configurations?
How you handled the traffic to the two firewalls?
Worked with multicast arp or port mirroring?

I believe that working with multicast arp is better.
But, I must confirm that the gateways with firewall support this
feature as well.

A few years ago I tested pfsync + carp from a unix Openbsd.
There is a feature called arp balance - there is something in Linux?
I was impressed, but i prefer the netfilter resources (i think most fle=
xible) .

What do you have configured?
What wasn't good? And what was cool?

I've read several documentations for linux.
I'm opening this thread to help me to define the best methodology and
make my scripts more expert!


2012/12/10 Arnoud Tijssen <ATijssen@ram.nl>:
> For IPTables have a look at:
>
> http://www.linuxjournal.com/article/10964
>
>
> ________________________________________
> From: netfilter-owner@vger.kernel.org [netfilter-owner@vger.kernel.or=
g] On Behalf Of Humberto Juc=E1 [betolj@gmail.com]
> Sent: Friday, December 07, 2012 5:27 PM
> To: netfilter@vger.kernel.org
> Subject: About cluster deployments.
>
> Hi all,
>
> I'd like to know the group opnion about available GPL cluster
> solutions. At the  moment I'm working with a solution based on ucarp
> (vip address) and rsync (conf
>  syncs) without synchronizing the conntrack table - im using active /
> passive model.
>
>  I'm adopting a configuration with two ucarp groups. One group
> determines which firewall will be dedicated to Internet control and
> other is for internal control.
>
> The most suitable configuration into Internet has been keepalived + c=
onntrackd.
>  I think it's a great alternative, but ... I'm having some doubts.
>
> What do you think of implementations with CLUSTERIP?
> I did some tests, but found it a bit unstable. Maybe for my mistakes.
> I found articles  criticizing and others saying that the target
> CLUSTERIP will sync the conntrack table too. It's true?
>
> To synchronize the configuration i thought about using the DRDB, but =
i
>  found it very complex to manage - increases the difficulty in adding
> or removing nodes. In tests that i did, I prefer GlusterFS. But i'm
> undecided. I still think rsync  the most simple, secure and fast way
> to synchronize settings. In my opinion the other methods amplify the
> complexity unnecessarily (for firewalls).
>
> I found articles defending the cluster configuration with corosync + =
pacemaker.
> It seems a fairly complete solution, but thought is not ideal for fir=
ewall.
>
> I intend to test models with active/active, but there isn't much
> documentation on the subject.
>
> What opinion do you have about it (cluster solutions)?
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
