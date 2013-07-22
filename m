From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: How to use a random IP from a pool of static IPs for outgoing
 traffic
Date: Mon, 22 Jul 2013 10:53:01 +0530
Message-ID: <51ECC1B5.8090206@atc.tcs.com>
References: <CAMkC2Wjqx_R=_LCRnjiE1ppZYm+73ATjrLT0+C=UEw+Bp=gBMg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMkC2Wjqx_R=_LCRnjiE1ppZYm+73ATjrLT0+C=UEw+Bp=gBMg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: higkoohk <higkoohk@gmail.com>
Cc: netfilter@vger.kernel.org

On 07/19/2013 09:06 AM, higkoohk wrote:
> I have a linux server , use iptables as nat router.
>
> This server has many public static IPs , but the machines in LAN
> always use the default public ip as route.
>
> We need random use out going IPs .
>
>   Anybody know howto with iptables ?

Specifying the public IP range in SNAT may help,

--to-source [ipaddr-ipaddr]


Regards,
Vignesh
