From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Help!!!
Date: Thu, 23 Jun 2005 07:14:24 -0500
Message-ID: <200506230714.24471.rob0@gmx.co.uk>
References: <14209331.20050623145054@adm.utm.md>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <14209331.20050623145054@adm.utm.md>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: radu <radu@adm.utm.md>
Cc: netfilter@lists.netfilter.org

On Thursday 23 June 2005 06:50, radu wrote:
> why I'm receiving on my PC  packages  with external ip on
> 4690,4544,4581.. ports???

That would be me. I was trying to lure you into posting something on 
this list. ;)

>   Internet -> linux box -> My PC(192.168.50.101)
>
>   linux box
>   eth0 local 192.168.50.0/24
>   eth1 Internet
>
>   my iptables config:
>
> iptables -P FORWARD DROP

good

> iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 4662 -j DNAT
> --to 192.168.50.101

4662/tcp packet arriving at the external interface should have their 
destination changed to Radu's computer ...

> iptables -I FORWARD  -d 192.168.50.101 -p tcp 
> --dport 4662 -j ACCEPT

... and those packets should be accepted.

> iptables -I FORWARD -i eth1 -o eth0 -m state 
> --state ESTABLISHED,RELATED -j ACCEPT

Any replies to established or related connections arriving at the 
external interface, destined to the internal interface, should be 
accepted.

This is surely the rule letting those in. Check the connection tracking 
table when you see them come in.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

