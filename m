From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: selective filter
Date: Wed, 3 Dec 2003 09:23:52 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312030923.52492.Antony@Soft-Solutions.co.uk>
References: <000f01c3b97c$e64a2d10$0501a8ac@Rares>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000f01c3b97c$e64a2d10$0501a8ac@Rares>
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
To: netfilter@lists.netfilter.org

On Wednesday 03 December 2003 9:07 am, Admin wrote:

> Dear community,
> I am new to this branch (Linux I mean) and as a new user it was my turn to
> install a new server. I installed RedHat 8 on a system with 2 LAN cards.
> The server works as a mailserver, apache, proxy and firewall.
> The first 3 problems are solved. It work really fine.
> The last daemon is the problem.
> IPTABLES is installed but it is only with the default settings and with
> some settings made by the ISP. The problem is that my bosses ask me to do
> some access list to restrict the access to some users on internet. I
> "composed" some rules in squid.conf and everything works just fine until "a
> smart guy" discovered that if he doesn't put the mark on "use proxy server"
> he have internet access.
> In this case, I'm not verry sure, but I guess it is an iptables problem. I
> read something about this topic, but I didn't find anything related to this
> specific problem.
> Here are my data:
> eth0: 193.2xx.xxx.xxx
> eth1: 192.168.1.254
>
> I want to restrict all users EXCEPT this 3 addresses: 192.168.1.100,
> 192.168.1.200, 192.168.1.21
>
> How can I do that?
> All that I found in all documentation that I read it was related to
> restricting all addresses. Please, consider that I am a beginer and be a
> little more detailed on your help. Do you have another ideea about solving
> this problem?

It is important that you remember that the squid proxy, and the netfilter 
packet filtering firewall, are separate systems on your machine.

Therefore if someone has the proxy settings selected in their browser, squid 
will determine what they can do; if they do not then netfilter will determine 
what they can do.   Also, squid is for http only (and ftp over http in 
client-proxy mode), whereas netfilter can be used to control access to all IP 
services, including ones which don't even use TCP or UDP (such as VPNs).

Anyway, here are two answers to your question.

1. How to block all users from bypassing the squid proxy except 192.168.1.21, 
192.168.1.100 and 192.168.1.200:

iptables -A FORWARD -s 192.168.1.21 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -s 192.168.1.100 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -s 192.168.1.200 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp --dport 80 -j REJECT

2. An alternative solutions, which will force all your internal users to go 
via squid (whether they've selected "use proxy" in their browser or not), 
therefore the access control of who is allowed to do what is now completely 
handled by squid:

iptables -A PREROUTING -t nat -s 192.168.1.0/24 -p tcp --dport 80 -j REDIRECT 
--to 3128

This will redirect all TCP port 80 requests (to anywhere) to go to TCP port 
3128 on the local machine (the one running squid) instead of reaching the 
external server.   This is called "transparent proxying" and is not the 
recommended way of using squid, but will generall work for the people who try 
to bypass "use proxy" in their browsers.

Hope this helps,

Antony.

-- 
Normal people think "If it ain't broke, don't fix it".
Engineers think "If it ain't broke, it doesn't have enough features yet".

                                                     Please reply to the list;
                                                           please don't CC me.


