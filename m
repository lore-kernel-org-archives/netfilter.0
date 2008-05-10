From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: DNAT routing problem
Date: Sat, 10 May 2008 10:56:14 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805101053300.19952@fbirervta.pbzchgretzou.qr>
References: <3598a5460805081117i7f519321y9ad85f084ba0f484@mail.gmail.com>  <3598a5460805090348w526f46c9v3f1fd0f0874c84db@mail.gmail.com>  <3598a5460805090630m2676a18dp9f25e7ca9efb9ca9@mail.gmail.com>
 <3598a5460805090934g343f73e9q8fa2a8c0aa536df@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3598a5460805090934g343f73e9q8fa2a8c0aa536df@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrea Ranieri <andreran@uno.it>
Cc: netfilter@vger.kernel.org


On Friday 2008-05-09 18:34, Andrea Ranieri wrote:
>On 5/9/08, Grant Taylor wrote:
>
>> This really makes me believe that you are dealing with what connection
>> tracking thinks is an on going existing established flow / connection.
>> Remember that the NAT table only sees the first packet of a connection.
>>  So if you are altering your NAT table after a connection is
>> established it will name make any difference to the existing connection.
>>  This is further exemplified by you testing .3-.5 and seeing them start
>> to change and then continue doing what they were when you flush your NAT
>> table.  I think you will find that if you stop your connections, wait a
>> few minutes, and then start them back up they will behave as expected.
>
>Yes, that sounds as a good explanation of this phenomenon.
>However this behavior is not what I want/expect from netfilter. I'm
>looking for a simple, straight-forward, connectionless 1to1 IP NAT.
>And, of course, i'm looking for something that can be enabled/disabled
>without waiting minutes!

On a global scale you can set
/proc/sys/net/netfilter/nf_conntrack_generic_timeout .
There has been a module (or a group of them) called TIMEOUT or
actually CONNTRACK by Phil Oester and Pablo Neira Ayuso with which
you can set the ct timeout per connection. That's one way.
Another is to use the RAWNAT target.
But tc is an obscure thing.
