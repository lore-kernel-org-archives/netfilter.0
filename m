From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Protocol wrong type for socket
Date: Fri, 8 Jul 2011 22:32:09 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107082225430.23703@frira.zrqbmnf.qr>
References: <CAMxMOAtKyKPBk=5Z9kQSpMWw9cwwdCHbSnRSWB5V21eNHF4RAw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMxMOAtKyKPBk=5Z9kQSpMWw9cwwdCHbSnRSWB5V21eNHF4RAw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Christian S. Perone" <christian.perone@gmail.com>
Cc: netfilter@vger.kernel.org

On Friday 2011-07-08 20:11, Christian S. Perone wrote:

>I'm try to run:
>ip6tables -t mangle -A PREROUTING -i eth1 -p icmpv6 --icmpv6-type
>router-advertisement -j TEE --gateway ff02::1 --oif eth0
>
>But ip6tables shows the error:
>ip6tables: Protocol wrong type for socket.
>
>Does anyone knows what could be the problem ? I'm using ip6tables
>1.4.10 (powerpc), this is the strace:

It means the ABIs offered by your kernel have no match with the ABIs 
offered by userspace parts. And this can reasonably only happen with 
TEE: xtables-addons shipped TEE revision 0. When TEE was merged 
upstream, it was done so as revision 1 (as it received an extra 
feature). Subsequently, TEE was disabled from being built by defualt in 
xtables-addons to minimize conflicts, but if it is nevertheless forced 
into the system, you can get the above error. In summary:

- xtables-addons xt_TEE (kernelsp.) offers r0
- xtables-addons libxt_TEE (usersp.) offers r0
- iptables usersp. offers r1
- standard linux kernel offers r1

And you are mixing some of them.
