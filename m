From: Daniel Chemko <dchemko@smgtec.com>
Subject: Re: forwarding based on hostname
Date: Sun, 03 Aug 2003 13:20:30 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F2D6E8E.2060508@smgtec.com>
References: <000001c359fb$2c7c68c0$8c01a8c0@blackice3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c359fb$2c7c68c0$8c01a8c0@blackice3>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ian McBeth <imcbeth@telus.net>
Cc: netfilter@lists.netfilter.org

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
>server.  Based off ip it works but when you get the hostname in there it
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


