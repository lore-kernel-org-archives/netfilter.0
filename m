From: Jim Mellander <jmellander@lbl.gov>
Subject: Re: iptables as landmine subnet rejector
Date: Wed, 13 Nov 2013 09:58:13 -0800
Message-ID: <CADju=b6PKTwOmO39YnHSd_6RxMfxgEDPV=jna-NzC2RSZYMSnQ@mail.gmail.com>
References: <CADju=b7zs7uGryLgM-R9_zSohh7Vknr52LL75Xx28dQyeEXgGw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADju=b7zs7uGryLgM-R9_zSohh7Vknr52LL75Xx28dQyeEXgGw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Here's what I ended up doing

*nat
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:PREROUTING ACCEPT [0:0]

# Just fwd to kernel to provide ping response
-A PREROUTING -d a.b.c.d/xx -p icmp --icmp-type echo-request -j REDIRECT

# Forward to a closed port
-A PREROUTING -d a.b.c.d/xx-p tcp -j DNAT --to-destination myhost:aaaa

.... and further down

*filter
# Here, we let the kernel send the RST from the closed port.
-A INPUT -p tcp -d myhost --dport aaaa -j ACCEPT
# This was a test to see if iptables would do a better job
#-A INPUT -p tcp -d myhost --dport aaaa -j REJECT --reject-with tcp-reset




....
For tcp, I tried the simpler
-A INPUT -d a.b.c.d/xx-p tcp -j REJECT --reject-with tcp-reset



.... but that didn't.  I wonder if anyone has any suggestions on how
to do this task more efficiently?  I'm happy with the ping response,
but natting tcp to a closed port seems kludgy.

Thanks in advance






On Thu, Nov 7, 2013 at 3:14 PM, Jim Mellander <jmellander@lbl.gov> wrote:
> Hi all:
>
> I'm working on replacing a freebsd box with custom C code with a linux box.
>
> The code has a configured pcap filter, and does the following with
> traffic that matches the pcap filter.  BTW, the pcap filter is not
> complex, basically 'tcp and (net a.b.c.d/xx or net e.f.g.h/xx)', so
> the equivalent should be easily mappable to iptables rules.
>
> 1. If TCP sends RST back as response (obviously not RST in response to RST)
> 2. Responds to pings, ICMP echo response sent in response to icmp echo request.
>
> I starting porting the code, but it occurred to me that perhaps the
> entire job could be done in iptables using DNAT
>
> 1. Nat the tcp connection and issue a -j REJECT, or redirect to a
> closed port on the the responder host, which will send a RST.
> 2. NAT the icmp echo request
>
> With a bit of experimentation, I'm fairly certain I could work this
> out, but some pointer to get me in the right direction would be
> appreciated.
>
> Thanks in advance.
