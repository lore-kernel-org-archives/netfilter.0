From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I need help , please
Date: Thu, 4 Jul 2002 15:53:08 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207041453.g64ErIU32086@vulcan.rissington.net>
References: <001e01c22321$e86018a0$2400a8c0@inq7.net> <002801c22336$32460150$8703000a@aid.inf.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <002801c22336$32460150$8703000a@aid.inf.cu>
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

On Thursday 04 July 2002 9:38 am, david wrote:

> It was a mistake.What I do is
>
> # service iptables save
> after that  I got a new file in /etc/sysconfig/iptables .
> and then :
> #/etc/rc.d/init.d/iptables restart 2>salida8
> .And here you see all the errors.

What rules are you trying to set ?

Have you compiled all the required bits of iptables into the kernel or are 
you loading modules ?

 

Antony.

