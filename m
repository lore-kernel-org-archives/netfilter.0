From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: DNAT routing problem
Date: Fri, 09 May 2008 12:55:50 -0500
Message-ID: <48249026.5090307@riverviewtech.net>
References: <3598a5460805081117i7f519321y9ad85f084ba0f484@mail.gmail.com>	 <3598a5460805090348w526f46c9v3f1fd0f0874c84db@mail.gmail.com>	 <3598a5460805090630m2676a18dp9f25e7ca9efb9ca9@mail.gmail.com> <3598a5460805090934g343f73e9q8fa2a8c0aa536df@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3598a5460805090934g343f73e9q8fa2a8c0aa536df@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 05/09/08 11:34, Andrea Ranieri wrote:
> Yes, that sounds as a good explanation of this phenomenon. However 
> this behavior is not what I want/expect from netfilter. I'm looking 
> for a simple, straight-forward, connectionless 1to1 IP NAT. And, of 
> course, i'm looking for something that can be enabled/disabled 
> without waiting minutes!

*nod*

> Ok then, if that's the normal behavior of netfilter's NAT module, 
> I'll have to find an alternative solution.

I don't know if it is still in place or not, but you might look in to IP 
Route 2's stateless NAT, it may be able to do what you are wanting.  I 
think your main problem with NetFilter's NAT *is* the connection tracking.

> Thank you very much for your help.

*nod*

You are welcome.



Grant. . . .
