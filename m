From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Syntax/NAT OUTPUT
Date: Tue, 9 Jul 2002 21:27:03 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020709202705.FPXL290.mta02-svc.ntlworld.com@there>
References: <000801c2279c$6e2364f0$4fcf3cd0@nebuchadnezza>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000801c2279c$6e2364f0$4fcf3cd0@nebuchadnezza>
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
To: iptables-list <netfilter@lists.samba.org>

On Tuesday 09 July 2002 11:59 pm, Tim wrote:

> Scenario: router eth0 to Fwall 192.168.2.2
>                Fwall eth0 from router 192.168.2.1
>                Fwall eth1 from DMZ 172.16.1.1
>                Fwall eth2 from LAN 192.168.1.1
>
> My understanding of concepts of filtering and nat
>
> Pinging from the router eth0 thu Fwall eth2 to LAN, it first goes through
> PREROUTING nat table then the filter INPUT----this the path it takes to get
> to any box in the LAN .....yes ?

No.   Packets only go through the INPUT chain if they are addressed to the 
firewall itself.

If they are being routed through the firewall to something on the other side, 
they go through the FORWARD chain.

You're right about them going through PREROUTING first, though, and they also 
go through POSTROUTING afterwards.

> To get a reply from this ping it must go thru the NAT OUTPUT then filter
> OUTPUT.....this is my understanding of the return path for this ping from
> the router eth0.....is this correct so far ?

The OUTPUT chain is only for packets originating on the firewal itself, so 
unless you type the ping command on the firewall, the OUTPUT chains 
(filtering and nat) are not involved.

 

Antony.

