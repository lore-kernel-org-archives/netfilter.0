From: "Ian McBeth" <imcbeth@telus.net>
Subject: RE: forwarding based on hostname
Date: Sun, 3 Aug 2003 14:44:14 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000601c35a00$0083bfc0$8c01a8c0@blackice3>
References: <3F2D6E8E.2060508@smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F2D6E8E.2060508@smgtec.com>
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
To: 'Daniel Chemko' <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org

Hey 

I am not using the domain name to connect to the mail server that is
hidden behind the Nat firewall box as I can not connect to it with the
domain name but I can connect to it via the IP address.  What am I doing
wrong?

Thanks



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Daniel Chemko
Sent: Sunday, August 03, 2003 2:21 PM
To: Ian McBeth
Cc: netfilter@lists.netfilter.org
Subject: Re: forwarding based on hostname

I would not reccomend using domain names in the submission to iptables 
if it is supported or not. 1. Do a resolution of the domain every once 
and a while and resubmit the rule to iptables. If the firewall ever has 
any issues resolving domain names, then the rules requiring it would 
break,. It is generally a bad idea to have the packet firewall relying 
on any external service to perform its job. Remote access services need 
authenitcators but beyond that, limited liability DNS, and monitoring 
the firewall shouldn't be talking that much.


Ian McBeth wrote:

>Hello
>
>I have an issue where I have forwarded the ports to an internal mail
>server.  Based off ip it works but when you get the hostname in there
it
>seems to get lost.  No error is given just hangs and outlook says the
>connection was interrupted.
>
>Using cat /proc/net/ip_conntrack it does not even appear to be
>connecting.
>
>Any help would be great as I am kind of new at iptables NAT
>configurations.
>
>Thanx
>
>Ian McBeth
>
>p.s. I have not really looked to deeply into this but can you forward
>based off hostnames to your internal network?
>
>e.g.
>mail.domainname.net --> NAT --> 192.168.0.x
>
>
>
>  
>





