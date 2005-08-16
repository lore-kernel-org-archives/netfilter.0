From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: ftp issue cont.
Date: Tue, 16 Aug 2005 09:56:18 +0200
Message-ID: <43019C22.3060403@mnemon.de>
References: <6c016e56bfd4d0.6bfd4d06c016e5@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6c016e56bfd4d0.6bfd4d06c016e5@vsnl.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

varun_saa@vsnl.net schrieb:

>Thanks Jorg, 
>           I get the following for lsmod : 
> 
>[root@squidserver ~]# lsmod | grep conntrack 
>ip_conntrack           41497  3 ipt_state,ipt_MASQUERADE,iptable_nat 
> 
>So how do I add : 
>  
>           ip_conntrack_ftp         
>           ipt_conntrack     
> 
>And yes it is : 
>               -A FORWARD -j DROP 
> 
>  
>
modprobe ip_conntrack_ftp

If you get an error message, you probably have to reconfigure the
kernel. May I suggest reading some basic Linux tutorial ? You can find
tuts e.g. on http://debian.org and most likely on the home page of your
distribution.

Have a nice time and happy reading,

Joerg



