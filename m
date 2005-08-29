From: "Alex Sirbu" <alex@as.ro>
Subject: Re: STRING module
Date: Mon, 29 Aug 2005 13:41:20 +0300
Message-ID: <006d01c5ac86$316588a0$0b51960a@rsirbu2kp>
References: <20050828085550.39600.qmail@web30205.mail.mud.yahoo.com><00a401c5ac11$cab8fe30$0106280a@rsirbu2kp>
	<00ad01c5ac13$f7bc8350$0106280a@rsirbu2kp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: netfilter@lists.netfilter.org

It seems that the new kernel 2.6.13 will have support for Netfilter String 
extension ( 
http://www.opensubscriber.com/message/netfilter-devel@lists.netfilter.org/1974735.html ) 
. Can we expect to a improved version of this extension 
ith  --replace-string option soon ?


-Alex Sirbu-
alex@as.ro

----- Original Message ----- 
From: "Alex Sirbu" <alex@as.ro>
To: <netfilter@lists.netfilter.org>
Sent: Monday, August 29, 2005 12:03 AM
Subject: Re: STRING module


>I don't need help anymore; I've got an ugly answer by myself :
>
> # cat patch-o-matic-ng-20050701/patchlets/string/info
> Title: iptables string match
> Author: Emmanuel Roger <winfield@freegates.be>
> Status: Working, not with kernel 2.4.9
> Repository: extra
> Requires: linux < 2.6.0
>
>
> Does anybody have any idea of some similar netfilter extension ? ( string 
> match/replace )
>
>
>
> -Alex Sirbu-
> alex@as.ro
>
> ----- Original Message ----- 
> From: "Alex Sirbu" <alex@as.ro>
> To: <netfilter@lists.netfilter.org>
> Sent: Sunday, August 28, 2005 11:48 PM
> Subject: STRING module
>
>
>> Hi,
>>
>> I am trying to patch a vanilla kernel 2.6.12.5 using POM ( 
>> patch-o-matic-ng-20050701 ) but I have a problem : the STRING modules is 
>> not listed into base, pending or extra extensions.
>>
>> How can I force POM to patch my kernel with this extension ?
>>
>> Regards,
>>
>>
>>
>> -Alex Sirbu-
>> alex@as.ro
>>
>>
>>
>> ____________________________________________________
>> Test your Internet Connection with As.Ro Speed Test - 
>> http://www.as.ro/bandtest/?mailref
>> High website revenue with just a simple search box: 
>> http://www.geenza.com/affiliates.php
>>
>>
>>
>> ____________________________________________________
>> Test your Internet Connection with As.Ro Speed Test - 
>> http://www.as.ro/bandtest/?mailref
>> High website revenue with just a simple search box: 
>> http://www.geenza.com/affiliates.php
>
>
>
> ____________________________________________________
> Test your Internet Connection with As.Ro Speed Test - 
> http://www.as.ro/bandtest/?mailref
> High website revenue with just a simple search box: 
> http://www.geenza.com/affiliates.php
>
>
>
> ____________________________________________________
> Test your Internet Connection with As.Ro Speed Test - 
> http://www.as.ro/bandtest/?mailref
> High website revenue with just a simple search box: 
> http://www.geenza.com/affiliates.php 



____________________________________________________
Test your Internet Connection with As.Ro Speed Test - http://www.as.ro/bandtest/?mailref
High website revenue with just a simple search box: http://www.geenza.com/affiliates.php

