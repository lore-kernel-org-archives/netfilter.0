From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: Help on IPTABLES
Date: Tue, 14 Oct 2003 02:59:01 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066114741.2384.118.camel@alpha.newkirk.us>
References: <83055D4B014C9E478D2F04624B9E82CF39E7D2@noveldc.novelgmt.mu>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <83055D4B014C9E478D2F04624B9E82CF39E7D2@noveldc.novelgmt.mu>
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
To: Gilles Yue <gyue@novelgmt.intnet.mu>
Cc: netfilter@lists.netfilter.org

On Thu, 2003-10-09 at 08:24, Gilles Yue wrote:
> Hi all,
> 
> Can somebody explain to me why is when i changed my Chain INPUT Rules
> from ACCEPT to DROP, i cannot browse the internet despite opening port
> 80 in the INPUT rule.
> However, when Chain INPUT is changed to ACCEPT, browsing the internet
> works fine. (Note: CHAIN Output is accept for ALL)

Are you talking about the rule targets, or the chain policy, changing? 
I'll assume you're talking about changing policy.  OUTPUT lets
connections from this machine out.  Fine. Input controls connections to
this machine, which you want to control.  Find out what
RH-Lokkit-0-50-INPUT does, and consider ditching it.  Add a stateful
rule:
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
And now most connections you initiate are allowed back.  (providing
something before this rule, like RH-Lokkit, doesn't drop it first)

> The configurations on my IPTABLES are as follows
> 
> Chain INPUT (policy DROP)
> target     prot opt source               destination
> RH-Lokkit-0-50-INPUT  all  --  anywhere             anywhere
> ACCEPT     tcp  --  anywhere             anywhere           tcp
> spt:http
> ACCEPT     udp  --  anywhere             anywhere           udp
> spt:http
> 
> Note that my OUTPUT Rules are as follows:
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> 
> I have two network cards installed on my pc - running Red Hat 9.0

If this box is 'sharing' the internet connection, you need to deal with
FORWARD chain rules and nat table rules as well...

> Routing for static routes are follows:
> 
> xx.yy.zz.aa        0.0.0.0         255.255.255.0       U     0     
> 0        0 eth0
> xx.0.0.0           0.0.0.0         255.0.0.0           U     0     
> 0        0 eth1
> 127.0.0.0          0.0.0.0         255.0.0.0           U     0     
> 0        0 lo
> 0.0.0.0            zz.zz.zz.zz       0.0.0.0           UG    0     
> 0        0 eth0
> 0.0.0.0            zz.zz.zz.zz       0.0.0.0           UG    0     
> 0        0 eth1
> 
> Where zz.zz.zz.zz is my gateway to the internet.
> eth0 - Interface with local address
> eth1 - Interface with Internet address.

OK.  Question...  Why is your internet gateway accessible via the local
interface??  Is it perhaps the default as well?  Definitely an issue
there.  

> By the way, is there a way to save static routes because when i reboot
> my pc, all routes are lost.
> 
> Thanks for any help.
> 
> gilles

BTW - dport80 on input would allow the internet to access a web server
at your IP, sport80 would allow HTTP replies back in.  And L Rodrigues'
advice is also valid.  (

Suggestions - leave OUTPUT chain empty with ACCEPT policy for now.  Work
on getting INPUT back into the box working the way you want it.  Then
transplant most of those rules to FORWARD to allow machines behind this
one to access the internet with similar restrictions.  And try using
"iptables -vnL" to list rules - more useful information that way.

j

>  


