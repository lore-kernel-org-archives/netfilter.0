From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ICMP conntrack
Date: Fri, 18 Oct 2002 09:28:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021018082812.QQWL292.mta03-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0210171713000.6045-100000@altaica.tigerknight.org> <3DAF772A.7BE6FB37@nestac.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DAF772A.7BE6FB37@nestac.com>
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
To: netfilter@lists.netfilter.org

On Friday 18 October 2002 3:51 am, Vincent Lim wrote:

> Dear people,
>
> I was wondering why I'm not getting any conntrack entires for icmp
> connections?

There is no concept of a "connection" for ICMP.

A single ICMP packet is sent to indicate some situation has occurred.   
There's no reply, there's no follow-up packet, therefore there's no need to 
keeptrack of a "connection" for something which consists of only a single 
packet.

Antony.

-- 

There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

