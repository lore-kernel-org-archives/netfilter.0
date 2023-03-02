From: Florian Westphal <fw@strlen.de>
Subject: Re: Bug report DNAT destination not work
Date: Thu, 2 Mar 2023 20:40:05 +0100
Message-ID: <20230302194005.GA9239@breakpoint.cc>
References: <CALidq=VJF36a6DWf8=PNahwHLJd5FKspXVJfmzK3NFCxb6zKbg@mail.gmail.com>
 <20230302104337.GA23204@breakpoint.cc>
 <ABA514EB-3C64-4A16-8D07-1318FB9AB63F@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ABA514EB-3C64-4A16-8D07-1318FB9AB63F@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Zaharinov <micron10@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, Pablo Neira Ayuso <pablo@netfilter.org>, netfilter <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org

Martin Zaharinov <micron10@gmail.com> wrote:
> Hi Florian
> 
> 
> i recheck and libxt_DNAT.so is symlink to libxt_NAT.so
> 
> and i try : 
> 
> iptables v1.8.9 (nf_tables)

What did you try?

>   --modprobe=<command>		try to insert modules using this command
>   --set-counters -c PKTS BYTES	set the counter during insert/append
> [!] --version	-V		print package version.
> 
> 
> and show help .

No idea what you did or what you are trying to show.
IFF you ran "iptables -j DNAT --help", then libxt_DNAT is not
found resp. iptables is looking at the wrong place.

$ iptables-legacy -V
iptables v1.8.9 (legacy)
$ iptables -j DNAT --help
[..]
DNAT target options:
 --to-destination [<ipaddr>[-<ipaddr>]][:port[-port[/port]]]
                  Address to map destination to.
[--random] [--persistent]
$

I can only guess what the problem might be.

Maybe 'strace -f -e file iptables -j DNAT --help' will give a clue,
there should be lines like this:

newfstatat(AT_FDCWD, "/usr/lib64/xtables/libipt_DNAT.so", 0x7ffe94e3f180, 0) = -1 ENOENT
newfstatat(AT_FDCWD, "/usr/lib64/xtables/libxt_DNAT.so", {st_mode=S ... = 0
openat(AT_FDCWD, "/usr/lib64/xtables/libxt_DNAT.so", O_RDONLY|O_CLOEXEC) = 4
