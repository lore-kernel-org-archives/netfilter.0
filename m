From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Forwarding help
Date: Thu, 27 Nov 2003 12:58:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311271258.29327.Antony@Soft-Solutions.co.uk>
References: <000701c3b469$17203ba0$14d36c50@anonymous> <200311271134.06406.Antony@Soft-Solutions.co.uk> <000701c3b4e4$b32a8fc0$14d36c50@anonymous>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000701c3b4e4$b32a8fc0$14d36c50@anonymous>
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

On Thursday 27 November 2003 12:48 pm, sc2@gmx.at wrote:

> > So "iptables -I FORWARD -m state --state >ESTABLISHED,RELATED -j ACCEPT"
> > might be a good idea.
>
> i should include this ?

This will alloow the reply packets pack again - if you don't have this, you 
need a specific rule to allow those the same as you have a specific rule to 
allow the original packets.   Don't forget communications go both ways 
through a firewall :)

> b.) the port / service is a udp/tcp , port of a half - life game server, so
> the clients are not on the same subnet
> they are connecting to x.24.51 > and should FW to .24.58:

Does halflife work through NAT?

I don't know (maybe someone else here does), but you should be aware that 
there are some protocols which just work through NAT, some which are a bit of 
a challenge, and some which won't work at all.

I don't know which group halflife falls into.

Antony.

-- 
Most people have more than the average number of legs.

                                                     Please reply to the list;
                                                           please don't CC me.


