From: Jim Cliver <jclive@mtaonline.net>
Subject: Re: iptables 1.2.9. Help me!
Date: Wed, 10 Mar 2004 09:44:32 -0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <404F6210.9000502@mtaonline.net>
References: <20040310044739.62422.qmail@web41304.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040310044739.62422.qmail@web41304.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tuan nguyen hoang anh <nguyen_hoang_anh_tuan@yahoo.com>
Cc: netfilter@lists.netfilter.org

Tuan nguyen hoang anh wrote:
> i'm using RedHat 9 and iptables 1.2.7a, but i want to upgrade to 
> iptables 1.2.9
> When i compile it then errors occur:
>  
> 
> *[root@localhost iptables-1.2.9]# make KERNEL_DIR=/usr/sr/linux-2.4*
> 

Hello Tuan,

Could it be the 'c' missing from the source 'src' directory in your 
KERNEL_DIR=/usr/sr/linux-2.4* statement.

jim


