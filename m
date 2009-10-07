From: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Subject: Re: transparent proxy and iptables failing
Date: Wed, 07 Oct 2009 23:31:34 +1100
Message-ID: <4ACC8A26.1050709@standarduniversal.com.au>
References: <7de411230910070245s23552d36v66496187db666440@mail.gmail.com> <7de411230910070444u50e7c638m968350c6da1ce6e1@mail.gmail.com> <4ACC83EC.9040801@gulfsat.mg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ACC83EC.9040801@gulfsat.mg>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

you could list your rules to prove that they look ok.

iptables -t nat --list -V



Rakotomandimby Mihamina wrote:
> 10/07/2009 02:44 PM, Robin Wood::
>> br-lan
>> What am I doing wrong?
>
> IMHO, the "-" in br-lan is wrong.
> escape/protect it with "br-lan" or something like that.
>
