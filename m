From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forwarding (continued)
Date: Mon, 8 Jul 2002 03:05:51 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708020553.MITF4119.mta06-svc.ntlworld.com@there>
References: <004b01c2263b$9812cc90$1606d6d1@nebuchadnezza>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <004b01c2263b$9812cc90$1606d6d1@nebuchadnezza>
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

On Monday 08 July 2002 5:54 am, Tim wrote:

> Antony,
>
> INTERNAL IP = 192.168.1.0/24  -- range 1 thru 11
> DMZ IP = 172.16.1.0/24 -- range 1 thru 5
>
> The reason I believe I know it is not forwarding....is that when I ping
> from the DMZ I get a "request time out"

In fact I am fairly sure this is a routing problem.

The routing table on your firewall looks a little odd - what are the actual 
IP addresses on its interfaces ?

Also, what are the routing tables on the machine you're pinging from, and the 
machine you're pinging to ?

My guess at the moment is the machine being pinged doesn't have a route to 
reply by.

 

Antony.

