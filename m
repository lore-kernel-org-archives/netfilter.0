From: Kevin Holly <root@hallowe.lt>
Subject: Re: "Operation not permitted" from nf_conntrack under high UDP load
Date: Fri, 4 Mar 2016 04:59:46 +0100
Message-ID: <56D90832.7020009@hallowe.lt>
References: <CABkWSFxpuoGST0CuSrYKb15dOixPvJ0aCzQof2A7aXqY_06_PA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CABkWSFxpuoGST0CuSrYKb15dOixPvJ0aCzQof2A7aXqY_06_PA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sebastian Damm <damm@sipgate.de>, netfilter@vger.kernel.org

Hello,

you might want to check your system logs for messages similar to "ip_conntrack: table full, dropping packet." because for me this sounds like a problem with the size of the connection tracking table not being large enough for the number of connections you're dealing there.

This usually indicates that your connection tracking table is filed and you will need to higher the size of the connection tracking table.
To increase the table size, which can be done very easily, I suggest reading out the current value using sysctl net.nf_conntrack_max and setting a higher value, I usually take the existing value and multiply it by 2, or, if the machines have enough RAM available and need to handle really much connections, set it to 1048576 (sysctl net.nf_conntrack_max=1048576) which seems to work out pretty well for us.

Best regards

Kevin Holly - root@hallowe.lt - http://hallowe.lt/

On 03/03/2016 03:31 PM, Sebastian Damm wrote:
> Hi,
> 
> we have a SIP signalling server, which communicates with hundreds of
> thousands of clients all over the world. There are basically just two
> services on this host - SIP and STUN. Both services are UDP only.
> 
> This server is running with a permanent bandwidth of 20-40 Mbit of UDP
> traffic. We have a stateful firewall on it with quite a few rules, the
> conntrack table is filled with more than 300k entries, max is at 800k.
> 
> In the SIP server log we see about 10k times per day the following messages:
> 
> Mar  3 06:25:31 dalke /usr/sbin/kamailio[30372]: ERROR: <core>
> [udp_server.c:550]: udp_send():
> sendto(sock,0x7f28fe924000,459,0,89.204.130.xxx:34246,16): Operation
> not permitted(1)
> Mar  3 06:25:56 dalke /usr/sbin/kamailio[30369]: ERROR: <core>
> [udp_server.c:550]: udp_send():
> sendto(sock,0x7f28fe933218,411,0,213.47.42.xxx:5060,16): Operation not
> permitted(1)
> Mar  3 06:25:57 dalke /usr/sbin/kamailio[30588]: ERROR: <core>
> [udp_server.c:550]: udp_send():
> sendto(sock,0x7f82abe4ef28,420,0,217.116.117.xxx:5060,16): Operation
> not permitted(1)
> Mar  3 06:26:07 dalke /usr/sbin/kamailio[30330]: ERROR: <core>
> [udp_server.c:550]: udp_send():
> sendto(sock,0x7f28fe996f70,373,0,178.21.0.xxx:5060,16): Operation not
> permitted(1)
> Mar  3 06:26:37 dalke /usr/sbin/kamailio[30357]: ERROR: <core>
> [udp_server.c:550]: udp_send():
> sendto(sock,0x7f28fe997178,422,0,37.47.161.xxx:5669,16): Operation not
> permitted(1)
> Mar  3 06:26:56 dalke /usr/sbin/kamailio[31025]: ERROR: <core>
> [udp_server.c:550]: udp_send():
> sendto(sock,0x7fbee39627c8,477,0,178.27.35.xxx:57454,16): Operation
> not permitted(1)
> 
> Since every hint in the internet points to iptables for this error, we
> cleared all rules. But the messages don't stop.
> 
> So we rebooted the machine to have a clear state without firewall.
> After that the problem was gone.
> 
> Now we just executed "iptables -nvL" and then inserted the modules
> nf_conntrack and nf_conntrack_ipv4. After that those messages appeared
> again. We can reproduce it by removing and adding those two modules,
> causing the errors to disappear and reappear.
> 
> We are using Debian Wheezy, and tried it with the standard 3.2.0
> kernel and 3.16.0 backports kernel, both show the same behaviour.
> 
> Has anybody seen this before? And is there any solution (besides using
> a non-stateful firewall)? We tried tweaking the hashsize option when
> loading the module, raised the conntrack_max and conntrack_expect_max
> values, without any change. Are there other options which might help
> in our scenario?
> 
> Thanks,
> Sebastian
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
