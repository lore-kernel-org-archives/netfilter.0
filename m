From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: block traffic between two subnets
Date: Thu, 7 Jul 2005 14:29:19 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507071429020.1861@yvahk01.tjqt.qr>
References: <478753d47892be.47892be478753d@vsnl.net>
	<Pine.LNX.4.61.0507071426370.1861@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507071426370.1861@yvahk01.tjqt.qr>
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
To: varun_saa@vsnl.net
Cc: netfilter@lists.netfilter.org

>>eth1 192.168.0.0/24
>>eth2 192.168.21.0/24
>>I would like block all traffic between eth1 and eth2.
>>How to write a rule ?
>
>iptables -A INPUT -j REJECT -i eth1 -o eth2
>iptables -A INPUT -j REJECT -i eth2 -o eth1

Should have been -A FORWARD ...

