From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables question - how to securely allow *just* outgoing smtp
Date: Fri, 21 Jun 2002 16:35:31 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206211535.g5LFZbU03196@vulcan.rissington.net>
References: <20020621083228.A21833@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020621083228.A21833@spawar.navy.mil>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Friday 21 June 2002 4:32 pm, Christian Seberino wrote:

> My firewall does *not* need or use any
> rules on INPUT and OUTPUT chains
> since it just *FORWARD*s packets to/from
> private LAN.....
>
> I'd like to install Tripwire on firewall
> and have firewall *email* me daily of status.....
>
> How can I securely *open* up firewall rules
> to allow me to just email out without
> compromising security???

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -A OUTPUT -p tcp --dport 25 -d aa.bb.cc.dd -j ACCEPT
iptables -A INPUT -p tcp --sport 25 -s aa.bb.cc.dd -m state --state 
ESTABLISHED,RELATED -j ACCEPT

where aa.bb.cc.dd is the IP address of your mail server.

 

Antony.

