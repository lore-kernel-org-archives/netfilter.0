From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: hosts.deny
Date: Mon, 8 Jul 2002 09:36:02 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA266@JUPITER>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

spoofed as in local IP coming in from the internet..
this is what I mean..

#-- hosts.allow
ALL: 192.168.0.

#-- iptables
iptables -A INPUT -s 192.168.0.0/24 -i eth1 -j DROP  # eth1=internet

that's some attacks but doesn't stop DOS attacks which hackers end up in the
local machines IP(local access).. that's when you need other software to
protect it (ie. tripwire, etc..)

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Monday, 08 July 2002 9:29 AM
To: netfilter@lists.samba.org
Subject: Re: hosts.deny


On Monday 08 July 2002 12:24 am, George Vieira wrote:

> I thought iptables and linux could block spoofed ips anyway.. this is a
> last resort..

How do you block a spoofed IP ?   How do you know it's spoofed ?

 

Antony

