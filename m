From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: help needed.
Date: Fri, 7 Nov 2003 13:30:27 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311071330.hA7DUWj14711@agate.rockstone.co.uk>
References: <3FAB92BA.4090003@newweb.oktanet.fi> <200311071255.hA7Ctwj14697@agate.rockstone.co.uk> <20031107140825.272789ed.jesper@ballbreaker.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031107140825.272789ed.jesper@ballbreaker.dk>
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

On Friday 07 November 2003 1:08 pm, Jesper Lund wrote:

> > iptables -A POSTROUTING -t nat -s 192.168.132.230 -j SNAT --to
> > 212.23.233.40 iptables -A PREROUTING -t nat -d 212.23.233.40 -j DNAT
> > --to 192.168.132.230
>
> And you have to make the linux box respond to arp requests on the
> outside interface:
>
> ip addr add dev ethX 212.23.223.40

I'm pretty sure from Mikko's original posting that this is already dealt with.

Antony.

-- 

"John Major" and "Cher" are as much abstractions as "the national debt" or 
"the state of Welsh rugby".

 - Guy Claxton, Hare Brain, Tortoise Mind
                                                     Please reply to the list;
                                                           please don't CC me.

