From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: Block MSN Messenger & Yahoo Messenger
Date: Thu, 11 Dec 2003 00:25:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071120305.2091.535.camel@alpha.newkirk.us>
References: <01a301c3bf7f$cb941fe0$7700000a@lawrencewin2k>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01a301c3bf7f$cb941fe0$7700000a@lawrencewin2k>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Lawrence Tang <ingsiong@daltron.com.pg>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Wed, 2003-12-10 at 19:43, Lawrence Tang wrote:
> Hi,
>     I have an RH9 with NAT access for the client. I would like to
> block MSN & Yahoo messenger from the client to access.
>     Can any body advice me ? Thanks in advance.
>  
> Best Regards,
>  
> Lawrence Tang 

For MSN I've successfully used these three rules:

iptables -A FORWARD -p tcp --dport 1863 -j DROP
iptables -A FORWARD -d 207.46.110.0/25 -j DROP
iptables -A FORWARD -d 207.46.104.20 -j DROP


For Yahoo IM, you need to block access to ALL servers.  The list below
is probably no longer complete, if it ever was, but:

/sbin/iptables -A FORWARD -d 63.216.136.22     -j DROP
/sbin/iptables -A FORWARD -d 66.135.224.142    -j DROP
/sbin/iptables -A FORWARD -d 66.136.175.132    -j DROP
/sbin/iptables -A FORWARD -d 66.163.168.105    -j DROP
/sbin/iptables -A FORWARD -d 66.163.172.117    -j DROP
/sbin/iptables -A FORWARD -d 66.163.173.76     -j DROP
/sbin/iptables -A FORWARD -d 66.163.173.77     -j DROP
/sbin/iptables -A FORWARD -d 66.163.173.78     -j DROP
/sbin/iptables -A FORWARD -d 66.163.173.203    -j DROP
/sbin/iptables -A FORWARD -d 66.163.175.128    -j DROP
/sbin/iptables -A FORWARD -d 66.163.178.78     -j DROP
/sbin/iptables -A FORWARD -d 204.71.200.36     -j DROP
/sbin/iptables -A FORWARD -d 204.71.200.37     -j DROP
/sbin/iptables -A FORWARD -d 204.71.201.134    -j DROP
/sbin/iptables -A FORWARD -d 204.71.201.141    -j DROP
/sbin/iptables -A FORWARD -d 216.136.173.172   -j DROP
/sbin/iptables -A FORWARD -d 216.136.173.179   -j DROP
/sbin/iptables -A FORWARD -d 216.136.175.132   -j DROP
/sbin/iptables -A FORWARD -d 216.136.175.142   -j DROP
/sbin/iptables -A FORWARD -d 216.136.175.143   -j DROP
/sbin/iptables -A FORWARD -d 216.136.175.144   -j DROP
/sbin/iptables -A FORWARD -d 216.136.175.145   -j DROP
/sbin/iptables -A FORWARD -d 216.136.175.145   -j DROP
/sbin/iptables -A FORWARD -d 216.136.175.226   -j DROP
/sbin/iptables -A FORWARD -d 216.136.224.134   -j DROP
/sbin/iptables -A FORWARD -d 216.136.224.142   -j DROP
/sbin/iptables -A FORWARD -d 216.136.224.213   -j DROP
/sbin/iptables -A FORWARD -d 216.136.224.213   -j DROP
/sbin/iptables -A FORWARD -d 216.136.224.214   -j DROP
/sbin/iptables -A FORWARD -d 216.136.225.12    -j DROP
/sbin/iptables -A FORWARD -d 216.136.226.117   -j DROP
/sbin/iptables -A FORWARD -d 216.136.226.118   -j DROP
/sbin/iptables -A FORWARD -d 216.136.226.209   -j DROP
/sbin/iptables -A FORWARD -d 216.136.226.210   -j DROP
/sbin/iptables -A FORWARD -d 216.136.227.168   -j DROP
/sbin/iptables -A FORWARD -d 216.136.233.129   -j DROP
/sbin/iptables -A FORWARD -d 216.136.233.130   -j DROP
/sbin/iptables -A FORWARD -d 216.136.233.131   -j DROP
/sbin/iptables -A FORWARD -d 216.136.233.133   -j DROP
/sbin/iptables -A FORWARD -d 216.136.233.135   -j DROP
/sbin/iptables -A FORWARD -d 216.136.233.148   -j DROP
/sbin/iptables -A FORWARD -d 216.136.233.151   -j DROP
/sbin/iptables -A FORWARD -d 216.136.233.152   -j DROP

j



