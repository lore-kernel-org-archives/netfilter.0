From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forward for some IPs and SNAT the rest
Date: Tue, 16 Mar 2004 16:09:32 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403161609.32504.Antony@Soft-Solutions.co.uk>
References: <40572436.9080308@di.uminho.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40572436.9080308@di.uminho.pt>
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

On Tuesday 16 March 2004 3:58 pm, Jose Luis Faria wrote:

> Hello,
>
> I have a firewall inside my organization, but I want to preserve some
> source IPs, and the rest must be SNATed:
>
> the host 1 and host 2 must arrive to the license server with the original
> IP( 192.168.0.1/2) and the others host must be translated with SNAT into
> 193.137.1.1.

I assume you currently have a POSTROUTING rule:

iptables -A POSTROUTING -t nat -o $extIF -j SNAT --to 193.137.1.1

Well, simply put two rules in front of this:

iptables -I POSTROUTING -t nat -s 192.168.0.1 -d a.b.c.d -j ACCEPT
iptables -I POSTROUTING -t nat -s 192.168.0.2 -d a.b.c.d -j ACCEPT

Where a.b.c.d is the IP address of the licence server.

Make sure the routing table on the licence server knows how to send packets to 
192.168.0.1 correctly.

Antony.

-- 
If builders made buildings the way programmers write programs, then the first 
woodpecker to come along would destroy civilisation.

                                                     Please reply to the list;
                                                           please don't CC me.


