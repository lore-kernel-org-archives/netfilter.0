From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: DNAT Problems
Date: Thu, 1 Mar 2007 00:11:02 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703010010350.23355@yvahk01.tjqt.qr>
References: <431a83ad0702280632w5c72b1d8rec20f41424b1927c@mail.gmail.com>
	<431a83ad0702280633w2c0a88ddsa2132c44d3cbbe39@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <431a83ad0702280633w2c0a88ddsa2132c44d3cbbe39@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rafael Paris <raparis@gmail.com>
Cc: netfilter@lists.netfilter.org


On Feb 28 2007 10:33, Rafael Paris wrote:
>
> I have been trying to have access to my internal mail server from
> internet but always get connection timed out.
> This is a very short set of rules being used for testing purposes with
> no success:
>
> iptables -t nat -A PREROUTING -p tcp -i ppp0 -d <external_fixed_ip>
> --dport 110 -j DNAT --to-destination <internal_ip:110>
> iptables -t nat -A PREROUTING -p tcp -i ppp0 -d <external_fixed_ip>
> --dport 25 -j DNAT --to-destination <internal_ip:25>
>
> iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to <external_fixed_ip>
>
> I'm using one ethernet device with my lan ip address and I can reach
            ^^^

There in lies your problem. All packets that came after the first one don't
even pass your box.



Jan
-- 

