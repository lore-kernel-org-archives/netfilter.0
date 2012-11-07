From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: Status of iptables target support in ipset
Date: Wed, 07 Nov 2012 23:07:41 +0200
Message-ID: <509ACD9D.4060102@ngtech.co.il>
References: <CABpXQ7aX_LtYxP5UCo454-V9yu07kc8BpUBesCWy-4V_2ZqRvw@mail.gmail.com> <509A31E1.8030703@ngtech.co.il> <alpine.DEB.2.00.1211072149480.3544@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1211072149480.3544@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: =?ISO-8859-1?Q?=22Csord=E1s_Csaba_Ifj=2E=22?= <cscsordas@gmail.com>, netfilter@vger.kernel.org

On 11/7/2012 10:51 PM, Jozsef Kadlecsik wrote:
> No, the idea is to add targets per set entry. I.e.
>
> ipset add foo 192.168.1.1 -t filter -A FORWARD -j LOG --log-prefix foo
> ipset add foo 192.168.1.2 -t filter -A FORWARD -j LOG --log-prefix bar
>
> Best regards,
> Jozsef
hoo now I understand.
but ipset was meant to be a "set match", no?
In iptables it's a module that match a rule if it matches a set...
it's kind of confusing from iptables idea point of view for me.

Regards,
Eliezer

-- 
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il
