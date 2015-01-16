From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Fri, 16 Jan 2015 03:27:23 +0100
Message-ID: <m99sub$4k7$1@ger.gmane.org>
References: <CAJb3rWA-Xy5MwqtyKP4X96NtrKw9Wm5-d-uMYwN4oG2cymOvYw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJb3rWA-Xy5MwqtyKP4X96NtrKw9Wm5-d-uMYwN4oG2cymOvYw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

The Media Server wrote, On 01/16/2015 03:15 AM:
> You have an idea why it still timing out
> tho? and not timing out with this:
> sudo ip rule add from 192.168.2.0/24 table ht

I don't know what you mean by "timing out", and I think you didn't mention 
that in the previous postings.
I must admit that that stuff is not easy, it's called "advanced routing"
or "policy routing", so you will need to do some more experiments.
I would suggest to simplify the problem by deactivating everything else.


