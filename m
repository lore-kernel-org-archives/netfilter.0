From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: how to connect to VPN server using IPTABLES nat
Date: Fri, 3 Mar 2006 07:22:41 +0100
Message-ID: <000001c63e8a$e0d0ff40$0101000a@sterenborg.info>
References: <43a0cdcb0603022055x4209bf80v@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43a0cdcb0603022055x4209bf80v@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

> I'm puzzled with the IPTABLES
> when I set the default Policy of INPUT and FORWARD chains, I can
> established the vpn connection. But When I use the below command ,the

Of *both* INPUT and FORWARD ?
Packets typically travel only one chain and this traffic would only go
through the FORWARD chain.

> vpn connection can't be established
> iptables -A INPUT -d 218.0.0.0 -j ACCEPT

So, this isn't going to help you.

> iptables -A FORWARD -d 218.0.0.0 -j ACCEPT
> WHY? what other rules should be added?

Does this rule have packetcount (iptables -nvL FORWARD) ? Because, erm..
From below I gues that your pptp server isn't on the 218.0.0.0 subnet
but on 192.168.1.1.
(iptables -A FORWARD -d 192.168.1.1 -j ACCEPT)

Your rules are a secrect to me ; if this doesn't work then maybe there's
something else blocking pptp already before it would be accepted by this
rule. Perhaps you need some logging rules to see if that is the case.

Perhaps this may be of help :
http://martybugs.net/smoothwall/vpn.cgi


Gr,
Rob

> 2006/3/2, Rob Sterenborg <rob@sterenborg.info>:
>> 
>> On Thu, March 2, 2006 11:46, Buddy wu wrote:
>>>    I DON'T mean there is a VPN serving making from linux.    The
>>>    fact is that: I set up a VPN server using windows
>>> server(IP:192.168.1.1) and it is behind a Linux server which is
>>>    using iptables for nat iptables -A PREROUTING -d 218.0.0.0 -j
>>> DNAT --to 192.168.1.1 
>>> 
>>>    but I can't establish the VPN connection from out(etc IP address
>>> is 218.10.0.1, I have tested that I can connect to other service
>>> such as web(port 80). How can I establish the VPN connection ? Is
>>> there need some setting in IPTABLES?
>> 
>> If it's Windows then I suspect it's a PPTP server.
>> For this to work you have to forward both 1723/tcp and the gre (47)
>> protocol. Also, you need the pptp conntrack/nat modules for which
>> you may have to recompile the kernel and iptables.
>> 
>> 
>> Gr,
>> Rob


