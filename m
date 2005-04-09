From: Francesco Ciocchetti <primero@fastwebnet.it>
Subject: Re: Iptables vs. Cisco PIX
Date: Sat, 09 Apr 2005 20:10:24 +0200
Message-ID: <42581A90.3050706@fastwebnet.it>
References: <038201c53c4c$6e94e540$0200a8c0@ale>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <038201c53c4c$6e94e540$0200a8c0@ale>
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
To: Alejandro Cabrera Obed <sisdis@tournet.com.ar>, "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

Alejandro Cabrera Obed wrote:

>Hi people !!!
>
>  
>
Hi :)

I would say that while Iptables is a set of Block to build a Wall ,
Cisco PIX is a pre-built Wall you just have to paint and let it shine.

Iptables gives for sure a lot of opportunities of configuration and
traffic control that a Cisco Pix does not and i think is not possible to
forget that Iptables-Firewall is a complete Linux system with all the
advantages this can gives, for example a cron-tab, scripting , and so on.

I think that , as always, the choice depends on your needs from the device.
If you need a statefull firewall failover your choose is done because
iptables is not ready to do it yet while Cisco PIX does it in a clear
and fast way.

I would always use a Cisco Pix as Border Firewall because of its
reliability and performance, also because i would not do specific or
particular filter at this level of network. I would instead use a
Linux/Iptables firewall at 'User Level' because it would let me to do
ANYTHING i want and because at this level i could , maybe, leave the
statefull failover out to have the maximum flexibility possible.

bye
<P>

 


