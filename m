From: lists+netfilter@roth.lu
Subject: Re: Handling large list of rules - Efficient or not?
Date: Sat, 17 May 2008 17:59:22 +0200
Message-ID: <482F00DA.8010607@roth.lu>
References: <b66ddc900805170728h34511bb7r9be1324034745748@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <b66ddc900805170728h34511bb7r9be1324034745748@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: howard chen <howachen@gmail.com>
Cc: netfilter@vger.kernel.org

howard chen wrote:
> My server sometimes is under attack by DDOS, so I want to make a
> simple script which read the log (Apache access log), do the analysis,
> and set the rule to drop the packets from a specific IP.
>
> Since it is DDOS, so I assume there will be large ammount of unique IP
> needed to be input into the iptables.
>
> I want to know, are there any hidden efficiency problem in this setup?
> Or any better method?
>
>
> Howard.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   
Haven't we had this discussion several times in the very recent past? 
See the archives.
Hint: if the list is really large use ipsets.
