From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I need help , please
Date: Fri, 5 Jul 2002 17:00:24 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207051600.g65G0V802444@vulcan.rissington.net>
References: <002701c2242f$9498cd20$0a01a8c0@ed> <015601c22405$f21c42d0$8703000a@aid.inf.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <015601c22405$f21c42d0$8703000a@aid.inf.cu>
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

On Friday 05 July 2002 10:25 am, david wrote:

> OK , I agree.In fact I  am just trying.
> I heve tested a simpler script :
>
> # Standard default policies
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT DROP
>
> am here you have the output.
> /etc/rc.d/init.d/iptables : command not found
> iptables: bad police name
> iptables: bad police name
> iptables: bad police name
> /etc/rc.d/init.d/iptables : command not found

Do you have . in your path ???   It looks to me as though you're in 
/etc/rc.d/init.d when you type this, and it's trying to run the iptables 
script in the local directory instead of the iptables binary in /sbin

What happens if you cd to /root and type
iptables -P INPUT DROP

 

Antony.

