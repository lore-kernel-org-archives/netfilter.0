From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how is this stuff getting thru default deny iptables firewall?....
Date: Sun, 23 Jun 2002 09:07:02 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020623080704.YEZE2755.mta05-svc.ntlworld.com@there>
References: <20020622103055.B32585@spawar.navy.mil> <20020622173842.AGM19225.mta07-svc.ntlworld.com@there> <20020623001302.A949@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020623001302.A949@spawar.navy.mil>
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

On Sunday 23 June 2002 8:13 am, Christian Seberino wrote:

> Here is my rule set... it is preceded by the usual stuff
> like flushing chains, dropping certain classes of packets, etc.
>
> These are the *only* rules with "-j ACCEPT" in my entire firewall script
> and somehow DNS sneaks thru...

Okay, let's look at just two of your filtering rules for a moment....

> # Allow all thru priviate LAN NIC.
> $IPTABLES -t filter -A FORWARD     -i $PROTECTED_NETWORK_INTERFACE    \
>           -s $PROTECTED_NETWORK         -d ! $PROTECTED_NETWORK_SPACE \
>           -j ACCEPT
> $IPTABLES -t filter -A FORWARD     -o $PROTECTED_NETWORK_INTERFACE    \
>           -s ! $PROTECTED_NETWORK_SPACE -d   $PROTECTED_NETWORK       \
>           -j ACCEPT

The first one says "packets coming in the internal nterface from an internal 
address, and going to an external address (not internal) are allowed through".

The second one says "packets coming out of the internal interface, from an 
external address (not internal), and going to an internal address are allowed 
through".

No port numbers are specified, therefore the first rule allows an internal 
client to connect to anything it likes out on the internet, and the second 
rule allows the internet to reply.

However, you're using private addresses, soweneed some sort of address 
translation rule:

> # The usual NAT stuff here.

> $IPTABLES -t nat    -A POSTROUTING -o $INTERNET_INTERFACE             \
>           -s   $PROTECTED_NETWORK       -d ! $PROTECTED_NETWORK_SPACE \
>           -j SNAT --to-source      $INTERNET_IP_ADDRESS

"Any packet going out of the external interface, from an internal address, to 
an external address (not internal) shall be source natted to the external IP 
of the firewall."

Reverse nat for replying packets is automatic, therefore replies get 
destination natted when they come back in.

This is how your internal clients can contact DNS servers; it is also how 
they can contact web servers, telnet, time, news, in fact anything which 
doesn't require a specific 'helper' on the firewall such as ftp, irc, h323.

 

Antony.

