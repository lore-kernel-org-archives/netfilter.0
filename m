From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Yet another FTP connection problem
Date: Thu, 6 Jun 2002 17:50:18 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206061650.g56GoQA32044@vulcan.rissington.net>
References: <200206061606.g56G6SA31895@vulcan.rissington.net> <376479889.1023388232@[192.168.13.4]>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <376479889.1023388232@[192.168.13.4]>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Thursday 06 June 2002 5:30 pm, Erik Pagel wrote:

> > Please can you tell us whether you are trying to ftp from this machine
> > with  the netfilter rules on, or is the netfilter machine acting as a
> > router  between the ftp client and server ?
>
> Both, I want so send files from this machine and this machine also act as
> router for my internal network.
> That the reason why I apply the rules to all three chains.

Okay.   Let's deal with those two requirements one at a time.

First, to use this machine as an ftp client to a machine on the Internet:

# standard policy on all chains
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# allow ftp control connections outbound
iptables -A OUTPUT -p tcp --dport 21 -j ACCEPT
# allow replies back from ftp servers
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# if you want to use names your firewall must be able to do DNS lookups
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

With those rules you should be able to contact external ftp servers from the 
firewall and send / receive files.

You need to have loaded as modules, or compiled into your kernel, state 
matching, ftp connection tracking and general connection tracking.

Next, allow this machine to route internal ftp clients to external servers:

iptables -A FORWARD -o $EXT_IF -p tcp --dport 21 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -o $EXT_IF -p tcp --dport 53 -j ACCEPT
iptables -A FORWARD -o $EXT_IF -p udp --dport 53 -j ACCEPT

if you need to masquerade internal clients behind your firewall's external 
address (which wasn't in your original ruleset, so maybe you don't need to ?):

iptables -A POSTROUTING -t nat -o $EXT_IF -j SNAT --to $EXT_IP

Let us know how you get on with those.


Antony.

