From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: dnat problem in transparent firewall
Date: Tue, 3 Aug 2004 13:33:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408031333.26952.Antony@Soft-Solutions.co.uk>
References: <200408031436.08494.raido@elin.ttu.ee>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408031436.08494.raido@elin.ttu.ee>
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

On Tuesday 03 August 2004 12:36 pm, Raido Kurel wrote:

> Hello!
>
> I want to change destination ip in incoming packets.
>
> Needs:
> To change destination IP of some packets coming from Internet. ie to change
> dastination IP from aaa.aaa.aaa.12 to aaa.aaa.aaa.13
>
> What I have done:
> iptables rule:
>
> iptables -t nat -A PREROUTING -d aaa.aaa.aaa.12 -j DNAT --to-dest
> aaa.aaa.aaa.13

Do you have a FORWARD rule allowing packets through to aaa.aaa.aaa.13 after 
they've been NATted?

Antony.

-- 
Normal people think "If it ain't broke, don't fix it".
Engineers think "If it ain't broke, it doesn't have enough features yet".

                                                     Please reply to the list;
                                                           please don't CC me.


