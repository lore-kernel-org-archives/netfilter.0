From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FORWARD question
Date: Thu, 20 Nov 2003 23:12:06 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311202312.hAKNC8723820@onyx.rockstone.co.uk>
References: <20031120215156.99184.qmail@web40809.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031120215156.99184.qmail@web40809.mail.yahoo.com>
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

On Thursday 20 November 2003 9:51 pm, Nick wrote:

> Antony, first of all thanks for your answer :-) If
> you don't mind I would like to clarify a few things.
>
> I know the router 'remembers' things about packets, I
> just don't know how much he remembers.That's where I
> am right now.

The connection tracking system remembers: source IP & port, destination IP & 
port (4 values), and the ESTABLISHED state then matches reply packets with 
source & destination reversed.   The RELATED state will also match packets 
with completely different port numbers, depending on the protocol involved 
(this is where the FTP conntrack helper comes in).

> I do use connection traccking, and I guess I use it
> correctly.(Earlier I had posted only a part of my
> script) I also have only one public IP, the FW machine
> sends FTP requests to the FTP server on 192.168.0.12.
>
> The only open port on the external NIC of the FW
> machine is 21.

If that really is true (I wonder how you think you have closed all the other 
ports?), then even FTP won't work, because it needs TCP port 20 as well (in 
active mode).

> My complete forward rules are those:
>
> $IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
> $IPTABLES -A FORWARD -m state --state
> ESTABLISHED,RELATED -j ACCEPT
>
> $IPTABLES -A FORWARD -i ppp0 -o $LAN_IFACE -p tcp -d
> $FTPSRV --dport 21 -m state --state NEW -j ACCEPT
>
> $IPTABLES -A FORWARD -i ppp0 -o $LAN_IFACE -p tcp -d
> $FTPSRV --dport 20 -j ACCEPT

The above rule is redundant (see whether "iptables -L -n -v -x" shows any 
packets having matched it) because of the "-m state" rule earlier.

> $IPTABLES -A FORWARD -i ppp0 -o $LAN_IFACE -p tcp -d
> $FTPSRV --dport 1024:65535 --sport 1024:65535 -j
> ACCEPT

Ditto.

> $IPTABLES -t nat -A PREROUTING -p tcp -d $INET_IP -i
> ppp0 --dport 21 -j DNAT --to $FTPSRV

This forwards FTP requests to your FTP server.

> $IPTABLES -t nat -A POSTROUTING -o ppp0 -s
> $LAN_IP_RANGE -j MASQUERADE

This makes sure all outgoing packets have a public source address, so the 
replies can get back to you.

> $INET_IP= public IP
> $LAN_IFACE=internal NIC of the FW server
>
> I use NEW when I forward to port 21 because I figured
> the first FTP request will be new. Am I right ?

Yes.

> If I understand correctly, the router will pick up FTP
> related traffic coming from the internet through ports
> 1024:65535 and forward it only to the FTP server
> because I do PREROUTING to my FTP server ?

The original packet coming in to your public IP address will be to port 21, 
and will therefore be NATted to your internal FTP server.

All future packets will match ESTABLISHED or RELATED, and will therefore 
match the first rule in your FORWARD chain.   You do not need to worry about 
packets other than the first one in your nat tables, because all future 
packets are automagically NATted (in both directions) by the protocol nat 
helper (this is why in my previous answer I said you should compile into your 
kernel, or load as modules, the connection tracking and nat helpers for FTP).

> Does the router say: 'this packet that came through
> port 1025 ist FTP related and I will FORWARD it only
> to the FTP server(because that's what PREROUTING tells
> me) and this packet coming through port 1026 is for
> client x.x.x.x (for which there is no PREROUTING) and
> I will send it to only him' ?

That depends on whether it is RELATED to an already ESTABLISHED ftp 
connection.

Provided there was a PORT command sent over the FTP control channel to 
specify data on port 1025, then yes.   If there was no PORT command telling 
the nat & conntrack helpers to expect a data connection on port 1025, then 
that packet will not be allowed through, and your network remains secure.

Basically what I'm saying is that if you use the nat and conntrack ftp 
helpers, your rules can be very simple and your network can be very secure, 
both at the same time.

If you do not use the nat and conntrack helpers, it is very difficult to make 
the ftp protocol both secure and functional at the same time.

> If that's so, great :-) Thanks again for your help

Try it and see :)

Antony.

-- 

What is this talk of software 'release' ?
Our software evolves and matures until it becomes capable of escape, leaving 
a bloody trail of designers and quality assurance people in its wake.

                                                     Please reply to the list;
                                                           please don't CC me.

