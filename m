From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: ipchains to iptables NAT/MASQ conversion question.
Date: Thu, 4 Jul 2002 08:38:30 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA205@JUPITER>
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

>The FORWARD chain in IPtables allows or blocks packets going through the 
>firewall, nothing to do with NAT.
Be careful though, the packet DOES pass through FORWARD still and eventually
gets to POSTROUTING so it is related to some extent... But as you said, not
part of NAT.

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Thursday, 04 July 2002 8:28 AM
To: netfilter@lists.samba.org
Subject: Re: ipchains to iptables NAT/MASQ conversion question.


On Wednesday 03 July 2002 10:27 pm, Karl Kopper wrote:



Antony.

