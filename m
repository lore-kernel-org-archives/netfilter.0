From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT, SNAT, FORWARD, what i use ?
Date: Fri, 1 Nov 2002 16:25:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211011625.gA1GPBe15063@vulcan.rissington.net>
References: <NGBBLIMDELLHLIKGLDNNEEDBCBAA.leonardo@openware.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NGBBLIMDELLHLIKGLDNNEEDBCBAA.leonardo@openware.com.br>
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

On Thursday 31 October 2002 12:20 pm, Leonardo A. de Camargo wrote:

> I have machines xxx.zzz.yyy.www (conected to internet, via eth0) and a
> 196.10.10.2.

Just out of interest, where did you get that IP address from ?

> They are conected to each other with cable pluged in both eth1.
>
> xxx.zzz.yyy.www is running iptables with drop policy on input, output and
> forward chains.
>
> I have services like telnet and www running on the 196.10.10.2.
>
> I want that a connection, telnet(23) and www(80), to xxx.zzz.yyy.www be
> redirected to 196.10.10.2.

iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j DNAT --to 
196.10.10.2
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p tcp --dport 80 -d 196.10.10.2 -j ACCEPT

This will allow you to contact your internal web server using a browser on 
the Internet, by contacting xxx.zzz.yyy.www

I would tell you how to do the same thing for telnet, but I think you should 
be using SSH instead :-)   Maybe you can work it out from the rules above 
anyway though...

Antony.

-- 

G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

