From: Philip Craig <philipc@snapgear.com>
Subject: Re: Session tracking failure - ssh packets dropped as INVALID
Date: Mon, 11 Feb 2008 12:10:44 +1000
Message-ID: <47AFAEA4.2040202@snapgear.com>
References: <691DA14F-3FD0-4E19-A61C-74F34E095E49@uq.edu.au> <47AEA957.2030707@caf.com.tr> <47AF5BAE.7030700@rtij.nl> <F7BF9AD4-B6CE-4DCB-A2E1-85E16AC38282@uq.edu.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <F7BF9AD4-B6CE-4DCB-A2E1-85E16AC38282@uq.edu.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Zornig <j.zornig@uq.edu.au>
Cc: netfilter@vger.kernel.org

John Zornig wrote:
> echo "1" > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal
> 
> seems to work for my systems. No more INVALID packets.
> 
> Some of the netfilter firewall how-to guides I've found say that  
> ip_conntrack_tcp_be_liberal should never be set on a firewall. So I'm  
> still left wondering if I'm working around a bug and my firewall is  
> not as strict as it should be, or are these how-to's all wrong.

This is just a workaround for a bug.

Are you using a recent kernel?

It would be good to work with Jozsef to get this fixed if you are able
to help debug it.  Also report it on the netfilter-devel list.

To debug, I think the first steps are to enable logging with:

	modprobe ipt_LOG
	echo 255 >/proc/sys/net/netfilter/nf_conntrack_log_invalid

and check your syslog for errors.

Also get a tcpdump of the ssh traffic with something like:

	tcpdump -i eth0 -s 0 -w dump.pcap tcp port 22
