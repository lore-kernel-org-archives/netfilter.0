From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Running iptables behind router
Date: Tue, 24 Feb 2004 11:06:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402241106.41715.Antony@Soft-Solutions.co.uk>
References: <20040216235513.GA1219@room101> <632269680.20040217093907@attla.net.ar> <20040224001308.GA10127@zaklinux.zakarun>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040224001308.GA10127@zaklinux.zakarun>
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
To: netfilter <netfilter@lists.netfilter.org>

On Tuesday 24 February 2004 12:13 am, Kean Pedersen wrote:

> My network right now is:
>
> Hardware router(192.168.1.1), the only access to Internet.
> Desktop (192.168.1.42)
> Server/NAT box (eth0:192.168.1.3 and eth1:192.168.2.1)
> Laptop (192.168.2.101)
>
> The hardware router, desktop and server:eth0 are on one switch, while
> laptop and server:eth1 are on another switch.
>
> I then try a ping from my laptop (192.168.2.101) to my desktop
> (192.168.1.42), but all packes are lost. The packet count on iptables -L -v
> goes up for postrouting/masquerade and forward/accept.

What's the routing table on 192.168.1.42?   Can the reply packets find their 
way back to 192.168.2.101 again?

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


