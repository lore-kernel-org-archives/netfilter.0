From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Help: iptables NAT broken with pppoe
Date: Mon, 09 May 2005 00:56:13 -0500
Message-ID: <427EFB7D.8010503@riverviewtech.net>
References: <1115397393l.3864l.0l@antares.localdomain>	<427C5C41.3010407@riverviewtech.net>
	<1115496014l.3549l.0l@antares.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115496014l.3549l.0l@antares.localdomain>
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

> Fist, thanks a lot for your reply!

You are quite welcome.

>> I'm not sure why it's happening but your PMac G4 system is sending 
>> reset  packets in response to the responses from the server.
> 
> 
> Ouch! That's indeed very strange. I can only repeat that it *did* work  
> using isdn, so apparently there is some pppoe related porblem?

I'm not doubting you that it did work, though I have NO idea why it is not working at the moment.  You might want to try (re)posting your question to a different mail list (suggestions any one?) or see if any one else on this list might be able to help you more than I can.  (Any one care to jump in here and take over where I'm coming up short?)

>> Have you tried  using an SNAT rule temporarily on your POSTROUTING 
>> chain  to see if the problem is with the MASQUERADE rule?
> 
> Same effect - replaced the masquerade rule by

Just one comment "Hmmmm....".

> ppp0ip=84.44.130.37
> iptables -t nat -A POSTROUTING -s 192.168.42.0/24 -o ppp0 -j SNAT \
> - --to-source $ppp0ip
> 
> but tcpdump still reports
> 
> 21:50:33.986790 IP 84.44.130.37.49224 > 213.95.27.115.80: S 3806917882:3806917882(0) win 65535 <mss 1452,nop,wscale 0,nop,nop,timestamp 380633236 0>
> 21:50:34.047457 IP 213.95.27.115.80 > 84.44.130.37.49224: S 118817856:118817856(0) ack 3806917883 win 5792 <mss 1460,nop,nop,timestamp  1571974157 380633236,nop,wscale 2>
> 21:50:34.047558 IP 84.44.130.37.49224 > 213.95.27.115.80: R 3806917883:3806917883(0) win 0

*nod*

> The modules ipt_MASQUERADE and iptable_nat *are* loaded, btw.
> 
>> Also, what is your "echo 2 > /proc/sys/net/ipv4/ip_dynaddr" doing for  
>> you?
> 
> I don't see any messages in /var/log messages or in dmesg, if you mean  
> that. Or did I miss your point here? I found some howto where they 
> stated  this would be necessary...

Ok.  I've never heard or seen reference to /proc/sys/net/ipv4/ip_dynaddr before and I'm not sure what its purpose is let alone that it is requried.  Does any one have any more information on what it is and what its purpose is?

>> You might want to check to make sure that reverse path filtering
>> is not turned on by default.  You might also want to turn on verbose  
>> routing messages to see if there is any thing useful being reported.
> 
> Hmmm, can you tell me how I actually check reverse path filtering and 
> turn  debugging on? Sorry, I'm neither a iptables nor a kernel guru :-/

Take a look at /proc/sys/net/ipv4/conf/<device|all|default>/rp_filter to see if it is "1" or "0".  As I understand it reverse path filter(ing) is a kernel level filter feature that will only allow traffic with a specific source address to come in on the interface that it is connected to.  This would explain why you might be getting the reset packet if reverse path filtering is turned on on your eth0 device.

> Thanks a lot for your help,

No problem.  :)

