From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Filtering Yahoo Messenger Port
Date: 04 May 2003 22:59:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052103558.32510.24.camel@alpha.newkirk.us>
References: <006e01c3129f$79061e50$6400a8c0@homes>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006e01c3129f$79061e50$6400a8c0@homes>
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
To: Voltaire Pascual <voltaire@voltaire.servebeer.com>
Cc: netfilter@lists.netfilter.org

On Sun, 2003-05-04 at 20:44, Voltaire Pascual wrote:
> Hi there... got one newbie question here. Just wondering how can
> i block yahoo messenger port using IP tables in my box. Clients using
> YM is behind this box.  YM is using all possible ports even port 80.
>  
> TIA
> /Voltaire

IIRC I collected this data from two different locations, honestly can't
attribute proper credit now.

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



