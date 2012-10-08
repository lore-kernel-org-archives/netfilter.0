From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: DPI and set's of users.
Date: Mon, 08 Oct 2012 21:08:34 +0200
Message-ID: <507324B2.4020909@ngtech.co.il>
References: <506C1BA3.7050106@ngtech.co.il> <506F1997.9020801@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <506F1997.9020801@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ed W <lists@wildgooses.com>
Cc: netfilter@vger.kernel.org

On 10/5/2012 7:32 PM, Ed W wrote:
> On 03/10/2012 12:04, Eliezer Croitoru wrote:
>> I managed to use opendpi for Deep packets inspection and it seems to
>> be more suitable then other layer 7 DPI solutions.
>
> Can you please test my fork of opendpi-netfilter for nDPI (the ntop fork
> of opendpi)
> https://github.com/ewildgoose/ndpi-netfilter
>
> You need svn nDPI from here:
> http://www.ntop.org/get-started/download/
>
> It may support more protocols... it may crash a lot...
>
> Good luck
>
> Ed W
Nice.
Thanks for the info.

If you would change the module canonical name from opendpi to another 
that will fit the ndpi it will be less of a problem in a case that it's 
buggy( I can revert instead of a lot of trouble).

Thanks,
Eliezer
