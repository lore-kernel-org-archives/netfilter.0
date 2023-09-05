From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Is nftables thread safe?
Date: Tue, 5 Sep 2023 20:47:41 +0200
Message-ID: <3e5d706e-8ae2-a8d7-5f88-de71183edf9b@thelounge.net>
References: <CAH+uSBUVJuUEdGyHxqSUNkLm2a6TWUfECHfJZy53ZXiNCkxOuw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <CAH+uSBUVJuUEdGyHxqSUNkLm2a6TWUfECHfJZy53ZXiNCkxOuw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Wayne Bao <herecomeswaynebao0811@gmail.com>, netfilter@vger.kernel.org



Am 05.09.23 um 20:34 schrieb Wayne Bao:
> I am using https://github.com/ansibleguy/python3-nftables which I
> believe is a copy of
> http://git.netfilter.org/nftables/tree/py/nftables.py?id=e760d200a4b9cd31928b68a1f2f882157344351e
> . I use this python wrapper to add and delete rules to nftables using
> json. Are these operations thread safe?

it's userland and finally you are talking to the kernel

no matter what you do from userland - the kernel operates from top to 
bottom - whatever rules are there in that moment
