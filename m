From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: conntrack-tools
Date: Mon, 5 Oct 2009 10:42:48 -0300
Message-ID: <20091005104248.035f2c6f@pulsar.inexo.com.br>
References: <20091002161541.6299954d@pulsar.inexo.com.br>
	<1254736285.22034.7.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1254736285.22034.7.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Thomas Jacob <jacob@internet24.de>

On Mon, 05 Oct 2009 11:51:25 +0200
Thomas Jacob <jacob@internet24.de> wrote:

> Yes ;)
> 
> On Fri, 2009-10-02 at 16:15 -0300, Ethy H. Brito wrote:
> > Hi
> > 
> > Is here the right forum to post about conntrack-tool problem??
> > 
> > Regards

Ok, then. (I am not receiving any posts from the list and I suppose I *AM*
subscribed, and because of this I posted the msg bellow to mr. Ayuso - I
subscribed again, let's see if I receive this post)

Dear mr. Ayuso (now is: Hi all!)

First of all I tried netfilter@vger.kernel.org but, don't know why, my
messages are not getting trough. So I dare to ask for your assistance
directly.

The environment:
  Slackware 12.0
  Kernel 2.6.27.7 SMP PREEMPT
  libnetfilter_conntrack-0.0.100 (configure --prefix=/usr;make;make install)
  conntrack-tools-0.9.13 (ditto)
  libnfnetlink-1.0.0 (ditto)

The situation, as you can see, I only get 0 (zeroes) for various fields
when using conntrack. Could you help me?

root@newquark:~# lsmod
Module                  Size  Used by
nf_conntrack_netlink    17152  0 
nfnetlink               4504  1 nf_conntrack_netlink


root@newquark:~# cat /proc/net/ip_conntrack|head -5
tcp      6 35555 ESTABLISHED src=187.17.33.9 dst=200.225.157.92
sport=52526 dport=80 packets=8 bytes=1051 src=200.225.157.92
dst=187.17.33.9 sport=80 dport=52526 packets=7 bytes=7300 [ASSURED] mark=2
use=1

tcp      6 104308 ESTABLISHED src=187.17.38.47 dst=187.17.47.132 sport=58627 dport=389 packets=1 bytes=52 [UNREPLIED] src=187.17.47.132 dst=187.17.38.47 sport=389 dport=58627 packets=0 bytes=0 mark=2 use=1

tcp      6 21521 ESTABLISHED src=204.61.222.10 dst=200.231.49.57 sport=80 dport=3176 packets=1 bytes=1500 [UNREPLIED] src=200.231.49.57 dst=204.61.222.10 sport=3176 dport=80 packets=0 bytes=0 mark=2 use=1

udp      17 11 src=200.231.49.54 dst=77.49.136.87 sport=63043 dport=45142 packets=1 bytes=131 [UNREPLIED] src=77.49.136.87 dst=200.231.49.54 sport=45142 dport=63043 packets=0 bytes=0 mark=2 use=1

tcp      6 368349 ESTABLISHED src=200.231.49.10 dst=216.163.188.54 sport=61076 dport=25 packets=2 bytes=88 src=216.163.188.54 dst=200.231.49.10 sport=25 dport=61076 packets=1 bytes=44 [ASSURED] mark=2 use=1


root@newquark:~# cat /proc/net/ip_conntrack|grep  0.0.0.0     
root@newquark:~# 


root@newquark:~# conntrack -L |head -5

udp      17 9 src=0.0.0.0 dst=0.0.0.0 sport=0 dport=0 packets=1 bytes=147 src=0.0.0.0 dst=0.0.0.0 sport=0 dport=0 packets=1 bytes=48 mark=2 use=1

tcp      6 35384 src=0.0.0.0 dst=0.0.0.0 sport=0 dport=0 packets=8 bytes=1051 src=0.0.0.0 dst=0.0.0.0 sport=0 dport=0 packets=7 bytes=7300 [ASSURED] mark=2 use=1

tcp      6 104136 src=0.0.0.0 dst=0.0.0.0 sport=0 dport=0 packets=1 bytes=52 [UNREPLIED] src=0.0.0.0 dst=0.0.0.0 sport=0 dport=0 packets=0 bytes=0 mark=2 use=1

tcp      6 48 src=0.0.0.0 dst=0.0.0.0 sport=0 dport=0 packets=2 bytes=96 [UNREPLIED] src=0.0.0.0 dst=0.0.0.0 sport=0 dport=0 packets=0 bytes=0 mark=2 use=1

tcp      6 21350 src=0.0.0.0 dst=0.0.0.0 sport=0 dport=0 packets=1
bytes=1500 [UNREPLIED] src=0.0.0.0 dst=0.0.0.0 sport=0 dport=0 packets=0
bytes=0 mark=2 use=1

Please let me know if you need further info on this.

Best regards

Ethy
