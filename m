From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forwarding
Date: Mon, 8 Jul 2002 01:30:29 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708003031.PFFP23840.mta03-svc.ntlworld.com@there>
References: <003101c2262f$33ff1a30$1606d6d1@nebuchadnezza>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <003101c2262f$33ff1a30$1606d6d1@nebuchadnezza>
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

On Monday 08 July 2002 4:25 am, Tim wrote:

> Well, it looks like my netfilter rules/commands are not forwarding even
> though I have
>
> ## Routing packets (traffic) between INTERNAL and DMZ
> "echo "1" /proc/sys/net/ipv4/ip_forward"

That really says
echo 1 >/proc/sys/net/ipv4/ip_forward
or
echo "1" >/proc/sys/net/ipv4/ip_forward
doesn't it ?

(Note specifically the > sign)

 

Antony.

