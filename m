From: Oskar Andreasson <oan@frozentux.net>
Subject: Re: 3 part firewall
Date: 21 May 2003 13:00:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053514824.29649.281.camel@staring.direct2internet.com>
References: <200305202342.51581.robert.cole@support4linux.com>
	 <20030521100826.GA1359@floyd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030521100826.GA1359@floyd>
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
To: "robert.cole@support4linux.com" <robert.cole@support4linux.com>
Cc: netfilter@lists.netfilter.org

Hi Robert,

Hmmm, there should actually be an abundant of those kind of scripts, if
I'm not totally offbase :).

I have at least one script that should do almost exactly what you want
in the iptables tutorial at http://iptables-tutorial.frozentux.net. I
hope this is of some help.

Have a nice day,

Oskar Andreasson <oan@frozentux.net>


On Wed, 2003-05-21 at 12:08, Julian Gomez wrote:
> On Tue, May 20, 2003 at 11:42:51PM -0700, Robert Cole spoke thusly:
> >I have a server that has 3 real interfaces (no aliases). eth0 is the
> >public, eth1 is the private and eth2 is the DMZ interface. All the books
> >and docs I've seen so far work with only two interfaces and trying to
> >adapt those scripts is giving me a headache.
> 
> You did not supply any real IP addresses to go with it. Therefore, I'll
> assume it like so :
> 
> eth0	- 1.1.1.1
> eth1	- 192.168.250.0/24
> eth2	- 172.30.55.0/24
> 
> and the eth0 IP is static.
> 
> >I want to allow all private traffic out to the internet through PAT (port
> >address translation). But when going from the LAN to the DMZ I want no nat
> >or pat going on, only when leaving to the internet. 
> 
> Hmm, I don't think we hold the same definition for PAT. In any case, if you
> merely want normal SNAT / MASQ, do it like so.
> 
> /sbin/iptables -F
> /sbin/iptables -P INPUT DROP
> /sbin/iptables -P OUTPUT DROP
> /sbin/iptables -P FORWARD DROP
> 
> /sbin/iptables -A FORWARD -p all -s 192.168.250.0/24 -d any/0 -j ACCEPT
> /sbin/iptables -t nat -A POSTROUTING -p all -j SNAT --to-source \
>                1.1.1.1
> 
> /sbin/iptables -A OUTPUT -p all -m state --state ESTABLISHED,RELATED \
>                -j ACCEPT
> /sbin/iptables -A FORWARD -p all -m state --state ESTABLISHED,RELATED \
>                -j ACCEPT
> /sbin/iptables -A INPUT -p all -m state --state ESTABLISHED,RELATED \
>                -j ACCEPT
> 
> >Next I would like a strict rule that allows another public IP to be 1 to 1 
> >nat'd from the public interface to a server out the DMZ interface.
> 
> /sbin/iptables -t nat -A PREROUTING -p tcp -s any/0 -d 1.1.1.1 \
>                --dport 12345 -j DNAT --to-destination 172.30.55.100:12345
> 
> /sbin/iptables -A FORWARD -p tcp -s any/0 -d 172.30.55.100 --dport 22 \
>                -j ACCEPT
> 
> >I'm currently using narc to setup the firewall and it appears to work to
> >get basic internet bound traffic from the lan and I can get to the DMZ
> >from the LAN without translation so I'm close here but getting the 1 to 1
> >NAT working is causing me grief.
> 
> Haven't use narc, can't comment. The aforementioned rules can be tightened
> somemore, depending on your overall situation.
> 



