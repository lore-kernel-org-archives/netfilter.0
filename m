From: "david" <david@aid.inf.cu>
Subject: Re: I need help , please
Date: Fri, 5 Jul 2002 12:18:47 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <017d01c2240d$599336b0$8703000a@aid.inf.cu>
References: <002701c2242f$9498cd20$0a01a8c0@ed> <015601c22405$f21c42d0$8703000a@aid.inf.cu> <200207051600.g65G0V802444@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org



iptables:Bad built-in change name

david




 ----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.samba.org>
Sent: Friday, July 05, 2002 6:00 PM
Subject: Re: I need help , please


> On Friday 05 July 2002 10:25 am, david wrote:
> 
> > OK , I agree.In fact I  am just trying.
> > I heve tested a simpler script :
> >
> > # Standard default policies
> > iptables -P INPUT DROP
> > iptables -P FORWARD DROP
> > iptables -P OUTPUT DROP
> >
> > am here you have the output.
> > /etc/rc.d/init.d/iptables : command not found
> > iptables: bad police name
> > iptables: bad police name
> > iptables: bad police name
> > /etc/rc.d/init.d/iptables : command not found
> 
> Do you have . in your path ???   It looks to me as though you're in 
> /etc/rc.d/init.d when you type this, and it's trying to run the iptables 
> script in the local directory instead of the iptables binary in /sbin
> 
> What happens if you cd to /root and type
> iptables -P INPUT DROP
> 
>  
> 
> Antony.


