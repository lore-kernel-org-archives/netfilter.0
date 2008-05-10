From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: DNAT routing problem
Date: Sat, 10 May 2008 10:52:41 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805101048260.19952@fbirervta.pbzchgretzou.qr>
References: <3598a5460805081117i7f519321y9ad85f084ba0f484@mail.gmail.com> <3598a5460805090348w526f46c9v3f1fd0f0874c84db@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3598a5460805090348w526f46c9v3f1fd0f0874c84db@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrea Ranieri <andreran@uno.it>
Cc: netfilter@vger.kernel.org


On Friday 2008-05-09 12:48, Andrea Ranieri wrote:
>On 5/8/08, Grant Taylor wrote:
>
>> NAT rules are applied to the first packet in a connection and then the
>> same action is auto-magically applied to all other packets in the
>> connection with out passing them through the NAT table.
>>
>> So what you are seeing is probably very likely based on existing verses
>> new connections.
>
>Thanks for your reply, but it seems I didn't explain my problem clearly.
>I have a connectionless flow of ipv4 packets. No TCP, UDP or any L4
>payload at all.
>So my question now is: does netfilter (with D/SNAT or NETMAP target)
>provide basic natting features without having a L4 payload, or a
>connection oriented flow is required for natting?

Yes, it can do generic NAT -- which is actually used for things like
IPsec-ESP, IP-in-IP.
