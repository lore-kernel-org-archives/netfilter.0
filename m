From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: newbie question
Date: Thu, 8 Apr 2004 14:09:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040408120948.GJ10272@home.manuelm.org>
References: <004601c41d60$9bf1af70$aa47aacb@hacker>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <004601c41d60$9bf1af70$aa47aacb@hacker>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

* M. Ahmad Ijaz <ahmad@netlogicbroadband.com>  8. Apr 04:
> hi,

Hello,

> modprobe ip_tables
> modprobe ip_conntrack
> modprobe iptable_nat
> modprobe ip_conntrack_ftp
> modprobe ip_nat_ftp
> 
> iptables -P INPUT ACCEPT
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD DROP
> iptables -A INPUT -p icmp --icmp-type 8 -j DROP 
> 
> iptables -A PREROUTING -s xxx.xxx.xxx.xxx/yyy.yyy.yyy.yyy -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080
> 
> where xxx is any IP and yyy is the subnet mask, it returns me the same
> message i.e.  iptables: No chain/target/match by that name

Try

# iptables -t nat -A PREROUTING ...

Rules go into the filter table by default, if not specified otherwise,
but filter has not {PRE,POST}ROUTING.

> also i dont wana load the modules and the commands each time the
> system starts, so when i type the commands i used iptables-save
> command to save tat, also is there ne possibility where i can store
> the command and execute when system startsup

As a script somewhere in /etc/init.d/ and a symlink in
/etc/rc.$defaultrunlevel/.

HTH,
 regards, Frank.
-- 
Sigmentation fault

