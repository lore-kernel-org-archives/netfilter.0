From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Squid Redirection
Date: Tue, 05 Jan 2010 10:36:18 +0100
Message-ID: <4B430812.40608@chello.at>
References: <8ec0428d1001041031t5362a011ie9c19ff589cb38c@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8ec0428d1001041031t5362a011ie9c19ff589cb38c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 04.01.2010 19:31, Aaron Clausen wrote:
> I'm running Squid on my gateway router (on the internal ethernet only
> of course) and have been struggling to figure out how to redirect port
> 80 traffic to it (transparent proxy).  All the instructions I've seen
> are for Squid hosted on another server.  Anyone have any tips?
> 

Besides the REDIRECT, there's also a newer target: TRPOXY -
http://www.balabit.com/downloads/files/tproxy/README.txt

regards

Mart
