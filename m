From: JeeBak Kim <jbkim@cs.pdx.edu>
Subject: Re: Ineeed of major help with  Dynamic IP Addy for my IPTABLES :(((
Date: Wed, 16 Oct 2002 22:20:11 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021017052011.GA28173@sirius.cs.pdx.edu>
References: <20021017041844.56340.qmail@web40707.mail.yahoo.com> <20021017044848.63963.qmail@web40701.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20021017044848.63963.qmail@web40701.mail.yahoo.com>
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
To: Tasha Smith <natasha3641@yahoo.com>
Cc: netfilter@lists.netfilter.org

* Tasha Smith (natasha3641@yahoo.com) [021016 21:51]:
> Ohh just soo you guys know "was i suppose to do this part to the rc.pump.done
> script": 
> "chmod -u=rwx /etc/rc.d/rc.pump.done" or should i have left that part out?????
> 
> And 1 more thing when i changed in the script
> "sh /etc/init.d/iptables panic "to ----->" /etc/init.d/firewall panic
[snip]
> rm /var/tmp/pump.out
> 
> echo IPADDR=$IPADDR . /etc/rc.d/pump.info

Try changing the . to > in the above line.

> echo NETMASK=$NETMASK >> /etc/rc.d/pump.info
> echo SUBNET_BASE=$NETWORK >> /etc/rc.d/pump.info
> echo SUBNET_BROADCAST=$BROADCAST >> /etc/rc.d/pump.info
> echo GATEWAY=$GATEWAY >> /etc/rc.d/pump.info
> echo HOSTNAME=$HOSTNAME >> /etc/rc.d/pump.info
> echo DHCP_SERVER=$DHCP_SERVER>> /etc/rc.d/pump.info
[snip]

or better yet:

cat << EOF > /etc/rc.d/pump.info
IPADDR=$IPADDR
NETMASK=$NETMASK
SUBNET_BASE=$NETWORK
SUBNET_BROADCAST=$BROADCAST
GATEWAY=$GATEWAY
HOSTNAME=$HOSTNAME
DHCP_SERVER=$DHCP_SERVER
EOF


