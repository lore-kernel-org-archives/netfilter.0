From: dhiraj.2.bhuyan@bt.com
Subject: RE: redirection
Date: Wed, 9 Apr 2003 11:03:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7497DCA1C240C042B28F6657ADFD8E09268774@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
Content-Transfer-Encoding: 7bit
To: lyra@fastwebnet.it, netfilter@lists.netfilter.org

try one thing - flush all rules and add the rule
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 80 -j DNAT
--to-destination x.y.z.2:80

I have a feeling that you are doing something in the POSTROUTING chain which
is why you are not getting the right result. Or maybe you have a rule to
drop the packet defined?

dhiraj

-----Original Message-----
From: xchris [mailto:lyra@fastwebnet.it]
Sent: 09 April 2003 09:14
To: Bhuyan,D,Dhiraj,XVR3A C; netfilter@lists.netfilter.org
Subject: Re: redirection


On Wednesday 09 April 2003 10:40 am, you wrote:
> You do infact need DNAT and not SNAT
>
> iptables -t nat -A PREROUTING -p tcp -m tcp --dport 80 -j DNAT
> --to-destination x.y.z.2:80
>
> this should work.


I tried but all connections go in timeout.
I first flushed every chain,set default policy everywhere,and then added
DNAT 
rule...

no result...

The strange thing is :
if i DNAT on another interface everything is ok.
if i DNAT through the incoming connection interface... it fails.

strange...
I think i miss something..
Thank you
Chris

