From: Florian Westphal <fw@strlen.de>
Subject: Re: Trying to provision flowtable returns error
Date: Thu, 5 Nov 2020 16:38:22 +0100
Message-ID: <20201105153822.GE15770@breakpoint.cc>
References: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
 <CANf9dFMdBgdn5k9fd5QX15kiAbVhQFqAfOBXUj64=wy6a9buBg@mail.gmail.com>
 <20201105005345.GA4263@dimstar.local.net>
 <CANf9dFMFqjp7MJQy5B52sz3PVc5wm5DWRMrKKGKtqL9n6rXWYw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANf9dFMFqjp7MJQy5B52sz3PVc5wm5DWRMrKKGKtqL9n6rXWYw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Gignac <martin.gignac@gmail.com>
Cc: netfilter@vger.kernel.org

Martin Gignac <martin.gignac@gmail.com> wrote:
> Hi Duncan,
> 
> 
> > What may be missing is a required kernel module. Does 'lsmod' show
> > 'nf_flow_table' and 'nf_flow_table_inet'?
> >
> > Also, what is you kernel version?
> 
> I actually observed the issue on both a Fedora 30 Server node (kernel
> 5.6.13-100.fc30.x86_64) and a RHEL8 node (kernel
> 4.18.0-147.8.1.el8_1.x86_64), but just to be sure I just installed a
> brand new Fedora 33 Server VM with the latest DNF updates and tried
> again using the example at
> https://www.kernel.org/doc/Documentation/networking/nf_flowtable.txt
> verbatim:
> 
>     [root@localhost ~]# cat toto.nft
>     table inet x {
>     flowtable f {
>         hook ingress priority 0; devices = { eth0, eth1 };

eth0 and eth1 must exist.

>     Linux localhost.localdomain 5.8.17-300.fc33.x86_64 #1 SMP Thu Oct
> 29 15:55:40 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

Fedora 33 works fine, i tested it a minute ago.
