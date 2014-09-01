From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: Problem using hashlimit for bandwidth limit
Date: Mon, 1 Sep 2014 12:32:35 +0530
Message-ID: <CAA5aLPi0Aq9nug4qHnarkohWu=PH0Lif3KM_0MLG+bGkW1wxAg@mail.gmail.com>
References: <CAA5aLPhZo+qGMcFA=HOm-KgcczyJvf_27rxnG3_1h8hQpK+kHQ@mail.gmail.com>
	<08FA3185F32849E1AD18DB14C8A8248D@gmail.com>
	<CAA5aLPgYg1pt6pAVc8Brbt+FOLr8UJOh23HcoOfTkp0dwCqqQA@mail.gmail.com>
	<3EABC7CFB24E40A093BF1352AB76C18C@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=PuZ6Jiqz8iT++UMON0QtbYlwgPYcrDo4wg9Len8IJ6Q=;
        b=fnfBuosapLLu/39+WIznxPPslECMKj9kq3NDFO9qJCldmI4h6MX0b8N3umomhs3HK5
         T0G7HZXWzZCLlIXM5Up9Qlb1oX0HZA6baXMO2R4t/hYZT36KWVGBGvqOyJRUGdrVGjI4
         DsnT8tNI+fqtpVhh3PgTiwL2Zkmj220JCR0LhIrY4hOXZyWTuBlP3SrtHm/4+ymWGbx1
         uUId7ZLMVebjpGKADPlhhfjrD3hO/s2mwxgfGGX0uW+7NQtSlWQyJK0jnN2XQeeoItv1
         AjbhcOzh/qUQBawbA1LWd+End0iE0b4iL8W2ezN4aTaLpTBPBn6gKzY2z2mCUsYiAUTY
         SJww==
In-Reply-To: <3EABC7CFB24E40A093BF1352AB76C18C@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Payam Chychi <pchychi@gmail.com>
Cc: netfilter@vger.kernel.org

Hi!

My problem is not related to that. I think so ... ;)

What I want to achieve is fix bandwidth 512 kbps and not fix
connection rate (like 512K connections per sec)?

I want to use hashlimit for this purpose as from iptables 1.4.15
hashlimit has feature of including bit rate also in the hashlimit.
However, I am not able to achieve that bandwidth limit with hashlimit.
My observations mentioned in my initial mail is all in this regard
only.

Thanks and Regards,
-Akshat



On Sat, Aug 30, 2014 at 9:30 PM, Payam Chychi <pchychi@gmail.com> wrote:
> http://comments.gmane.org/gmane.comp.security.firewalls.netfilter.general/35045
>
>
> --
> Payam Chychi
> Network Engineer / Security Specialist
>
> On Friday, August 29, 2014 at 11:26 PM, Akshat Kakkar wrote:
>
> I might be bothering too muchbut I am not able to find any info on
> this on google. Looks like everyone is happy using hashlimit for
> bandwidth control and I am the only one in the desert trying to
> survive. Please help.
>
> On 28/08/2014 6:42 pm, "Payam Chychi" <pchychi@gmail.com> wrote:
>
>
> This is an old and well covered item, google can be of help
>
> You wont get the required results hashlimit takes your clockspeed into
> account... Amongs a few others.
>
> Kindly google
>
> --
> Payam Chychi
> Network Engineer / Security Specialist
>
> On Thursday, August 28, 2014 at 1:33 AM, Akshat Kakkar wrote:
>
>
> Hi!
>
>
> I want to use hashlimit for giving all my users a fix set of bandwidth
> of 512kbps for accessing internet.
>
>
> I am using following command.
>
>
> # allowing return packets so that rate limiting is done only on forward
> packets.
>
> iptables -A FORWARD -s 192.168.192.168 -j ACCEPT
>
> # If limit is upto 512 then allow
>
> iptables -A FORWARD -m hashlimit --hashlimit-name test512
> --hashlimit-mode srcip --hashlimit-htable-size 1000
> --hashlimit-htable-max 1000 --hashlimit-upto 64kb/s --hashlimit-burst
> 128kb -j ACCEPT
>
> # else drop
>
> iptables -A FORWARD -j DROP
>
>
> I am not observing the expected behaviour.
>
> I am sending ping of 100 bytes continously at 10 msec interval.
>
> What I observed is , I got back reply of only first 2 pings and for
> remaining there is no reply. Nest reply came only after 103 Seconds
> !!! and that too only a single reply.
>
>
> output of iptables -L -n -v also shows only 2 packets matching this rule.
>
>
> output of command cat /proc/net/ipt_hashlimit/test512 come like
>
>
> 59 10.10.10.10:0->192.168.192.168:0 764416 6688000 3328000
>
> the number 764416 keeps on increasing but not observed any reply till
> it reaches the value of 3328000. But it takes huge time (~103 Seconds)
> to reach that value.
>
>
> Can anyone please explain all this behaviour ?
>
>
> Thank you .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
>
>
