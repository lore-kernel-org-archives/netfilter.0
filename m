From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: QoS and IPSec...
Date: Wed, 27 Jul 2005 13:59:41 +0200
Message-ID: <42E7772D.3070302@lopsch.com>
References: <42E6D57B.6050109@riverviewtech.net> <42E6DEDA.40200@lopsch.com>
	<42E716EA.9010703@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42E716EA.9010703@riverviewtech.net>
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
To: netfilter@lists.netfilter.org

Grant Taylor schrieb:
>> What about this (only for one side ;) ):
>> Suppose we are on LAN A:
>> In the table mangle chain PREROUTING mark all packets coming in over 
>> the LAN device and destined for 172.30.13.0/24 and sourced from 
>> 172.30.12.0/24 for example with 1.
>> Then IPSec handles the packets.
>> In table mangle chain POSTROUTING mark all packets with AH/ESP 
>> outgoing over the internet device and destined for the routable IP of 
>> LAN B with 1. Don't know if they are marked twice with 1 but that's no 
>> problem. So we can be sure all IPSec packets are marked with 1.
>> Then you can apply the filters in the schedulers for the appropriate 
>> marks on the appropriate device in this case the internet device.
>> So we can prioritize outgoing packets.
>> Incoming should also be prioritized. So both directions get their 
>> priorities.
>> So in table mangle chain PREROUTING mark all AH/ESP packets coming in 
>> over the internet device and sourced from the routable IP of LAN B 
>> with 1.
>> Then IPSec handles the packets.
>> In table mangle chain POSTROUTING mark all packets destinded for 
>> 172.30.12.0/24 and sourced from 172.30.12.0/24 and going out over the 
>> LAN device with 1.
>> Then apply the filters for the marks in the schedulers of the LAN device.
>> This way IPSec should be prioritized in both directions on one router. 
>> If it works you can do it with canged addresses on the other one.
>> Don't know if it really works, because it's now 3am and I'm a bit 
>> confused and IPSec is already complex standalone ;).
>> But afaik every net device gets schedulers no matter if physical or 
>> virtual so it normally should be no problem. 
> 
> 
> Daniel (and others) thank you for the reply.  However I think you have 
> (re)touched on the QoS / Prioritization of IPSec (IP/ESP) traffic verses 
> regular internet bound traffic.  I am after how to prioritize just the 
> subset of the traffic from Lan A (or B) that is destined to the other 
> side.  More specifically I will be having SSH (interactive sessions 
> only) / Telnet, Terminal Services (RDP), VNC (RFB), ICMP, SMB/CIFS, FTP 
> / SCP (bulk data transfer), RSYNC, LPD, etc traffic from one LAN 
> destined to the other LAN through a VPN that has a finite amount of 
> bandwidth (128 kbps DSL (768/128)) which will spend a good deal of time 
> saturated with all of the traffic going through it.  Thus I want to 
> prioritize that interactive services, i.e. SSH / Telnet, RDP, VNC, and 
> ICMP, send their traffic through the VPN *BEFORE* any of the bulk data 
> transfer services thus hopefully yielding what will appear to be a 
> fairly responsive circuit.  Seeing as how all of this traffic is going 
> to be encapsulated with in the IPSec VPN and thus becoming IP/ESP 
> traffic I can not just prioritize the IP/ESP traffic on the egress of 
> the external interface of the router.  Naturally I will prioritize like 
> you have suggested to make sure that VPN traffic will have priority over 
> general web traffic on the external interface of the router.  However as 
> I understand it there is no ""egressing interface for the traffic that 
> will be encapsulated *BEFORE* it does become encapsulated thus putting 
> all afore mentioned VPN traffic in one priority level.
> 
> Here is a brief description of how I want to prioritize the traffic that 
> will be leaving any of the LANs.  There will be more LANs down the road, 
> each of which will (for now) have equal priority with each other.  I 
> will be denoting Priority Groups (PgN) as well as sub groups (sN).  All 
> VPN traffic from one LAN to another will be a Priority Group 1 with all 
> other traffic from the sending LAN being a Priority Group 2 or lower.  
> The only possible exception to this will be ICMP and similar traffic.
> 
> Pg1s1:  ICMP destined to other LANs (IP/ESP)
> Pg1s2:  SSH / Telnet / RDP / RFB destined to other LANs (IP/ESP)
> Pg1s3:  LPD / SMB / CIFS destined to other LANs (IP/ESP)
> Pg1s4:  FTP / RSYNC / SCP destined to other LANs (IP/ESP)
> Pg1s5:  (unused as of yet) destined to other LANs (IP/ESP)
> 
> Pg2s1:  ICMP destined to the world at large.
> Pg2s2:  SSH / Telnet / RDP / RFB destined to the world at large.
> Pg2s3:  LPD / SMB / CIFS destined to the world at large.
> Pg2s4:  FTP / RSYNC / SCP destined to the world at large.
> Pg2s5:  (unused as of yet) destined to the world at large.
> 
> I want any traffic that is in Priority Group 1 (IPSec VPN traffic) to be 
> sent out the internet connection first.  I also want Priority Group 1s 
> traffic to be prioritized based on the sub group priority.  However as 
> IP/ESP traffic is encapsulated and can thus not be prioritized on egress 
> of the external interface it has to be prioritized before it is 
> encapsulated.  Here in lies the problem.  Where / how do I prioritize 
> this traffic to the appropriate sub group priority.
> 
> 
> 
> Grant. . . .
> 
> 

OK as I said I don't know if the marks on packets are still there after 
encapsulation. If so there is no problem. Trial and error ;). If not I 
think the best solution is the IMQ device to do intermediate shaping 
before encapsulation. Wasn't there a discussion on the LARTC mailing 
list on how it works?

