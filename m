From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Masquerading problems (fix)
Date: Wed, 3 Jul 2002 10:23:30 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207030923.g639NfU28696@vulcan.rissington.net>
References: <200207030613.59855.davidgr@interlap.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200207030613.59855.davidgr@interlap.com.ar>
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

On Wednesday 03 July 2002 7:13 am, David Gaston Rodriguez wrote:

> Sorry! i wrote bad. here is the correction:
> Hi!, i am new in the list, i am from argentina, this is mi problem:
> I have a small LAN with a server doing masquerading, I used the kernel
> 2.2.20 and did not have any problem, now i decided to use the kernel
> 2.4.18, i set iptables to make the masquerading, but now there are web
> pages which i can NOT enter from workstations, like for example
> www.mixmail.com or www.yahoo.com, and from the server i can enter to this
> pages. I using 2 interfaces, eth0: external, eth1: internal, the external
> interface is connect to ADSL Modem (PPPoE).
> Some idea on as could be mi problem?
> Thanks!!

I have two suggestions for this problem:

1. Do you have a rule allowing ESTABLISHED and RELATED packets from the 
remote server back to the workstations (possibly some ICMP stuff such as 
fragmentation) ?

2. Check the MTU on your PPPoE and eth1 - I've heard about people using PPPoE 
having a problem with different MTUs on either side of the firewall - I think 
the solution was to clamp the larger one down to be the same value as the 
smaller one ?   Maybe someone else who who uses PPPoE or knows more about 
this problem can be more specific ?

Hope this helps,

 

Antony.

