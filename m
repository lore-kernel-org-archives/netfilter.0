From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: public ip on LAN
Date: Fri, 2 Jan 2004 16:23:08 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401021623.08821.Antony@Soft-Solutions.co.uk>
References: <6.0.0.22.0.20040102214805.030494d0@orangeinfoways.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.0.22.0.20040102214805.030494d0@orangeinfoways.com>
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

On Friday 02 January 2004 4:30 pm, Amit Pasari wrote:

> Hello,
> I am using Redhat 8.0 with iptables to provide my client internet services
> . Everything is going well .
> i have been giving private ips of 172.16.0.0 series to my clients .
> But now some of my clients need public ips . i do have many public ips with
> me .so can somebody tell how can i give public ips to my clients .

1. Do your clients *really* need public IPs on the machines themselves, or is 
it sufficient if you use NAT and ensure that packets to some public IP reach 
a specific client, and packets from that client have the public IP when they 
return to the Internet?   What protocols / services are you using which 
require public IPs on the client machines?

2. We can't answer your question in any detail without more information about 
the topology of your network, in particular whether your ISP provides a small 
subnet to you, terminated at your netfilter machine, or whether that subnet 
block can be routed across the netfilter machine so that the IPs can live on 
the other side of it.

3. Have you read the tutorials from http://www.netfilter.org and looked at 
some of the examples to see if they answer your question/s?

Regards,

Antony.

-- 
The idea that Bill Gates appeared like a knight in shining armour to lead all 
customers out of a mire of technological chaos neatly ignores the fact that 
it was he who, by peddling second-rate technology, led them into it in the 
first place.

 - Douglas Adams in The Guardian, 25th August 1995

                                                     Please reply to the list;
                                                           please don't CC me.


