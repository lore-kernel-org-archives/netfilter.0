From: prasad zambare <prasadzambare@gmail.com>
Subject: Re: System becomes unresponsive due to kernel oops (IP: dev_queue_xmit+0x256/0x3f4)
Date: Tue, 4 Nov 2014 23:50:00 +0530
Message-ID: <CADMv6SnvnVo6Fq-_LVQEAq70wChoVPJFvJLONjL_LKr9FqZT1w@mail.gmail.com>
References: <CADMv6S=oOo9cuGLpBy3Ap10SDa=MvcjaR+v=FCHEFj0ur_aZkw@mail.gmail.com>
	<5458F80F.7060405@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=fw3q59tfNmRnf7YNun/6fCovT3vKF3cA0AmBpHOIyhg=;
        b=FySTycuqeGQLeQSugW1WrvHuouZdRwxIEm5AnAVlXJkLWoliYzXfe2JvVEPQJJXrUv
         tOFK3VVfJbQaxd8xm2SrzxRN7hxgziyGDsuTR8ZJBg3Cx4kylCmkKejhFID60+Yf9qFe
         iVgbc1e6Pj0Kn0Ctx8rjl304XpEr33DUJDj7p0iFNoFRHJ21IgVSuv7KGjpiC1LZuAnQ
         x+90VDOYtbUwuJLqs32psQ/fsp6pvUSPXg4X/RoopWS92eM8soYk70q6CVKfu/SORYod
         rnX7aYplz8QPwqm+oAoonviyKfjMnzKoouuSihv8Qs5HDozwPXNzNjB5U5/PVUDT16V9
         wmkA==
In-Reply-To: <5458F80F.7060405@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Cc: netfilter@vger.kernel.org

HI Marcelo,

Thank you for your reply.

I am ready deploy custom kernel. Today itself I have started to work
on this. I have prepared 2.6.39 kernel rpm and installed it on the
system.When observed that network interfaces are using e1000e deriver
(by ethtool -i <interface name> command), it is also updated to latest
version. Tomorrow, I am going to see if this resolves the issue.

I guess using custom kernel or upgrading related packages is the only
available option. But this is only trial and error approach as exact
reproduction steps are unknown. Please share if there are any pointers
to understand this issue better or for its resolution.

Thank You,
Prasad

On Tue, Nov 4, 2014 at 9:30 PM, Marcelo Ricardo Leitner
<marcelo.leitner@gmail.com> wrote:
> On 01-11-2014 11:44, prasad zambare wrote:
>>
>> Hi All,
>>
>>  From past few days I am trying to debug an issue but I am not able to
>> get a break through.
>>
>> Linux system is consistently getting unresponsive with below serial
>> console output. The similar serial console output is observed every
>> time the issue is occurred.
>>
>> Steps to reproduce this issue are unknown to me. But, this issue is
>> not observed when all parameters related to acpi are disabled from
>> BIOS.
>>
>> I am newbie to debugging kernel oops. I am using Fedora 13 and I can
>> not upgrade to latest release. Please let me know what could be the
>> problem and how can I resolve this issue. Any pointer or help will be
>> of great importance.
>>
>> Please find the kernel oops message below
>>
>> Thank You,
>> Prasad
>
>
> If you can't upgrade, are you willing/able to deploy a custom kernel with a
> fix? Otherwise I'm afraid there isn't much to do in here.
>
> Marcelo
>
