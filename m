From: Daniel <damage@rooties.de>
Subject: Re: iptables - losing packets between mangle and nat
Date: Sun, 8 Jan 2006 16:30:55 +0100
Message-ID: <200601081630.55456.damage@rooties.de>
References: <200601080151.02899.damage@rooties.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200601080151.02899.damage@rooties.de>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hi,
I marked the packets from 192.168.1.0/24 in the PREROUTING Chain in table 
mangle. After that I created in every Chain in tables nat/mangle/filter an 
ACCEPT rule for the marked packets. But I did not see them any more... Now 
I'm really confused... What is going on there? Where are the packets going? 
Did I forgot to set a sysctl flag in /proc/sys/net/* ???
Please help me! Any suggestion is helpfull.

Daniel

Am Sonntag, 8. Januar 2006 01:51 schrieb Daniel:
> Hi,
> I'm trying to create an net-to-net VPN.
>
> {192.168.0.0/24}--[192.168.0.1]-VPN/INET-[192.168.1.1]--{192.168.1.0/24}
>        LAN           GATEWAY                GATEWAY           LAN
>
> Everything seems to be fine:
> 1. I'm able to ping 192.168.1.1 from 192.168.0.1 (so, racoon allready
> established the tunnel
> 2. I'm able to ping 192.168.0.1 from 192.168.1.1 (so, both ways are ok)
> 3. if I try to ping 192.168.1.1 from 192.168.0.0/24 then racoon is
> establishing the tunnel
> 4. if I try to ping 192.168.0.1 from 192.168.1.0/24 then racoon is
> establishing the tunnel
>
> But in case 3 und 4 the client from the LAN does not got an reply on his
> request. As I noticed the problem is the gateway from the lan which the
> client is in (so in case 3 the problem is 192.168.0.1). Also (in case 3) I
> noticed that the reply has been send from 192.168.1.1 but it gets "lost" on
> 192.168.0.1.
>
> So I added some rules to iptables on 192.168.0.1 and I noticed that the
> packet access the PREROUTING chain in the table mangle but never access the
> PREROUTING chain in the table nat. I think it should because of the packet
> flow (http://www.siliconvalleyccie.com/images/iptables.gif) ?!?!?!
>
> Why does this packet never access the PREROUTING chain in "nat" (and all
> other following chains)? Any suggestions?
>
> Daniel

