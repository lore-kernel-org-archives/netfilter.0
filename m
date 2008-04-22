From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Loopback security...
Date: Tue, 22 Apr 2008 14:43:37 -0500
Message-ID: <480E3FE9.8070008@riverviewtech.net>
References: <480D47F6.9080808@riverviewtech.net> <480DC570.80303@solutti.com.br> <480DF156.5060801@riverviewtech.net> <480E0CA2.2030902@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480E0CA2.2030902@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 04/22/08 11:04, Pascal Hambourg wrote:
> There is no such traffic forwarded between the loopback interface and 
> another interface, because it just makes no sense. The loopback is 
> designed for local host communications : all that is sent through it is 
> received back by the host, and all that is received through it was sent 
> by the host.

Under normal circumstances I would agree with you completely.  However 
there are (and have been) cases where there is a need to have other 
systems communicate with a given systems loopback interface.  More 
specifically (and closer to what prompted this discussion) is if I have 
a system that had in the past a service bound to loopback that is no no 
longer there that I would like to redirect this traffic out to a 
different system.  Thus traditionally I could DNAT traffic in the OUTPUT 
chain to the new address.  This way I would not need to re-configure 
software or deal with software that can not be re-configured.  In this 
case I want what starts as local traffic to be redirected OUT OF the 
loopback ""network and for replies to come back in to it.

> Of course not. Why would it ? The destination is local (see 'ip route 
> show table local'), and is treated just as any other local destination 
> like 10.0.0.1. Traffic is forwarded only when the destination is remote.

If this was a second ethernet interface verses the loopback interface, 
the answer would be "of course it would".

Let me try explaining this again.

A
   lo: 127.0.0.1/8 and 192.0.2.1/24
eth0: 10.0.0.1/24
Destination   Gateway     Genmask
10.0.0.0      0.0.0.0     255.255.255.0
127.0.0.0     127.0.0.1   255.0.0.0
192.0.2.0     0.0.0.0     255.255.255.0
0.0.0.0       10.0.0.X    0.0.0.0

B
   lo: 127.0.0.1/8
eth0: 10.0.0.254/24
Destination   Gateway     Genmask
10.0.0.0      0.0.0.0     255.255.255.0
127.0.0.0     127.0.0.1   255.0.0.0
192.0.2.0     10.0.0.1    255.255.255.0
0.0.0.0       10.0.0.X    0.0.0.0

In this case, B should route any traffic that is to 192.0.2.0/24 over to 
A.  A would then receive this traffic and forward it to the loopback 
interface.

If you are hanging up on my use of the word "forward" for traffic that 
comes in one interface destined to an address bound to a different 
interface then please do not, or change the word.  If you would prefer, 
substitute the word "route" for the word "forward".

> I believe it is rather based on common sense.

Yes this is (usually) common sense.  However my question was "Is it 
possible to change this behavior...", which still stands.



Grant. . . .
