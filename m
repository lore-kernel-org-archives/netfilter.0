From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: NFLOG Performance issues ...
Date: Fri, 1 Sep 2017 00:09:45 +0530
Message-ID: <CAA5aLPgAktg8etg=Zq0ihbcTB0F9MyDf_KQaVRNHQi-ubWdJXQ@mail.gmail.com>
References: <CAA5aLPgoCdJcFZk0iScnNXNPjv04XbkFEdfAjpwq32u4xd8zPg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=Uem4S4GZpiNqQN5OENvCLI77mQTKEH4yHQKpFYF2suQ=;
        b=j0Uk82ybtoOB8aV1cewEBmIdzbExL7+et9GLuF0L86YkNrUIApwhG9DpEKC0RFuF9/
         VqLxyTDDsRMTQxyGatfOhmJFY8u9KaiSzpSsCoMknuz2QKib420FN8NUVuBo1sesS/Hr
         7599ow6eJsPRyH3vUXYI/lxDPY4uIDfZHrwJdOOUlR9hFnfx8QuObPkyo6baunBONCWf
         SlBtZapIHQWXGKcwpVTLVQkltvFRjOxpHItPwo1rW/0ad0aB5FObGn6xBk88LamufF9D
         IquMAxl7j6cys3TkzCJ7YmosFXJCrEEljGa6U62cohnsENGU2dJvtx06Y8os857vU3M0
         uLiQ==
In-Reply-To: <CAA5aLPgoCdJcFZk0iScnNXNPjv04XbkFEdfAjpwq32u4xd8zPg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Please help .... I hope I am not alone!!!

On 8/30/17, Akshat Kakkar <akshat.1984@gmail.com> wrote:
>  am using ulogd2 to log iptables activity.
> However, when using pgsql as output plugin ... performance is very
> very sluggish. (~130-150 entries per second)
>
> To enhance performance I am trying
>
> modprobe ipt_ULOG nlbufsiz=65535 flushtimeout=1000
>
> but this gives error : ipt_ULOG module not found.
>
>
> On the same lines, I tried
>
> modprobe ipt_NFLOG nlbufsiz=65535 flushtimeout=1000
> It didnt give any error !!!
>
> But still there is no increase in performance.
> Are these values effective?
>
> I am also using  --nflog-threshold 50 in iptables rule.
>
> I am setting buffer_size as
> netlink_socket_buffer_size=104857600
> netlink_socket_buffer_maxsize=1048576000
>
> When running ulog, it gives message of setting buffer size as
> 21708600. Though it didnt give any message like
> "ulogd_inppkt_NFLOG.c:443 We are losing events, increasing buffer size
> to xxxxxx"
> but again why it is only setting buffer size as 21708600 though I have
> set in config as 104857600?
>
