From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: ip_forward file
Date: Fri, 5 Jul 2002 08:12:20 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA22B@JUPITER>
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
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, iptables <netfilter@lists.samba.org>

Redhat uses it's /etc/sysconfig/network file to save that stuff.. 

IE..

FORWARD_IPV4=yes


thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Thursday, 04 July 2002 11:17 PM
To: iptables
Subject: Re: ip_forward file


On Thursday 04 July 2002 2:16 pm, Denis JULIEN wrote:

> Hi,
> In order to validate the routing of my Red hat linux (7.2) I have to do an
> echo "1" > /proc/sys/net/ipv4/ip_forward.
> But every time that I restart the network service the ip_forward file
> returns to the "0" value and my server does not route any more.
> How can I do to keep the ip_forward set to "1"?

Put the command:
echo "1" > /proc/sys/net/ipv4/ip_forward
into one of your startup scripts (preferably after setting the firewall 
rules).

 

Antony.

