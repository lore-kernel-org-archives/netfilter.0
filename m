From: Myles Uyema <mlists@uyema.net>
Subject: Re: Enabling Samba
Date: Fri, 9 May 2003 10:59:49 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0305091055120.8400-100000@marx.gruntwerk.net>
References: <20030509133627.75bc22ca.info@open2web.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030509133627.75bc22ca.info@open2web.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Tessier <info@open2web.com>
Cc: netfilter@lists.netfilter.org

What are your OUTPUT rules?  It looks like your firewall 192.168.0.254 is 
trying to send broadcast packets (which SMB does) in order to announce 
itself to the rest of the network.

Your INPUT rules look fine, but I would suggest using -i eth1 so that 
Samba is only visible to the ETH1 private lan.

iptables -A OUTPUT -p tcp -p tcp --sport 137:139 -j ACCEPT
iptables -A OUTPUT -p udp -p udp --sport 137:139 -j ACCEPT

UDP port 53 is DNS.  Windows 95/98 will query for a DNS response as well I 
suppose.

On Fri, 9 May 2003, Mark Tessier wrote:

Hi,

I'm running iptables v1.2.1a on Red Hat 7.1 as a gateway/firewall, and have been doing so for the past year without problems. Recently, it has become necessary to run Samba on the server as well. (Note: I realize that it is not recommended to have Samba operating on a firewall, but in my case - a small home/office with limited space for servers - it's the only plausible solution.) Naturally, running a Samba server on a firewall means adding new rules to the rc.firewall script to enable access to the Samba server. I have added the following rules:

# Enable SAMBA ports (TCP/UDP Ports 137-139)

iptables -A INPUT -p tcp -m tcp --dport 137 --syn -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 137 -j ACCEPT

iptables -A INPUT -p tcp -m tcp --dport 138 --syn -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 138 -j ACCEPT

iptables -A INPUT -p tcp -m tcp --dport 139 --syn -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 139 -j ACCEPT

These rules don't work, unfortunately. When I attempt to access the server with my Windows 98 machine, the server starts spewing a bunch of error packets such as:

IN= OUT=eth1 SRC=192.168.0.254 DST 192.168.0.255 LEN=240 TOS=0x00 PREC=0x00 TTL=64 ID=0 PROTO=UDP SPT=138 DPT=138 LEN=220

I also get a strange error packet, as if the Win98 client wants to send UDP packets to the name server from sport 137 to dport 53...

To get Samba working, I have to flush the firewall and restart the Samba servers.

Could anyone recommend rules to get Samba working on my firewall?

Thanks in advance,

Mark




