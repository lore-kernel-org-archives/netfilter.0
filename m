From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: traffic from particular interface..
Date: Mon, 14 Mar 2005 15:22:34 +0100
Message-ID: <200503141422.j2EEMeNW016542@smtp26.wxs.nl>
References: <1403218a0503140417712785fa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1403218a0503140417712785fa@mail.gmail.com>
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
To: 'netfilter' <netfilter@lists.netfilter.org>

 And perhaps an:

iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Mohamed Eldesoky
Sent: 14 March 2005 13:17
To: Manish; netfilter
Subject: Re: traffic from particular interface..

iptables -A FORWARD -i eth1 -o eth0 -j DROP


On Mon, 14 Mar 2005 04:03:45 -0800 (PST), Manish <manishsoft@yahoo.com>
wrote:
> Hi,
> 
> I had 3 network interface on my linux box eth0, eth1 and eth2. I want
traffice from eth1 only pass  from eth2 and eth0 should deny any traffic
from eth1 but allow from eth2. what firewall rule should i give to do the
above job.
> 
> Thanks in advance
> 
> Manish.
> 
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around 
> http://mail.yahoo.com
> 


--
Mohamed Eldesoky
www.eldesoky.net
RHCE



