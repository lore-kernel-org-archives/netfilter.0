From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: i use iptables for nat, and can connect with ping command but other ports can't connect
Date: Mon, 28 Oct 2002 15:17:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210281517.g9SFHle08726@vulcan.rissington.net>
References: <20021026211632.17973.qmail@web20305.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021026211632.17973.qmail@web20305.mail.yahoo.com>
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

On Saturday 26 October 2002 10:16 pm, Irvan Adrian Kristiono wrote:

> iptables -t nat -A POSTROUTING -s 192.168.15.0/24 -o
> eth0 -j SNAT --to-source myinternetip

Is that your complete ruleset ?   You have *no* other rules ?

> when i try to browse from my workstation which at 192.168.15.0/24
> it cannot find any page.. so i try ping command to yahoo.com
> IP, and get the reply.

When you "try to browse from your workstation" is that machine able to 
resolve the name to an IP address or not ?

When you try pinging to yahoo.com and get a reply is that also from the 
workstation, or from the firewall ?

Tell us:

1. The output of iptables -L -n -v

2. The routing table on your firewall (route -n)

3. Whether the firewall can resolve names (ping www.netfilter.org - doesn't 
matter whether you get a reply; does it resolve the IP address ?)

4. Whether the workstation can resolve names (ping www.samba.org - doesn't 
matter whether you get a reply; does it resolve the IP address ?)

Antony.

-- 

How I want a drink, alcoholic of course, after the heavy chapters
involving quantum mechanics.

 - 3.14159265358979

