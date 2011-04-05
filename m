From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Unable to use connbytes
Date: Tue, 5 Apr 2011 22:07:57 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104052205090.30349@obet.zrqbmnf.qr>
References: <BANLkTikOa2JciJ6Lhuh721Oo0qdY50tFKg@mail.gmail.com> <1302032514.1773.859.camel@andybev>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1302032514.1773.859.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: Supratik Goswami <supratiksekhar@gmail.com>, netfilter@vger.kernel.org

On Tuesday 2011-04-05 21:41, Andrew Beverley wrote:

>On Tue, 2011-04-05 at 19:18 +0530, Supratik Goswami wrote:
>> I checked the connbyes support in my Kernel and it shows the following output.
>> 
>> [root@gateway bin]# lsmod |grep connbytes
>> xt_connbytes            6465  0
>> x_tables               17349  11
>> xt_connbytes,xt_MARK,xt_multiport,xt_CLASSIFY,xt_length,xt_state,ipt_REDIRECT,ipt_TOS,xt_tcpudp,iptable_nat,ip_tables
>
>Good, looks like the *kernel* module is loaded.
>
>> When I am trying to use it with iptables I am getting the following error:
>> 
>> iptables v1.3.5: Couldn't load match
>> `connbytes':/lib/iptables/libipt_connbytes.so: cannot open shared
>> object file: No such file or directory
>
>However, looks like your iptables is missing the userspace bit. Not sure
>why that would be, but that's a pretty old iptables version - was the
>connbytes match available back then? Would be worth trying to upgrade
>iptables.

Yes it was available. So not only did it ship an outdated copy (even at 
release time), but also an incomplete one. RHEL just ain't the proper 
platform to run a firewall on.
