From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: DNAT routing problem
Date: Fri, 09 May 2008 09:20:59 -0500
Message-ID: <48245DCB.6060905@riverviewtech.net>
References: <3598a5460805081117i7f519321y9ad85f084ba0f484@mail.gmail.com>	 <3598a5460805090348w526f46c9v3f1fd0f0874c84db@mail.gmail.com> <3598a5460805090630m2676a18dp9f25e7ca9efb9ca9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3598a5460805090630m2676a18dp9f25e7ca9efb9ca9@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 05/09/08 08:30, Andrea Ranieri wrote:
> My previous tests involved a ipv4 flow going always from 10.0.5.2 to 
> 10.0.6.2, and the results remains those I wrote in my first mail. Now 
> I tried to change the source IP, and finally, the natting process 
> begins. But obiviously with a strange behavior...

(See below.)

> In this test I always have the 10.0.5.2->10.0.6.2 flow running, and a 
> 10.0.5.[2 to 5]->10.0.6.2 flow. Every IP except the .2 get natted. 
> The .2 remains unchanged. Moreover, when i flush the nat table, the 
> rule disappear but .3, .4 and .5 IPs continue to get natted. I think 
> that's a cache problem.

This really makes me believe that you are dealing with what connection 
tracking thinks is an on going existing established flow / connection. 
Remember that the NAT table only sees the first packet of a connection. 
  So if you are altering your NAT table after a connection is 
established it will name make any difference to the existing connection. 
  This is further exemplified by you testing .3-.5 and seeing them start 
to change and then continue doing what they were when you flush your NAT 
table.  I think you will find that if you stop your connections, wait a 
few minutes, and then start them back up they will behave as expected.

> It's time to put feet in the mouth, isn't it? ^___^

Na.  ;)



Grant. . . .
