From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPTABLES NewBie
Date: Thu, 12 Sep 2002 14:54:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209121354.g8CDssv10202@vulcan.rissington.net>
References: <5.1.0.14.2.20020912090056.012e6d48@linda> <200209121022.g8CAMTv09831@vulcan.rissington.net> <052701c25a4f$eb00a740$7cfcc5cb@humanpc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <052701c25a4f$eb00a740$7cfcc5cb@humanpc>
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
To: netfilter@lists.samba.org

On Thursday 12 September 2002 12:31 pm, HareRam wrote:

> can i have small example how do i enable only register MAC to allow all
> Services
> rest all should deny directly

I suggest you create a special user-defined chain for MAC address matching, 
and call it near the top of your FORWARD chain:

iptables -N macmatch

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -j macmatch
... other FORWARDing rules allowing specific protocols etc ...

iptables -A macmatch -m mac --mac-source 00:11:22:33:44:55 -j RETURN
iptables -A macmatch -m mac --mac-source 11:22:33:44:55:66 -j RETURN
iptables -A macmatch -m mac --mac-source 22:33:44:55:66:77 -j RETURN
iptables -A macmatch -j DROP

where the macmatch rules list all your permitted MAC addresses.

The reason for putting the jump to the macmatch chain after the ESTABLISHED, 
RELATED rule in your FORWARD chain is so that MAC matching is only done on 
the first packet of each connection - if that is accepted then there's no 
need to do all the checking again for every other packet in the connection.

Antony.

-- 

Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

