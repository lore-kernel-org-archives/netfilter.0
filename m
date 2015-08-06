From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: One to One port range forwarding to different port range
Date: Thu, 6 Aug 2015 12:56:15 +0530
Message-ID: <CAA5aLPitegnUtMX1F8==_Fw9MKLnJmRNkF16B66Xjasg-9OZ8g@mail.gmail.com>
References: <55C23EA8.8020905@cradlepoint.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=KjRfxNX7OAx1/9EGqBOvXdD4CpRr1GhbSra4FbdmhSs=;
        b=nuXJJNua3FsEF58+Wgq6ru1dzGAJijQfgpJMxZt63NN5cV6jUDrlIohBBvC6DuOgxa
         GweYt2jHg78DW3W7B8GEYbeJX7CLHKhsOjDU+6hd8XaQa5ZhQg3601YzMQjYgCHS01Vk
         9FAeuG7Nk01+uBn6IJYHYpzOnzB4tINnCfv7rZbEiRex9G98J2oQ+5Wn5T1tNw/6UV8+
         iJfy7BgspLSN8cqEoOdjHEaqWXIF9J2543jwNaz/7StvnvixtWVLc/O4UVGuy35iHGQE
         2A/YQbEwctZocIwoVjhJwdWgZVXZcrZzvbpRs6wczq9dMJNsTW1+dl+5nq04O321tdPK
         1DzA==
In-Reply-To: <55C23EA8.8020905@cradlepoint.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Applegate <dapplegate@cradlepoint.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Firstly assuming that 2000 is a typo. It should be 20000.

This will probably do a one-to-one port mapping but that mapping will
be dynamic, depending on which port comes first.
so it could be
100.0.0.1:30003 > 192.168.0.5 : 10000
100.0.0.1:30001 > 192.168.0.5 : 10001
100.0.0.1:33567 > 192.168.0.5 : 10002

Just depending on what order the traffic comes and what is the next
free port (Probably?)!

-Akshat

On Wed, Aug 5, 2015 at 10:19 PM, Doug Applegate
<dapplegate@cradlepoint.com> wrote:
> Hello,
>
> After testing and looking at the kernel source, I realize that this mapping:
>
> iptables -t nat -I PREROUTING -p tcp -m tcp --dport 30000:40000 -j DNAT --to
> [local_ip]:10000-2000
>
> Doesn't do a one-to-one port mapping
> e.g.:
> 100.0.0.1:30000 > 192.168.0.5:10000
> 100.0.0.1.30001 > 192.168.0.5:10001
> 100.0.0.1.30002 > 192.168.0.5:10002
>
> I was wondering if it was possible to do the 1:1 port range forwarding to
> different port ranges or if you have to use individual rules.
>
> Thanks
>
> Doug
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
