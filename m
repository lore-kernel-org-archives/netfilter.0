From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: alias interfaces
Date: Fri, 18 Oct 2002 23:21:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021018222136.LTNE27697.mta05-svc.ntlworld.com@there>
References: <03c701c276c2$388fb3f0$13c01dd0@shadowfax> <20021018200136.RFJF459.mta02-svc.ntlworld.com@there> <041501c276e7$489b5ea0$13c01dd0@shadowfax>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <041501c276e7$489b5ea0$13c01dd0@shadowfax>
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
To: netfilter <netfilter@lists.netfilter.org>

On Friday 18 October 2002 9:45 pm, Mario Antonio wrote:

> Antony,
>
> I add the following rule:
> /usr/local/sbin/iptables -A INPUT   -j LOG --log-prefix "IPTABLES-IN "
>
> And I get the following message, While triyng to access through port 80:
>
> Oct 18 16:30:00 web_2 kernel: IPTABLES-IN IN=eth0 OUT=
> MAC=00:06:5b:8c:72:5f:00:b0:d0:15:1d:37:08:00 SRC=10.10.10.19
> DST=10.10.13.227 LEN=48 TOS=0x00 PREC=0x00 TTL=128 ID=34547 PROTO=TCP
> SPT=1799 DPT=80 WINDOW=65520 RES=0x00 SYN URGP=0
>
> Any clue?
> How can this log tell me that that packet was blocked?

Log entries do not tell you whether the packet is accepted, dropped, 
rejected, or whatever.   They simply record the fact that the packet was seen 
at the position in the ruleset where you have your logging rule.

It is the rule/s which come after that (or the default policy) which 
determines what actually happens to the packets.

What netmask do you have on your machines ?

Antony.

PS: Please answer to the list.

-- 

Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Nobel Prizewinner in Physics

