From: =?ISO-8859-13?Q?Art=FBras_=D0lajus?= <x11@arturaz.net>
Subject: Re: Mystics of packet forwarding
Date: Wed, 07 Jan 2009 10:50:19 +0200
Message-ID: <49646CCB.9060803@arturaz.net>
References: <4963B3EB.6090806@arturaz.net> <49644880.8000903@treenet.co.nz> <d39744a20901070000m1491882x6665a88a22b839a4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d39744a20901070000m1491882x6665a88a22b839a4@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Petrushev <ivanatora@gmail.com>
Cc: Amos Jeffries <squid3@treenet.co.nz>, netfilter@vger.kernel.org

Ivan Petrushev wrote:
> One think I can come with is TTL limiting (largely known here where I
> live). Try pinging these "troubling" sites from your home gateway and
> see if TTL is 1 or 2 or some bigger value.
I don't quite understand what are you saying? TTL too small and expires in path? 
TTL too big and gets filtered some how?

> And one other thing - you said these sites disappear, but I didin't
> understood where from are you testing? From the home gateway or from
> the NATed boxes behind it?
 From both sites..

> Could you add SNAT rule for non-existant box (IP that is not present
> on your network, like 192.168.0.200) and see if these sites work.
> 
> And one other thing - /16 ? Do you really have such big network? :)
No, but I have a lot of dumbass users who love to set static ips to ones that 
servers use :)) And I doubt that this is the problem...
