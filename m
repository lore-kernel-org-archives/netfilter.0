From: Tom Eastep <teastep@shorewall.net>
Subject: Re: Major NAT Problem
Date: Tue, 10 Feb 2004 16:04:30 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402101604.30891.teastep@shorewall.net>
References: <Sea2-F19kyCKDkb9pPF00000901@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Sea2-F19kyCKDkb9pPF00000901@hotmail.com>
Content-Disposition: inline
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
To: Ted Erickson <tederickson7582@hotmail.com>, netfilter@lists.netfilter.org

On Thursday 05 February 2004 06:54 pm, Ted Erickson wrote:
> I am somewhat new to IPTables but not to linux.  I have a major problem.
> Some background first... I have a PPoA SDSL connection with Qwest running
> at 640k/up/down.  I have a static block of 8 addresses.....I have a
> connection from the DSL modem to eth0 on my Redhat 9.0 box and I have my
> local network pluged into eth1.  The only thing running on the linux box is
> IPTables nothing else.  I turned on echo 1 > /proc/sys/net/ipv4/ip_forward
> and enabled MASQ in several different ways..... no problem.  I can surf the
> internet just fine on my local network machine but I have ONE BIG
> PROBLEM!!! I can't view a handfull of websites.  If I take the linux box
> out of the picture and throw a cheap Linksys Router on the same DSL
> connection I can see all the web sites i want.  IPTables is blocking
> something but I don't know what? I can't find any info on the web with this
> problem.  I need to fix this ASAP or I will have to go with something else,
> but I want to stay with linux.

Try adding the rule:

iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN \
   -j TCPMSS --clamp-mss-to-pmtu

-Tom
-- 
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net



