From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SNAT of ICMP fragmentation-needed
Date: Sun, 9 Jun 2002 22:59:16 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206092159.g59LxHA25377@Networker.rockstone.co.uk>
References: <Pine.LNX.4.44.0206092348320.8300-100000@albert.ha-vel.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.44.0206092348320.8300-100000@albert.ha-vel.cz>
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

On Sunday 09 June 2002 10:49 pm, jn@angel.cz wrote:

> Hi,
>
> I would like to SNAT icmp fragmentation-needed messages that have source
> address from private network range (RFC1918), I have tried something like:
>
> iptables -t nat  -I POSTROUTING -j SNAT --to real_address -p icmp  \
> --icmp-type fragmentation-needed -s 192.168.0.0/16
>
> but it does not work.

What happens if you put a logging rule immediately before this one:

iptables -I POSTROUTING -t nat -s 192.168.0.0/16 -p icmp --icmp-type 
fragmentation-needed -j LOG --log-prefix "icmp SNAT"

Do you get any packets logged ?

 

Antony

