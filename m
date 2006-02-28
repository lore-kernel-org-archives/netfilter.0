From: Tommy W <tommy@svearike.sytes.net>
Subject: How to make portforwarding work properly with two ISPs
Date: Tue, 28 Feb 2006 22:33:59 +0100
Message-ID: <200602282233.59855.tommy@svearike.sytes.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi
I'm having some trouble with getting my portforwarding to work.
Basically what I do is check for   destination ip and port, if they match my 
server's, then to DNAT to the correct box.
This works perfectly, unless the request is done on the "wrong" interface.
Meaning if a request comes in on my secondary interface.
I take it that ALL SENT to the GATEWAY will be redirected to the correct BOX 
BEHIND.. but it's when the BOX BEHIND starts talking back, it goes out on the 
standard interface instead of the secondary.
I use --set-mark 0x2 in the mangle table for getting traffic out on the 
secondary interface.

TELIA is my main line and BOSTREAM is my secondary line.
And this is the code used when doing portforwarding. only the first two 
commands work. the last two will fail (silently)

iptables -I PREROUTING -t nat -d $TELIAIP -p $PROTO -m $PROTO --dport $1 -j 
DNAT --to-destination $2:$3
iptables -I FORWARD -d $2 -i $TELIAIF -o $SRCIF -p $PROTO -m $PROTO --dport $3 
-j ACCEPT

iptables -I PREROUTING -t nat -d $BOSTREAMIP -p $PROTO -m $PROTO --dport $1 -j 
DNAT --to-destination $2:$3
iptables -I FORWARD -d $2 -i $BOSTREAMIF -o $SRCIF -p $PROTO -m $PROTO --dport 
$3 -j ACCEPT

Do I need to put the connection in some kind of connection tracking ?
I'm quite lost about this to be honest.
All help is appreciated

http://svearike.sytes.net/~ws/rc.firewall_

There's the firewall-script in it's whole.
If you find anything that looks stupid or if you have any other suggestions 
about the script, feel free to harrass me :)

Tommy W

