From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Masquerading problems
Date: Wed, 3 Jul 2002 10:33:15 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207030933.g639XMU28761@vulcan.rissington.net>
References: <200FAA488DE0D41194F10010B597610D2BA1F8@JUPITER>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200FAA488DE0D41194F10010B597610D2BA1F8@JUPITER>
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

On Wednesday 03 July 2002 10:28 am, George Vieira wrote:

> All you really need is to POSTROUTE the workstations..
>
> With PPPoE do this..
>
> INTSN="192.168.1.0/24"
> IPTABLES=/sbin/iptables
> EXTDEV="`adsl-status | grep "Link encap"  | awk {'print $1'}"
> $IPTABLES -A POSTROUTING -o $EXTDEV -t nat -s $INTSN -d $ANYWHERE -j
> MASQUERADE

Surely if this were David's problem, his workstations wouldn't be able to 
access any external servers, whereas his problem report seems to suggest that 
it is only certain websites which he cannot contact (and therefore others 
which he can ?)

Maybe this is my error in interpretation, and the solution is as simple as 
you suggest...

 

Antony.

> -----Original Message-----
> From: David Gaston Rodriguez [mailto:davidgr@interlap.com.ar]
> Sent: Wednesday, 03 July 2002 3:08 PM
> To: netfilter@lists.samba.org
> Subject: Masquerading problems
>
>
> Hi!, i am new in the list, i am from argentina, this is mi problem:
> I have a small LAN with a server doing masquerading, I used the kernel
> 2.2.20 and
> did not have any problem, now i decided to use the kernel 2.4.18, i set
> iptables
> to make the masquerading, but now there are web pages which i can enter
> from
>
> workstations, like for example www.mixmail.com or www.yahoo.com, and from
> the server
> i can enter to this pages. I using 2 interfaces, eth0: external, eth1:
> internal, the
> external interface is connect to ADSL Modem (PPPoE).
> Some idea on as could be mi problem?
> Thanks!!

