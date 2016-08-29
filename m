From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Libmnl - Adding IPv6 Address in the interface
Date: Mon, 29 Aug 2016 13:40:16 +0200
Message-ID: <20160829114016.GA11200@salvia>
References: <7bf46bb2-c807-6a3e-3447-60e8b9a8cbf2@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7bf46bb2-c807-6a3e-3447-60e8b9a8cbf2@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Khawar Shehzad <shehzad.khawar@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, Aug 29, 2016 at 07:52:34AM +0100, Khawar Shehzad wrote:
>         ifm = mnl_nlmsg_put_extra_header(nlh, sizeof(*ifm));
> 
>         ifm->ifa_family = AF_INET6;
>         ifm->ifa_prefixlen = 64;
>         ifm->ifa_flags = IFA_F_PERMANENT;
>         ifm->ifa_scope = RT_SCOPE_UNIVERSE;
>         /* TODO get interaface name from user or configuration*/
>         ifm->ifa_index = if_nametoindex("eth0");
>         unsigned char eipn[16];
>         inet_pton(AF_INET6, eip, eipn);

eipn should be 'struct in6_addr' instead.

>         mnl_attr_put(nlh, IFA_ADDRESS, 16,eipn);

So this looks like:

          mnl_attr_put(nlh, IFA_ADDRESS, sizeof(eipn), &eipn);
