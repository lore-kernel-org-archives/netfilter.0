From: Andreas Jellinghaus <aj@dungeon.inka.de>
Subject: Re: allowing certain IP addresses.
Date: 17 May 2003 09:17:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053155828.627.22.camel@simulacron>
References: <75634F04BFCFD511BF69009027DC8649484265@mailman.thenap.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <75634F04BFCFD511BF69009027DC8649484265@mailman.thenap.com>
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
To: Drew Weaver <drew.weaver@thenap.com>
Cc: netfilter@lists.netfilter.org

On Sat, 2003-05-17 at 08:26, Drew Weaver wrote:
> I would like to disclude a /25 from accessing a server except for 1 ip
> address on that /25 this is what I have in my rules.
> 
> /sbin/iptables -A INPUT -i eth0 -s 10.1.0.0/25 -j DUMP
> /sbin/iptables -A INPUT -i eth0 -s 10.1.0.52/32 -j ACCEPT
> 
> the blocking works, the 10.1.0.0/25 network cannot reach this server,
> however the 10.1.0.52/32 cant either.

use
/sbin/iptables -A INPUT -i eth0 -s 10.1.0.52/32 -j ACCEPT
/sbin/iptables -A INPUT -i eth0 -s 10.1.0.0/25 -j DUMP

instead.

filter lists:

private ip addresses: rfc 1918
> /sbin/iptables -A INPUT -i eth0 -s 10.0.0.0/8 -j DUMP   
> /sbin/iptables -A INPUT -i eth0 -s 172.16.0.0/12 -j DUMP
> /sbin/iptables -A INPUT -i eth0 -s 192.168.0.0/16 -j DUMP

loopback
> /sbin/iptables -A INPUT -i eth0 -s 127.0.0.0/8 -j DUMP

multicast, reserved
> /sbin/iptables -A INPUT -i eth0 -s 224.0.0.0/3 -j DUMP 

Andreas


