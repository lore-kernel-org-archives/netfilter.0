From: "David Busby" <busby@pnts.com>
Subject: Re: Exposing Internal Host on Private network to Internet
Date: Mon, 23 Jun 2003 10:26:34 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00b701c339ac$a05f63b0$1100000a@busbydev>
References: <007901c33941$05434ce0$0a00000a@BOBHITT>
Reply-To: "David Busby" <busby@pnts.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Bobby Hitt <Bobby.Hitt@bscnet.com>, netfilter@lists.netfilter.org

A: SNAT/DNAT

Start here: http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-6.html
and read through section 10 then search archives for examples

/B
----- Original Message ----- 
From: "Bobby Hitt" <Bobby.Hitt@bscnet.com>
To: <netfilter@lists.netfilter.org>
Sent: Sunday, June 22, 2003 21:36
Subject: Exposing Internal Host on Private network to Internet


> Hello all,
>
> I have a network using Linux as a gateway/firewall running NAT. This works
> perfectly to allow 5 internal hosts running Windows 2000/XP/Win98/Linux
> access to the Internet. Also the Linux gateway is running openVPN which
> allows me a secure connection to my Linux server in Connecticut for my
> Windows machines.
>
> I have setup a Windows 2000 Server on my network here running VPN server
> that I want to be exposed to the the outside to allow Windows clients
> running the VPN client to access the inside network here via the Windows
> 2000 server. I know I need to route ports 1723 47 for PPTP and 500 and
50-51
> for IPSec to the Windows 2000 Server, but have no idea how to do this with
> iptables.
>
> I used to run a cable router that allowed one host to be exposed to the
> Internet, which is how I want to setup the Linux router.
>
> Any help is appreciated,
>
> Bobby
>


