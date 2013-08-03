From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: [RES] Re: net unreachable ipv6
Date: Sat, 03 Aug 2013 15:19:22 +0300
Message-ID: <51FCF54A.9080807@ngtech.co.il>
References: <CAMD-=VJjymnAL9FuGnSTLvxFLnmAy9nrO9mdMkvbWNdiDxw1GA@mail.gmail.com> <51FAA2EF.4070001@ngtech.co.il> <CAMD-=VKHbG8dXDtrUJAsZMG3ipHOBED6u=dCQUwifc8bQo8CQA@mail.gmail.com> <CAMD-=V+myg5gef_7L2R+2Lq071PseYZeqDbFmjVDy4X1uBexBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <CAMD-=V+myg5gef_7L2R+2Lq071PseYZeqDbFmjVDy4X1uBexBQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Edwards <nick.z.edwards@gmail.com>
Cc: Netfilter user mailing list <netfilter@vger.kernel.org>

On 08/02/2013 06:17 AM, Nick Edwards wrote:
> Thanks to a very helpful member of this list, off-list (so not sure if
> he wants to be named and famed), the problem has been resolved, by
> allowing INPUT for neigh discovery packets type 135 and 136
> 
> I have quickly learned that the ipv4 habits of yesteryear must go out
> the window for ipv6 to work.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
Indeed so much is different..
Can you share the rules as rules form to show others how it is being done?

Eliezer
