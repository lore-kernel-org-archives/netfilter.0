From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: 1:1 NAT
Date: Tue, 21 Jan 2003 17:41:33 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0301211736270.959@dns.toxicfilms.tv>
References: <001301c2c166$2c7671a0$1e01a8c0@win2k.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001301c2c166$2c7671a0$1e01a8c0@win2k.com>
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
To: Mike <mikeeo@msn.com>
Cc: netfilter@lists.netfilter.org

> What I am trying to do is like how its done on cisco PIX i.e
> "static (inside,outside) 208.15.232.12 192.168.1.167 netmask 255.255.255.255
> 0 0"
iptables -A POSTROUTING -t nat -o EXT -s 192.168.1.167 -j SNAT \
	--to 208.15.232.12
iptables -A PREROUTING -t nat -o EXT -d 208.15.232.12 -j DNAT \
	--to 192.168.1.167

Where EXT is your external interface.

This does:
 - change source address of packets comming out of 192.18.1.167 to
208.15.232.12
 - change destination address of packets comming to 208.15.232.12 to
192.18.1.167

The the packets get routed, and you have 1:1 NAT

You can also change ports, eg. make a world available ftp server on port
21 on 208.15.232.12, that really is on port 17 on 192.18.1.167
This way 192.168.1.167 can have 2 ftp servers, one public, one internal,
on different ports.

It is just an example, maybe you could use things like that.

Regards,
Maciej Soltysiak

