From: Samuel =?utf-8?B?RMOtYXogR2FyY8OtYQ==?= <samueldg@arcoscom.com>
Subject: Re: Port Forwarding Problem
Date: Fri, 15 Apr 2005 10:40:39 +0200
Message-ID: <20050415084039.7032.qmail@arcoscom.com>
References: <425F98B0.7040303@wan4u.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <425F98B0.7040303@wan4u.co.za>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Julian Labuschagne <personxx@wan4u.co.za>
Cc: netfilter@lists.netfilter.org

Without having a look into your scripts, I think you need: 

1) Allow INPUT into filter table to the port.
2) Allow FORDWARD into filter table to the redirected conection. 

Good luck. 

Julian Labuschagne writes: 

> Hi everyone I'm a bit new to iptables so please bear with me on this on=
e 
> ;) 
> 
> I wrote a small firewall that basicaly nats users through my gateway 
> machine only allowing certain hosts on my network Web DNS and Mail acce=
ss. 
> 
> This section works fine. 
> 
> But I also want to port forward any connections from outside to port 80=
0 
> to a host running inside my LAN.
> I added a rule in the PREROUTING table to do this. 
> 
> But it seems that no connection gets forwarded. 
> 
> If I set my default policies to ACCEPT and add the PREROUTING rule it 
> actualy does the port forwarding correctly. 
> 
> I attached a copy of the firewall I wrote with this message. 
> 
> Please can someone have a look through it for me cause I'm sure I'm jus=
t 
> missing something. 
> 
> Kind Regards Julian. 
> 
>  
> 
 


Samuel D=EF=BF=BDaz Garc=EF=BF=BDa
Director Gerente
ArcosCom Wireless, S.L.L. 

mailto:samueldg@arcoscom.com
http://www.arcoscom.com
m=EF=BF=BDvil: 651 93 72 48
tlfn.: 956 70 13 15
fax:   956 70 34 83 



