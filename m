From: Nick <fenderflames@yahoo.com>
Subject: Re: FORWARD question
Date: Thu, 20 Nov 2003 13:51:56 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031120215156.99184.qmail@web40809.mail.yahoo.com>
References: <200311202051.hAKKp8723558@onyx.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311202051.hAKKp8723558@onyx.rockstone.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Anthony, first of all thanks for your answer :-) If
you don't mind I would like to clarify a few things. 

I know the router 'remembers' things about packets, I
just don't know how much he remembers.That's where I
am right now.

I do use connection traccking, and I guess I use it
correctly.(Earlier I had posted only a part of my
script) I also have only one public IP, the FW machine
sends FTP requests to the FTP server on 192.168.0.12.

The only open port on the external NIC of the FW
machine is 21. 

My complete forward rules are those:

$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state
ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A FORWARD -i ppp0 -o $LAN_IFACE -p tcp -d
$FTPSRV --dport 21 -m state --state NEW -j ACCEPT

$IPTABLES -A FORWARD -i ppp0 -o $LAN_IFACE -p tcp -d
$FTPSRV --dport 20 -j ACCEPT

$IPTABLES -A FORWARD -i ppp0 -o $LAN_IFACE -p tcp -d
$FTPSRV --dport 1024:65535 --sport 1024:65535 -j
ACCEPT

$IPTABLES -t nat -A PREROUTING -p tcp -d $INET_IP -i
ppp0 --dport 21 -j DNAT --to $FTPSRV

$IPTABLES -t nat -A POSTROUTING -o ppp0 -s
$LAN_IP_RANGE -j MASQUERADE 

$INET_IP= public IP
$LAN_IFACE=internal NIC of the FW server

I use NEW when I forward to port 21 because I figured 
the first FTP request will be new. Am I right ?

If I understand correctly, the router will pick up FTP
related traffic coming from the internet through ports
1024:65535 and forward it only to the FTP server
because I do PREROUTING to my FTP server ? 

Does the router say: 'this packet that came through
port 1025 ist FTP related and I will FORWARD it only
to the FTP server(because that's what PREROUTING tells
me) and this packet coming through port 1026 is for
client x.x.x.x (for which there is no PREROUTING) and
I will send it to only him' ?

If that's so, great :-) Thanks again for your help

__________________________________
Do you Yahoo!?
Free Pop-Up Blocker - Get it now
http://companion.yahoo.com/

