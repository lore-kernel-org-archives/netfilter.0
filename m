From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to enable delivering of SMTP mail?
Date: Tue, 1 Oct 2002 20:00:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021001190006.XHUI459.mta02-svc.ntlworld.com@there>
References: <20021001181302.31190.qmail@hm36.locaweb.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021001181302.31190.qmail@hm36.locaweb.com.br>
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

On Tuesday 01 October 2002 7:13 pm, Luis Fernando C. Talora wrote:

> I'd like some help to enable smtp packets form Internet servers to reach my
> smtp server, on the internal networks. I don't know which ports
> combinations are involved in the process:
>
>      (External -> Internal)
>       highports -> 25
>       25 -> 25
>       25 -> highports (not probable)
>
> Could someone help-me, please?

Allow access from anything outside, any port, to TCP port 25 on your internal 
mail server.

Allow replies either with the standard ESTABLISHED,RELATED rule, or else from 
your internal mail server, TCP port 25, to anywhere outside.

For example:

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p tcp --dport 25 -d a.b.c.d -j ACCEPT

where a.b.c.d is the internal address of your mailserver.

Note that a.b.c.d should be the internal address of your mailserver even if 
you have a PREROUTING DNAT rule to convert some public IP address to some 
private IP address for that machine.   It's the real address of the machine 
you need to put inthe FORWARD rule.

Antony.

-- 

Normal people think "if it ain't broke, don't fix it".
Engineers think "if it ain't broke, it doesn't have enough features yet".

