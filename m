From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables and wireless card in promiscuous mode
Date: Tue, 30 Nov 2004 14:05:30 +0100
Message-ID: <1101819930.4556.33.camel@anduril.intranet.cartel-securite.net>
References: <41AC6D4F.7000001@eurecom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41AC6D4F.7000001@eurecom.fr>
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
Content-Type: text/plain; charset="us-ascii"
To: Claudio Lavecchia <Claudio.Lavecchia@eurecom.fr>
Cc: netfilter@lists.netfilter.org


> I have two laptops that have 802.11 wireless cards. I am developing some 
> application that essentially perform sniffing functions using wireless 
> cards in promiscuous mode. To test my code, I need those two laptops not 
> to "see" each other (--> I do not want the wireless card of laptop A, 
> which is operating in promiscuous mode to process packets coming from 
> laptop B) and I tought to do it using iptables.

Promisc packet capture occurs before Netfilter filtering. So you can't
prevent network adapter in promiscuous mode to sniff given packets using
iptables. You must configure BPF to exclude the frames you don't want to
see.


-- 
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

