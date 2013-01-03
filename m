From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: [SOLVED] Re: Native support of counting rules?
Date: Thu, 3 Jan 2013 22:13:24 +0800
Message-ID: <CAJZVxRkyDyZyWUBbhP+H5gv2Dk1_Jj=v4QRAheHKWEnSKTdrhg@mail.gmail.com>
References: <20130102134421.GA17997@devnull>
	<50E43D07.50009@ngtech.co.il>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=5XuXZGDNkWyIbA8g3bZy3+E+01+ldH658VagqvVim2Y=;
        b=PJJ+0piW6JdiDharT91QnwuK9w8TizlM63IfA0nnAftpC6M2VgO1gW+z/dqGl1Wxz7
         aDu9P4CNDfAInimWyh+L6op+eMKIgIVFKiObpWeD8/A7yydLyUSouvMe+wLfLGaFnwT+
         Slv+JVFnMf1qYlfSkNHV6COfHOHqw3+2Jvp1MjKzEQrqL3JTleERbnj694OK9Qdd0kvK
         tLia8txUw7md6oiOSPpNdoeAKki4Jr4B4lTNIr9r652QhvQ3cJGsrzvIvwiSMU4PhgO5
         WKMMKy5EbILXjV1FQJtfHR7rlz0JOOUvzZi1Ko/UHS5UtwP1rRQYXA4+M9kLmmg3gT6j
         1MMw==
In-Reply-To: <50E43D07.50009@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: netfilter mailing list <netfilter@vger.kernel.org>

Already checked the manual on my system ... there's no counting
support, the only thing relevant was --line-numbers,

My code is here, for anyone who needed

https://raw.github.com/CaledoniaProject/ipt_counting/master/ipt-count.c

I just hope one day such feature would be included officially.


On Wed, Jan 2, 2013 at 9:58 PM, Eliezer Croitoru <eliezer@ngtech.co.il> wrote:
> Hey Aaron,
>
> I feel kind of odd but this should answer you:
> http://linux.die.net/man/8/iptables
> www.garron.me/linux/iptables-manual.html
>
> Eliezer
>
>
> On 1/2/2013 3:48 PM, Aaron Lewis wrote:
>>
>> Hi,
>>      I want to know if I could get how many rules are present, i.e in
>>      filter table?
>>
>>      Now I do `iptables -L | wc -l` like stuff, I know it's not right,
>>      but iptables itself doesn't seem to count rules anyway.
>>
>>      I need this just to let user to know how many rules are present,
>>      without root privileges, and now being able to view actual rules.
>>
>



-- 
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://keyserver.veridis.com )
Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
