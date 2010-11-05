From: Husnu Demir <hdemir@metu.edu.tr>
Subject: Re: conntrack module question?
Date: Fri, 05 Nov 2010 14:56:41 +0200
Message-ID: <4CD3FF09.9040103@metu.edu.tr>
References: <4CD3CCAE.3060707@metu.edu.tr> <alpine.LNX.2.01.1011051207400.31877@obet.zrqbmnf.qr>
Reply-To: hdemir@metu.edu.tr
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020802050902000004070700"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1011051207400.31877@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: 
Cc: Netfilter Developer Mailing List <netfilter@vger.kernel.org>

This is a multi-part message in MIME format.
--------------020802050902000004070700
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/05/2010 01:12 PM, Jan Engelhardt wrote:
> 
> On Friday 2010-11-05 10:21, Husnu Demir wrote:
>> Hi,
>>
>> I am using conntrack module for a while. As suggested configuration I do add ;
>>
>>
>> -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
>> -A FORWARD -m conntrack --ctstate INVALID -j DROP
>>
>> At the top of the configuration. After that I added the drop rule as;
>>
>> -A FORWARD -i eth0 -o eth1 -m set --match-set STOPALL src -j DROP
>>
>> I added an IP address,
>> 174.142.179.235 a SPAMMER, to stop its communication. But it did no stop.
> 
> How are you determining this?

In fact this address collecting passwords from a hacked site and I want tot stop
it. It is an HTTP connection. And If I put this IP to the list I coud connect the
web site. But if I put the rule above the first rule I could not connect.

http://www.formchamp.com/form.php?id=1120

is the actual SCAM site.

> 
>> I wrote "drop everything from STOPALL list", but the connection is not dropped.
> 
> It drops packets, not connections.
But if it cannot send any packets how a connection can be established?


> 
>> If
>> I wrote the the DROP statement above the 1st rule, it will drop all the
>> connection. What is wrong?
> 
> Perhaps nothing. You clearly accept established connections first,
> so only new ones will be ignored. It does not change existing ones.
> 
>> I do not want to write DROP statement to the top?
> 
> Do you?

In fact my all drop statements are at the top accept first one. I had some
different issues when I wrote it below. It seems better for me to keep it at the
top. Perpahps I should re-consider it.


thanks.

hdemir.

--------------020802050902000004070700
Content-Type: text/x-vcard; charset=utf-8;
 name="hdemir.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="hdemir.vcf"

begin:vcard
fn:Husnu Demir
n:Demir;Husnu
email;internet:hdemir@metu.edu.tr
tel;work:+903122103330
tel;fax:+903122103303
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------020802050902000004070700--
