From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IP forwarding
Date: Sat, 28 Sep 2002 08:27:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020928072727.RDNW20346.mta02-svc.ntlworld.com@there>
References: <F150KzGZuNY1SWoBDys00000342@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F150KzGZuNY1SWoBDys00000342@hotmail.com>
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

On Saturday 28 September 2002 5:22 am, SB CH wrote:

> Hello, all
>
> I would like to forward one IP to another IP.
>
> for example,
> eth0 IP is 211.1.1.1 and eth0:1 is 211.1.1.2
> and I would like to forward all request to 211.1.1.2
> toward 61.1.2.3 which is another network or not.
> Is it possible?
>
> I did like this to do, but it is not work.
>
> # ifconfig eth0:1 211.1.1.2
> # iptables -t nat -A  PREROUTING -d 211.1.1.2 -i eth0 j DNAT --to 61.1.2.3

I assume it was just a typo in your email, but that "j" should be "-j".

Did you also add a FORWARDing rule to allow the packets through ?

iptables -A FORWARD -d 61.1.2.3 -j ACCEPT

If that doesn't sort it out,please provide further information about the 
problem:

1. Can your firewall successfully connect to machine 61.1.2.3 ?
2. Are the source and destination machines on opposite sides of your 
firewall, so that both initial packets and replies get routed through the 
firewall ?
3. Add a LOG rule or use a packet sniffer to find out what is arriving at 
your firewall and tell you what you see and what is missing.
4. What protocol are you trying to use to connect to 61.1.2.3 ?

Antony.

-- 

The first ninety percent of an engineering project takes ninety percent
of the time, and the last ten percent takes the remaining ninety percent.

