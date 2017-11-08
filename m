From: Mark Coetser <mark@pkfnet.co.za>
Subject: Re: packages leaving interface wrongly using loadbalance
Date: Wed, 8 Nov 2017 13:01:52 +0200
Message-ID: <ced608bd-ea9f-c4ab-46ee-87c12bda92aa@pkfnet.co.za>
References: <CANSGRxQkCfa8FSQ+RPdZ2sv54hL=srh0G80Rdad7tyZ6Ude_TA@mail.gmail.com>
 <a017a16d-4c29-93ea-6e13-ff35e4b89809@gmail.com>
 <CANSGRxTFSJrUhjOaKg1tvw1q9JxHGghkJBaRncOLLcVw_3UW6A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CANSGRxTFSJrUhjOaKg1tvw1q9JxHGghkJBaRncOLLcVw_3UW6A@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: paulo bruck <paulobruck1@gmail.com>, Fatih USTA <fatihusta86@gmail.com>
Cc: netfilter@vger.kernel.org


On 08/11/2017 01:58, paulo bruck wrote:
> Hi Fatih
> 
> Thanks for quickly response.
> 
> Unfortunately using your scripts  is the same. I see packages leaving
> wan interface w/ lan address and packages  leaving WAN1 w/ WAN2 ip...
> 80((
> 
> I have read about routing cache not exist after kernel 3....8(     but
>   I not found any replacement for it untill now.
> 
> Tested in Debian stretch using kernel 3.16 and 4.9.51-1
> 
> I think that with your ideia I have reach 1/2 of path.....
> 
> Any other idea ?
> 
> Thanks

You are correct, the route cache is no longer available. you need to use 
iptables with conntrack and statistic to balance the connections across 
each link.


-- 
Thank you,

Mark Adrian Coetser
