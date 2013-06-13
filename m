From: Daniel Wagner <wagi@monom.org>
Subject: Re: xt_SECMARK: unable to map security context 'httpcontext (error)
Date: Thu, 13 Jun 2013 17:13:05 +0200
Message-ID: <51B9E181.2060401@monom.org>
References: <CAGXs5wVYPa4k_fM1CtGG9VFstgeAAvX+F4Mq8wf_yrTM2Opp5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGXs5wVYPa4k_fM1CtGG9VFstgeAAvX+F4Mq8wf_yrTM2Opp5Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kevin Wilson <wkevils@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Kevin,

On 06/03/2013 07:12 PM, Kevin Wilson wrote:
> Hi,
> I am trying in Ubuntu 13.04 to run this:
>
>   -
> modprobe xt_SECMARK
> than:
> iptables -t mangle -A PREROUTING -p tcp --dport 80 -j SECMARK --selctx httpconte
>
> And I get:
> iptables: No chain/target/match by that name.
>
> syslog says:
> Jun  3 20:09:48 amd kernel: [ 3269.413962] xt_SECMARK: unable to map
> security context 'httpcontext
>
> what should I do ?

IIRC, you need to specify the complete SELinux context, e.g.

system_u:object_r:user_home_t

HTH,
daniel
