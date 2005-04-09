From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Iptables vs. Cisco PIX
Date: Sat, 09 Apr 2005 14:07:06 -0500
Message-ID: <425827DA.9020706@riverviewtech.net>
References: <038201c53c4c$6e94e540$0200a8c0@ale>
	<42581A90.3050706@fastwebnet.it>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42581A90.3050706@fastwebnet.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Francesco Ciocchetti <primero@fastwebnet.it>
Cc: Alejandro Cabrera Obed <sisdis@tournet.com.ar>, "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

You make some very good points.  You are also correct in the fact that at your border firewall you need to be more liberal in what you let through as you don't have the flexibility to shut down what comes in on a bulk pattern, but you could shut things down based on their destination, or have a small sub chain set aside for each system and redirect traffic in to each sub chain depending on what system it is destined for.  As far as the redundancy / fail over you can accomplish much the same thing via VRRP in Linux with two firewalls configured identically.  In this case you would have two firewalls with their IP on the network both of which would be imulating a 3rd IP which would be the IP that all systems would use as their gateway.  This way the VRRP enabled Linux nodes would constantly pole each other to make sure that they are alive and functional.  If one of them goes down the other
  takes up the slack in a very short amount of time (I'm not sure what it is, I think it's 
less than 30 seconds).  Granted I have never messed with VRRP my self but from the reading that I have done on it this is EXACTLY what it is meant for.  Virtual Router Redundancy Protocol (VRRP) is the industry standard of Cisco's Hot Standby Router Protocol (HSRP).  You can also look at some of the Linux clustering technologies but I don't think they are exactly appropriate here.

Of course there is also the fact that there are a LOT of people that know how to work with PIXies and could come in after you are hit by a Greyhound buss and take over, where there are relatively few people that could walk in and take over a complex Linux IPTables, IPRoute2, VRRP firewall.  But to each his own.



Grant. . . .

Francesco Ciocchetti wrote:
> Alejandro Cabrera Obed wrote:
> 
> 
>>Hi people !!!
>>
>> 
>>
> 
> Hi :)
> 
> I would say that while Iptables is a set of Block to build a Wall ,
> Cisco PIX is a pre-built Wall you just have to paint and let it shine.
> 
> Iptables gives for sure a lot of opportunities of configuration and
> traffic control that a Cisco Pix does not and i think is not possible to
> forget that Iptables-Firewall is a complete Linux system with all the
> advantages this can gives, for example a cron-tab, scripting , and so on.
> 
> I think that , as always, the choice depends on your needs from the device.
> If you need a statefull firewall failover your choose is done because
> iptables is not ready to do it yet while Cisco PIX does it in a clear
> and fast way.
> 
> I would always use a Cisco Pix as Border Firewall because of its
> reliability and performance, also because i would not do specific or
> particular filter at this level of network. I would instead use a
> Linux/Iptables firewall at 'User Level' because it would let me to do
> ANYTHING i want and because at this level i could , maybe, leave the
> statefull failover out to have the maximum flexibility possible.
> 
> bye
> <P>
> 
>  
> 
> 

