From: David Hawke <dvh@pl.net>
Subject: Re: Printing through firewall
Date: Fri, 31 May 2002 20:13:30 +1200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CF730AA.2020807@pl.net>
References: <F1140wZDyDG742l3ew10000adae@hotmail.com> <200205310723.g4V7NHA23529@Networker.rockstone.co.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org



Antony Stone wrote:

>On Friday 31 May 2002 6:23 am, Dick Ah wrote:
>
>  
>
>>Hi,
>>I have been examining the possibility of allowing some external hosts
>>(red-hat 6.2 with lpd)to print to some of our internal printers
>>(HP-JetDirect) through my firewall in company which firewall machine is
>>red-hat 7.2 using iptables . Anyone knows which ports need to be open??
>>    
>>
Depends on the printer / printing system

What about using cups on the firewall and ipp (port 631). Cups can then 
see the print queues on other machines or network printers.

-- 
-----------------------------------------------------------------------
David Hawke                                     Ph:  +64-9-624 2242
mailto:dvh@pl.net (Home)                        Fax: +64-9-624 2236
mailto:David.Hawke@genaware.com (Work)          Mob:  0-21-995 773




