From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: NAT and log traffic
Date: Wed, 15 Jan 2003 16:08:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019AC2@hslex01.hslbz.local>
References: <5.2.0.9.0.20030115122833.08dbb520@imap4.plugit.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.0.9.0.20030115122833.08dbb520@imap4.plugit.net>
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
To: netfilter@lists.netfilter.org

> I have made two NAT box for a special dialup server.
> I have create an iptables stratup script like that..
> 
> /usr/local/sbin/iptables -t nat -A POSTROUTING -s 
> 10.20.2.0/23 -o eth0 -j SNAT --to PUBLIC-IP1 
> /usr/local/sbin/iptables -t nat -A POSTROUTING -s 
> 10.20.4.0/23 -o eth0 -j SNAT --to PUBLIC-IP2 
> /usr/local/sbin/iptables -t nat -A POSTROUTING -s 
> 10.20.6.0/23 -o eth0 -j SNAT --to PUBLIC-IP3 
> /usr/local/sbin/iptables -t nat -A POSTROUTING -s 
> 10.20.8.0/23 -o eth0 -j SNAT --to PUBLIC-IP4 
> /usr/local/sbin/iptables -t nat -A POSTROUTING -s 
> 10.20.10.0/23 -o eth0 -j SNAT --to PUBLIC-IP5 
> /usr/local/sbin/iptables -t nat -A POSTROUTING -s 
> 10.20.12.0/23 -o eth0 -j SNAT --to PUBLIC-IP6 
> /usr/local/sbin/iptables -t nat -A POSTROUTING -s 
> 10.20.14.0/23 -o eth0 -j SNAT --to PUBLIC-IP7
>
> and so on..
> 

Is that /23 or /24 ?

> 
> Now.. i need to LOG all the traffic that transit over the 
> rules.. I need to log at least PUBLIC-IPX and DESTINATION-IP.
> 
> A friend of that mailing list wrote me back and told..
> 
> change your string like that 
> 
> /usr/local/sbin/iptables -t nat -A POSTROUTING -s 
> 10.20.0.0/23 -o eth0 -j 
LOG --log-level debug --log-prefix 
> "POSTRT: " /usr/local/sbin/iptables -t nat -A POSTROUTING -s 
> 10.20.0.0/23 -o eth0 -j SNAT --to PUBLIC-IP1

I think that 10.20.0.0/23 does not cover all of 10.20.2.0/23,
10.20.4.0/23, etc...
If you're trying to capture all the nets into 1 rule then you'd need a
mask of 10.20.0.0/255.255.0.0, which is 10.20.0.0/16.


Rob


