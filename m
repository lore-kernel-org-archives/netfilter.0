From: Nguyen Dinh Nam <64vn@cardvn.net>
Subject: Re: using bandwidth from multiple adsl supply connections
Date: Thu, 24 Feb 2005 23:29:51 +0700
Message-ID: <421E00FF.8030209@cardvn.net>
References: <20050224151549.2219.qmail@web60408.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050224151549.2219.qmail@web60408.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ads nat <adsnat@yahoo.com>
Cc: netfilter@lists.netfilter.org

usually, this problem is discussed on lartc mailing list, I've written a 
tutorial on it, it may be useful to you
http://selab.edu.ms/twiki/bin/view/Networking/MultihomedLinuxNetworking

ads nat wrote:

>Hi,
>I am using Redhat 9 linux server.
>I have 3 ethernet cards cards having
>
>eth0 Static Ip address.
>eth1 192.168.0.1 gateway for subnet 192.168.0.0.
>eth2 10.0.0.1 gateway for subnet 10.0.0.0.
>
>I have setup two adsl connections for ethernet card
>for eth0 (ppp0) and for eth1 (ppp1).
>
>I am getting dialup supply from two different ISPs for
>eth0 (ppp0) and eth1(ppp1).
>
>I want to pass supply from eth0 (ppp0) to subnet
>192.168.0.0 and supply from eth1 (ppp1) to subnet
>10.0.0.0.
>But it seems supply from eth0(ppp0) goes to both
>subnets. Supply from eth1 (ppp1) is not going to
>subnet 10.0.0.0. 
>
>Any idea how to achieve this OR any tutorial OR Howto
>for this.
>Help appreciated.
>Thanks for supports.
>
>
>
>	
>		
>__________________________________ 
>Do you Yahoo!? 
>Yahoo! Mail - You care about security. So do we. 
>http://promotions.yahoo.com/new_mail
>
>
>  
>


