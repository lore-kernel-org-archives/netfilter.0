From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: Help with Load Balancing
Date: Wed, 17 Jul 2013 00:00:07 +0300
Message-ID: <51E5B457.5000704@ngtech.co.il>
References: <CADuigkViSbrbHoO_8-htS-6yRvEqi5MoRdB32N=MSexyjxS1Hg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADuigkViSbrbHoO_8-htS-6yRvEqi5MoRdB32N=MSexyjxS1Hg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ricardo Klein <klein.rfk@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

You cannot do a Magic way of what you want but as Andrew stated you can
LB between two links.
What is the scenario you do have in hands??
iproute is a route level policy\rules.
If you would have a smarter system it would probably taken a snapshot of
the each uplink every specific interval and calculate the global usage
of the link balancing and would mark more connections based on the least
loaded connection.
From the admin perspective it could be something like "dont route using
uplink1 but use uplink2".
The above algorithm is pretty simple if you have uplink1 and uplink2
which you are not afraid both of them to be down.
Once you have the obstacle of "I'm afraid that the link will go down"
you can play with whatever routing you want since the user will not feel
it in most cases.

Eliezer

On 07/16/2013 06:23 AM, Ricardo Klein wrote:
> I think IPRoute is the one who should make the magic, but, if anyone
> can help me here, even pointing me in the right way....
> 
> I know I can split my 2 connections in a static way, making lan subnet
> A go trough uplink 1 and lan subnet B trough uplink2, but, there is
> any way to make this "automatic" like "Hey iproute2, use the least
> used uplink to let users fly"
> 
> I know, if user A is using uplink1 it should go trough that link until
> the end of the navigation, but, later in new requests he should be
> able to start the connection using uplink 2 if uplink 1 is starving.
> 
> Is there any way to reach that with Linux?
> 
> 
> --
> Att...
> 
> Ricardo Felipe Klein
> klein.rfk@gmail.com
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

