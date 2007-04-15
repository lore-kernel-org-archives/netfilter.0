From: Ronald <ronald645@gmail.com>
Subject: Re: Unable to block ICMP
Date: Sun, 15 Apr 2007 19:10:25 +0200
Message-ID: <46225C81.6070503@gmail.com>
References: <46224132.4080702@gmail.com>	
	<78a2adce0704150816o77d64848x5982caafd70c30df@mail.gmail.com>	
	<46224EFE.6060409@gmail.com>
	<78a2adce0704150914y4e9fd552m8e316ebd1b00ae79@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:cc:subject:references:in-reply-to:content-type:content-transfer-encoding;
	b=MeBaV3n8mFL3IT81eXxC7CCuqC+WEZYkgxJ3TLBX+hBT5y+VzLrjQQWyvF7b39Ay4Dh0V7RYcikV0Cc4yjRE8qwGtIXqnIYiA25+LR/yJXPOXTjfCLks3nPUJYP3QVHaWF1uIFURqTQryriobo64uUaltWoNiY+AgzAt9ne5jdM=
In-Reply-To: <78a2adce0704150914y4e9fd552m8e316ebd1b00ae79@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas d'Otreppe <tdotreppe@gmail.com>
Cc: netfilter@lists.netfilter.org

Thomas d'Otreppe schreef:
> Ronald,
>
> the subject of your mail is "Unable to block ICMP", so I just told you
> how to block the ICMP (by looking at the rules you posted on the link
> you gave).
>
> Best regards,
>
> Thomas
>
> PS: Please use "answer to All", so that everybody get the answer and
> can follow this thread
>
> 2007/4/15, Ronald <ronald645@gmail.com>:
>> Thomas d'Otreppe schreef:
>> > Ronald,
>> >
>> > use "iptables -A INPUT -p icmp -j DROP" instead of "iptables -A OUTPUT
>> > -p icmp -j DROP"
>> >
>> > Best regards,
>> >
>> > Thomas
>> >
>> > 2007/4/15, Ronald <ronald645@gmail.com>:
>> >> Check this thread (posted by me):
>> >>
>> >> http://forums.fedoraforum.org/forum/showthread.php?t=152539
>> >>
>> >> Could anyone help me here with the problem please ?
>> >>
>> >>
>> >>                                  Ronald
>> >>
>> >>
>> >
>> That didn't work either. pcflank.com still sees the ports as closed. Any
>> more sugeestions?
>>
>
Well, what I actually wanted (which I probably explained wrong) is that 
my ports that are not in use (closed) are being invisible (no ICMP 
echo). That better?

