From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT not working on one of 3 firewalls
Date: Tue, 25 Jun 2002 05:08:32 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020625040834.RLLZ4119.mta06-svc.ntlworld.com@there>
References: <20020624113121.B868@inxservices.com> <20020624204237.JDLG2755.mta05-svc.ntlworld.com@there> <20020624154635.D868@inxservices.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020624154635.D868@inxservices.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Monday 24 June 2002 11:46 pm, George Garvey wrote:

> On Mon, Jun 24, 2002 at 09:42:35PM +0100, Antony Stone wrote:
>
> > Any chance you can put another machine running ethereal or similar on the
> > eth1 interface and see what's really coming out of the box ?
>
>    Yes. It will take me a bit of time, but I'll do it.
>
>
>
>    I was really, really, wrong, fortunately. The outgoing NAT is
> working. I tried, on a computer connected by LAN, "telnet 152.2.210.81
> ftp". It hung. I did "cat /proc/net/ip_conntrack|grep 152.2.21.18":
>
> tcp      6 55 SYN_RECV src=192.168.2.3 dst=152.2.210.81 sport=32807
> dport=21 src=152.2.210.81 dst=66.123.115.210 sport=21 dport=32807 use=1
>
> So, I guess it is the input chain that's giving me the problems. Does
> that seem right?

No, and this comment makes me wonder if you've made a common mistake in 
changing from ipchains to iptables ?

In ipchains, packets going from one side of the firewall to the other had to 
go through the input, forward and output chains; packets going into the 
firewall just went through the input chain.

However, in iptables, the input chain is *only* for packets going in to the 
firewall itself; packets going through it go through the forward chain, but 
not the input or output chains.

If that wasn't your understanding of how packets go through iptables, it 
might be worth you going back to your original ruleset and see if you have 
all the rules you need for packets going through the machine, in your forward 
chain, because that's the only one they'll go through (as well as prerouting 
and postrouting nat chains, of course).

The conntrack entry you've shown above simply tells us that an initial packet 
was received from 192.168.2.3 going to 152.2.210.81 port 21 (ftp control 
port).   It doesn't actually confirm whether that packet left the firewall or 
not, or if it did, how it tried to get to the outside world.   It does 
confirm that no reply came back (syn_recv means first syn packet seen, second 
syn-ack packet expected), but we still don't know why.

I'd still like to see an ethereal output from the eth1 cable, I'm afraid, 
because that's a sure way to know what packets actually go out to the 
Internet.

 

Antony.

