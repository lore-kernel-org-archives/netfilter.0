From: George Garvey <tmwg-netfilter@inxservices.com>
Subject: Re: NAT not working on one of 3 firewalls
Date: Mon, 24 Jun 2002 15:46:35 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020624154635.D868@inxservices.com>
References: <20020624113121.B868@inxservices.com> <20020624192531.RSTF295.mta03-svc.ntlworld.com@there> <20020624124208.C868@inxservices.com> <20020624204237.JDLG2755.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020624204237.JDLG2755.mta05-svc.ntlworld.com@there>; from Antony@Soft-Solutions.co.uk on Mon, Jun 24, 2002 at 09:42:35PM +0100
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org, Antony@Soft-Solutions.co.uk

On Mon, Jun 24, 2002 at 09:42:35PM +0100, Antony Stone wrote:
> On Monday 24 June 2002 8:42 pm, George Garvey wrote:

> How were you doing the logging ?   Was it in the POSTROUTING chain, after the 
> rule which would change the address ?   If the LOG line was any earlier than 
> that, then you would still see the original source address...

   It was before the NAT rule. I also logged the OUTPUT chain. But since
it has come up, I'll get better information. I was just logging to try
and get a better understanding of how iptables worked, since I was
having problems.

> I see (from the bit I've chopped out of your ip output) that you still have 
> the IPsec stuff in there - I'll assume for the time being that that's not 
> interfering with things in any way ?
   That's from the kernel itself. This is FreeS/WAN. I've not run their
script to activate it, on either side of the tunnel.

> However, I do not recognise what the "withvan" device is doing.   I assume 
> it's the GRE stuff that you're trying to debug here, so if I asked you to get 
> rid of it, that wouldn't help solve the problem ?   Maybe someone else on the 
> list has more experience of GRE stuff than me, so can offer some advice here ?
   Yes, that is the tunnel. I'm at the other end of the tunnel from the
box, so I need it to access the box in question, or need to go where it
is physically. With some work I could do this with only ssh and remove
the tunnel completely. I'll try that.
   I'm not trying to debug the GRE tunnel. Its working fine. I'm trying
to find out why packets from other computers on the LAN (eth0 on the
firewall in question) whose gateway is this firewall, send packets to
the internet and don't get replies. I don't even see reply packets
coming in to the firewall computer itself being logged. That's why I
came up with the theory that the NAT line wasn't working, and they were
going out with their source still set to the 192.168.2 address.
   As I said, I'll put some specific logging in just for this, so
perhaps the box won't drop logging information, and see what happens.

> Any chance you can put another machine running ethereal or similar on the 
> eth1 interface and see what's really coming out of the box ?
   Yes. It will take me a bit of time, but I'll do it.



   I was really, really, wrong, fortunately. The outgoing NAT is
working. I tried, on a computer connected by LAN, "telnet 152.2.210.81
ftp". It hung. I did "cat /proc/net/ip_conntrack|grep 152.2.21.18":

tcp      6 55 SYN_RECV src=192.168.2.3 dst=152.2.210.81 sport=32807 dport=21 src=152.2.210.81 dst=66.123.115.210 sport=21 dport=32807 use=1 

So, I guess it is the input chain that's giving me the problems. Does
that seem right?

