From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: stateful tracking options
Date: Tue, 27 Nov 2007 16:39:15 -0600
Message-ID: <474C9C93.1030206@riverviewtech.net>
References: <4d7bf97f0711271328r6eb542fcq284443db6bf6efa2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4d7bf97f0711271328r6eb542fcq284443db6bf6efa2@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/27/07 15:28, Quartexx wrote:
> is possible to use stateful tracking options?

Yes

> I mean set limits related to filter rules that create state entries;
> 
> for example: limit the number of source IP addresses that can 
> simultaneously create state, or limit the rate of new connections to 
> a certain amount per time interval.

I'd say that you could do something with the recent match extension / 
target.  This would allow you to do some things in conjunction to 
whether or not a given source ip address in in a given recent list (you 
can have multiple) or not in a (user) specified amount of time.

You would end up checking a recent list to see if the given source 
qualifies to alter state or not.



Grant. . . .
