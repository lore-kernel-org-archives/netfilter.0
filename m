From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IP Alias with iptables
Date: Mon, 19 Apr 2004 15:53:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404191553.50340.Antony@Soft-Solutions.co.uk>
References: <EMEKLOMJOPNJPAFKHEDJGECGCDAA.rhaces_chistes@yahoo.com.mx>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <EMEKLOMJOPNJPAFKHEDJGECGCDAA.rhaces_chistes@yahoo.com.mx>
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

On Monday 19 April 2004 4:41 pm, Rodrigo Haces wrote:

> Hi:
>
> I have only one network adapter in my Server, but i need to have 2
> different networks, 192.168.1.0 to the MAC addresses i know and 192.168.0.0
> to the MAC addresses i don't know

This sounds strange - what is your network layout, giving rise to machines 
with "MAC addresses you don't know", which need you to be on a different 
subnet?

> i have managed this by makin mi eth0 to
> 192.168.1.1 and an alias eth0:0 to 192.168.0.1, everythings ok, but i'm
> also sharing internet, but when i start the rule to the eth0:0 it sends me
> an error. Is there a way to use IP Aliasing with iptables?

Yes - just remember that there's only one physical interface, and it's called 
eth0.   Don't try to use :0 or :1 in your netfilter rules.   You can always 
use -s or -d to specify source & destination IP addresses if you want the 
rule/s to apply only to certain packets.

> if not, is there a way to create an eth0 and eth1 witn the same adapter?

No.   It's a simple (and cheap) job to add another ethernet card, though.

Regards,

Antony.

-- 
All matter in the Universe can be placed into one of two categories:

1. Things which need to be fixed.
2. Things which need to be fixed once you've had a few minutes to play with 
them.

                                                     Please reply to the list;
                                                           please don't CC me.


