From: John Haxby <john.haxby@oracle.com>
Subject: Re: Squid Redirection
Date: Tue, 05 Jan 2010 10:31:55 +0000
Message-ID: <4B43151B.1040709@oracle.com>
References: <8ec0428d1001041031t5362a011ie9c19ff589cb38c@mail.gmail.com> <4B430812.40608@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B430812.40608@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Mart Frauenlob <mart.frauenlob@chello.at>

On 05/01/10 09:36, Mart Frauenlob wrote:
> Besides the REDIRECT, there's also a newer target: TRPOXY -
> http://www.balabit.com/downloads/files/tproxy/README.txt
>
>    

I've read that, but I'm still not clear what TPROXY gives me that 
REDIRECT doesn't, except that it seems more complex.

For example, I have

iptables -A PREROUTING -p tcp -m tcp ! --dport 3128 -j REDIRECT 
--to-ports 3128

I don't need anything else, just a process listening on port 3128 that 
knows what to do with redirected connections.

What would TPROXY give me that that doesn't?

jch
