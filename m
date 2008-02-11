From: John Zornig <j.zornig@uq.edu.au>
Subject: Re: Session tracking failure - ssh packets dropped as INVALID
Date: Mon, 11 Feb 2008 11:08:34 +1000
Message-ID: <F7BF9AD4-B6CE-4DCB-A2E1-85E16AC38282@uq.edu.au>
References: <691DA14F-3FD0-4E19-A61C-74F34E095E49@uq.edu.au> <47AEA957.2030707@caf.com.tr> <47AF5BAE.7030700@rtij.nl>
Mime-Version: 1.0 (Apple Message framework v915)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47AF5BAE.7030700@rtij.nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

Thanks Martijn,


On 11/02/2008, at 6:16 AM, Martijn Lievaart wrote:

>
> Enabling conntrack_be_liberal seems to have solved the issue for me.
>


echo "1" > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal

seems to work for my systems. No more INVALID packets.

Some of the netfilter firewall how-to guides I've found say that  
ip_conntrack_tcp_be_liberal should never be set on a firewall. So I'm  
still left wondering if I'm working around a bug and my firewall is  
not as strict as it should be, or are these how-to's all wrong.

Regards,
JZ

