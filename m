From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: Telnet not being let through
Date: Tue, 17 Sep 2002 19:24:57 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPCEPDCOAA.stewart.thompson@shaw.ca>
References: <5.1.1.6.0.20020917182240.00b2f008@mail.attbi.com>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <5.1.1.6.0.20020917182240.00b2f008@mail.attbi.com>
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
To: Chris Born <ragable@attbi.com>, netfilter@lists.netfilter.org

Chris:

	The order of the rules is important. You are jumping to the
drop-and-log it chain I assume you also have defined. Remove the middle
reference to it. Also define your Interfaces before you reference them in
the script.

Stu.........


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Chris Born
Sent: September 17, 2002 7:15 PM
To: netfilter@lists.netfilter.org
Subject: Telnet not being let through

I'm trying to allow telnet sessions through from the outside. Here are the
rules I have for the input chain:

$IPTABLES = /sbin/iptables
$UNIVERSE = "0.0.0.0/0"

$EXTIP = "`$IFCONFIG $EXTIF | /bin/grep 'inet addr'  | /bin/awk '{print 2}'
| /bin/sed -e 's/.*://'`"

$EXTIF = "eth1"
$INTIF = "eth0"

$INTNET = "192.168.0.0/24"

$IPTABLES -P INPUT DROP
$IPTABLES -F INPUT

$IPTABLES -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
$IPTABLES -A INPUT -i $INTIF -s $INTNET -d $UNIVERSE -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j drop-and-log-it
$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -m state --state
ESTABLISEHED,RELATED
$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -p TCP --dport 23 -j
ACCEPT
$IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it

Telnetting from and inside machine works just fine, but every time someone
tries to connect from the outside the connection is refused. Wondering what
I'm doing wrong here.

-Chris Born




