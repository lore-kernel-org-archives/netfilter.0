From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: Bridging / VLANs / ebtables
Date: Wed, 17 Dec 2014 10:11:31 +0530
Message-ID: <CAA5aLPi--5H-+SVDvv9tDc7SNSnYtxpW1rAStAhQrgr0qpwHOw@mail.gmail.com>
References: <4829673.301498.1418414563731.JavaMail.root@rockbochs.com>
	<12631645.301499.1418414592170.JavaMail.root@rockbochs.com>
	<20141217025514.GW967@titan.lakedaemon.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=giPo8XVSj5YqStKJg33Fl9IY+I+tP1XqqDj10rPafXM=;
        b=UQC7dbSk57zgAsLfDFeifrQkB/0smDpPJ0YCzG14zVFkwrUxwLrBzcZwRYXMm2+E69
         KB+xMxTpZu9pypbv2iD4iDpdBY/4x25GojYm9qiV3wspALSr37Bs7Ac+x7pDr5xP4qom
         ANDsK+AcR3zb1M3RlAnaGewZECowsBeX4NGBwJMxPqLjesDjuHvsHPObP4Hx7D7EAT1o
         AcxTg4wzd2D4RoUZVvrQCLTko6JkJs2zsbxCUVfW1mcqy/ro8dNzrOJ8f60tASKWrKYY
         jgx8qONGUvyUJaUKZ8tt8OjbZeyppHbbnEqfVMCPCCMJIstgYRfYA4WdExiGgB/+tWXw
         xzEQ==
In-Reply-To: <20141217025514.GW967@titan.lakedaemon.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Cooper <jason@lakedaemon.net>
Cc: Tim Nelson <tnelson@rockbochs.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Its not about finding a workaround or something.

If we bridge two vlans on the same interface, then what should be the
VLAN-tag on the packets moving out of the box? As it might not be
possible to decide this, thats why we cannot bridge two vlans on the
same interface.

On Wed, Dec 17, 2014 at 8:25 AM, Jason Cooper <jason@lakedaemon.net> wrote:
> Tim,
>
> Ah crap.  I should've read the OP first.  Definitely some scenario lost
> in quote-trimming...
>
> On Fri, Dec 12, 2014 at 02:03:12PM -0600, Tim Nelson wrote:
>> Greetings-
>>
>> I have an interesting situation that requires bridging some VLAN
>> enabled interfaces together on a Debian 7.x x86 system. On the host,
>> there is a single physical interface passing traffic natively (eth0),
>> and two tagged VLANs also passing traffic (eth0.2 and eth0.3).
>>
>> The use case is that I need to bridge eth0 with eth0.2, allowing layer
>> two traffic to pass seamlessly between interfaces, and still leave
>> eth0.3 in a usable state. The switch this system is connected to is
>> outside of my control, which is the reason for the odd network setup.
>>
>> What I'm finding by simply creating a new bridge br0 with members eth0
>> and eth0.2 is no connectivity on eth0.2, and slow/quirky connectivity
>> on eth0 (native connectivity to Debian 7.x host).
>
> This sounds a bit like an IP address / routing rule conflict.  Did you
> set eth0 and eth0.2 0.0.0.0 and promiscuous?  Did you assign one IP
> address to the bridge?  Would you mind sending the output of:
>
> # ip addr show
>
> and
>
> # route -n
>
> ?
>
>> It has been suggested to use ebtables to filter the VLANs from the
>> eth0 interface on the bridge, yet allow operation to the system
>> interface eth0.2/eth0.3. I found a very specific reference on the
>> ebtables site for this scenario [1], usage suggested (modified to fit
>> my environment):
>>
>> ebtables -t broute -A BROUTING -i eth0 -p 802_1Q --vlan-id 3 -j DROP
>> ebtables -t broute -A BROUTING -i eth0 -p 802_1Q --vlan-id 2 -j DROP
>>
>> If my understanding of the ebtables usage as a brouter, and the
>> kernel's interaction between all components involved, this should
>> work. However, as noted, no change in operation is observed.
>
> Yes, based on your description of the network you are going to need the
> above rules.
>
> thx,
>
> Jason.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
