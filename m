From: Steve Horsley <steve.horsley@gmail.com>
Subject: Re: nftables segv while trying to use nat redirection with map
Date: Tue, 3 Nov 2015 18:24:40 +0000
Message-ID: <5638FBE8.3090701@gmail.com>
References: <56239149.2010805@gmail.com> <20151018180053.GA1826@salvia>
 <5637F161.3090308@gmail.com> <20151103120847.GA2559@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=W+ipffW/uUqE9ciJO4z2t51QjGxZJQqX1vZupARndEA=;
        b=Cgh4pRGMrvrp1lcDxV0VDo7BJCJJ2/XqfB+Y6zdDGdAedQ3yjpipZ1EFYolmJ+9FBO
         Ez4vZOnJUpKyTyrKzUCMZMSTAShIqPQaODWAEkZqENTQr/9Ii4Iao4oCiLyBdmZwTWAp
         qWAxbfLFL46ZPgVJmmg9YnIKHdveaCqyIvsUEljqU5z3xAZ6dEncejOQrCB1pge+iX0y
         wqm9i25iDEfVJ855QyYtx1t1PhaKRwfx6JSoQR339OJPOj0RZocdEWjeCpfDHDf49bEO
         eVHwWZxeAF/pExmuD4G56V9jtb/pk8NdbHXyp9XsaaF5RrKmmic+g6kEJv1cDRYyua47
         AF4w==
In-Reply-To: <20151103120847.GA2559@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org



On 03/11/15 12:08, Pablo Neira Ayuso wrote:
> On Mon, Nov 02, 2015 at 11:27:29PM +0000, Steve Horsley wrote:
>> Sorry for the delay in answering.
>>
>> I installed the development version of Ubuntu 16.10 with proposed updates.
>> With this version, nft -v reports version 0.5. My original set of commands
>> now works without crashing, so thanks for the advice to try version 0.5.
>>
>> However, this set of commands still fails:
>>
>> # nft flush ruleset
>> # nft add table nat
>> # nft add chain nat output { type nat hook output priority 0 \; }
>> # nft add map nat outnat {type ipv4_addr : ipv4_addr\; }
>> # nft add element nat outnat { 172.16.1.1 : 8.8.8.8 , 172.16.1.2 : 8.8.4.4 }
>> # nft add rule ip nat output dnat ip daddr map @outnat
>> <cmdline>:1:1-48: Error: Could not process rule: Invalid argument
>> add rule ip nat output dnat ip daddr map @outnat
>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>> It looks as though I have a syntax error in the command, but I can't find a
>> good example to use as a template. Do I have the syntax wrong, or is using a
>> separate set like this not possible?
> This is working here. What kernel version are you using?
>
> This problem is resolved in 4.2.4 and it should be in 4.1.12 too.
It appears to be version 4.2.0:

steve@steve-desktop:~$ uname -a
Linux steve-desktop 4.2.0-17-generic #21-Ubuntu SMP Fri Oct 23 19:56:16 
UTC 2015 x86_64 x86_64 x86_64 GNU/Linux
steve@steve-desktop:~$

So I guess I have to wait until Ubuntu catches up with current releases, 
hopefully in time for their next release in April. Or I may try Debian 
Sid, which I think is on kernel 4.2.5 at the moment. I don't think we 
will be using Sid in production, but it should be good for testing.

Thank you again for looking at this. I think my questions are fully 
answered now.
Steve.
