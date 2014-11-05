From: prasad zambare <prasadzambare@gmail.com>
Subject: Re: System becomes unresponsive due to kernel oops (IP: dev_queue_xmit+0x256/0x3f4)
Date: Wed, 5 Nov 2014 22:03:57 +0530
Message-ID: <CADMv6Sky5H=ep08UgUWDpgYjMeeJn_FHRK2R0Le0kCQNrXvA0w@mail.gmail.com>
References: <CADMv6S=oOo9cuGLpBy3Ap10SDa=MvcjaR+v=FCHEFj0ur_aZkw@mail.gmail.com>
	<5458F80F.7060405@gmail.com>
	<CADMv6SnvnVo6Fq-_LVQEAq70wChoVPJFvJLONjL_LKr9FqZT1w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=pmQY/w2NC5ejxKFaggTjBwcfF0cum2WQG9xcHaIqdHc=;
        b=lZDPW+oAjehWxnVHgMx1aQ8w9ePgBu47lTNdTNlQnegLuS4uMeCakEsh1VCpQ40NeI
         einCbN0pecj6pi8/8gOAOI+CGQXHBPg6qdxn4Wzw5mPZZf6FBrS+b+0YQ5kg32IwdugZ
         qRKmDq5d9uVsF/QDlnsoT7v/gaSNQ6Z9s02OVpo783gLrzOE4GbVIs50kC+DIrFHvx3t
         GiqlVQczEBhtFt40gY4QT3MaJrGcamnD70oJ5wx1mgQuhPsVVzrUsbzbAWN7tH8N16lt
         iO+gTIugk5NFRtsBiOCA0/bP0ESlxA3Zy0pcC/48CwX08pjur3sP3jnaVtwh8WpjbSHl
         w1Pw==
In-Reply-To: <CADMv6SnvnVo6Fq-_LVQEAq70wChoVPJFvJLONjL_LKr9FqZT1w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Cc: netfilter@vger.kernel.org

Hi All,

With 2.6.39 kernel and e1000e I had no luck and again the system gets
unresponsive. This time the change is I got "Kernel: Disabling IRQ
#57" message which is repeated for numbers 51, 48, 54. cat
/proc/interrupts shows these numbers are associated with configured
network interfaces. This time I did not get serial console logs as I
made a mistake while connecting serial console. Tomorrow I will again
try to reproduce this issue with proper serial console setup.

Now I not sure if this is the same issue or I have hit a new one.
Please share your views on this tryout.

Thank You,
Prasad

On Tue, Nov 4, 2014 at 11:50 PM, prasad zambare <prasadzambare@gmail.com> wrote:
> HI Marcelo,
>
> Thank you for your reply.
>
> I am ready deploy custom kernel. Today itself I have started to work
> on this. I have prepared 2.6.39 kernel rpm and installed it on the
> system.When observed that network interfaces are using e1000e deriver
> (by ethtool -i <interface name> command), it is also updated to latest
> version. Tomorrow, I am going to see if this resolves the issue.
>
> I guess using custom kernel or upgrading related packages is the only
> available option. But this is only trial and error approach as exact
> reproduction steps are unknown. Please share if there are any pointers
> to understand this issue better or for its resolution.
>
> Thank You,
> Prasad
>
> On Tue, Nov 4, 2014 at 9:30 PM, Marcelo Ricardo Leitner
> <marcelo.leitner@gmail.com> wrote:
>> On 01-11-2014 11:44, prasad zambare wrote:
>>>
>>> Hi All,
>>>
>>>  From past few days I am trying to debug an issue but I am not able to
>>> get a break through.
>>>
>>> Linux system is consistently getting unresponsive with below serial
>>> console output. The similar serial console output is observed every
>>> time the issue is occurred.
>>>
>>> Steps to reproduce this issue are unknown to me. But, this issue is
>>> not observed when all parameters related to acpi are disabled from
>>> BIOS.
>>>
>>> I am newbie to debugging kernel oops. I am using Fedora 13 and I can
>>> not upgrade to latest release. Please let me know what could be the
>>> problem and how can I resolve this issue. Any pointer or help will be
>>> of great importance.
>>>
>>> Please find the kernel oops message below
>>>
>>> Thank You,
>>> Prasad
>>
>>
>> If you can't upgrade, are you willing/able to deploy a custom kernel with a
>> fix? Otherwise I'm afraid there isn't much to do in here.
>>
>> Marcelo
>>
