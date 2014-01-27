From: Ray Soucy <rps@maine.edu>
Subject: Re: Public IP to Private IP
Date: Mon, 27 Jan 2014 16:30:14 -0500
Message-ID: <CALFTrnPr1bRNrkSpHc=aPSE6iT7pYEC3y8PC7wpBBi4cCSn8NA@mail.gmail.com>
References: <CAFPGR9jhpurA644xdfWc6dF58iVCc5t7mbUw6NsjxPqYQxtUHw@mail.gmail.com>
	<CALFTrnO7SAm0ghr7b1p+o9cWnbwtRJQMtSmtJy_VXJxd-xxkcw@mail.gmail.com>
	<CAFPGR9guTGspBJ8yfOVNZAAMy44YGS+UeV+QmYNLpAJ+ZxTuxw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFPGR9guTGspBJ8yfOVNZAAMy44YGS+UeV+QmYNLpAJ+ZxTuxw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Mayo <scotgmayo@gmail.com>
Cc: netfilter list <netfilter@vger.kernel.org>

That seems very strange,

Is the server hosted on the same system as the NAT box?
Did you flush the conntrack table or wait for timeouts after making the change?

On Mon, Jan 27, 2014 at 4:01 PM, Scott Mayo <scotgmayo@gmail.com> wrote:
> On Mon, Jan 27, 2014 at 2:48 PM, Ray Soucy <rps@maine.edu> wrote:
>> The term you're looking for is "NAT reflection" or "hairpin NAT".
>>
>> If you're not running split DNS, then trying to reach a system via its
>> "outside" IP from an internal system will present a problem because
>> the source IP of the request is seen as on-link by the server, so the
>> server responds directly from an unexpected source IP and the
>> requesting host drops the request.
>>
>> You can get around this issue by NATing the return traffic when its to
>> and from the internal network.
>>
>> Assuming that your inside interface is eth1, and your inside IP
>> network is 192.168.0.0/23:
>>
>> iptables -A POSTROUTING -s 192.168.0.0/23 -d 192.168.0.0/23 -o eth1 -j
>> MASQUERADE
>>
>
> That did not seem to work either.  Getting the same results.  Thanks.
>
>
>> Split DNS, however, is a better approach, if you can do it (using
>> views in BIND).
>
>
> Yes, if I can get time to setup a Bind server. I just need some more time.
>
> --
> Scott Mayo
> Mayo's Pioneer Seeds   PH: 573-568-3235   CE: 573-614-2138
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Ray Patrick Soucy
Network Engineer
University of Maine System

T: 207-561-3526
F: 207-561-3531

MaineREN, Maine's Research and Education Network
www.maineren.net
