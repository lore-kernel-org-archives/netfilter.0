From: Nick <fenderflames@yahoo.com>
Subject: Re: FORWARD question
Date: Fri, 21 Nov 2003 03:59:15 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031121115915.79176.qmail@web40805.mail.yahoo.com>
References: <200311211134.hALBYt724579@onyx.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311211134.hALBYt724579@onyx.rockstone.co.uk>
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

Antony, I thought I had it all figured out.
Apparently, I don't... :-(

On the routing machine the INPUT looks something like
this:

$IPTABLES -N allowed
$IPTABLES -N tcp_packets

$IPTABLES -A allowed -p TCP --syn -j ACCEPT

$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 21 -j
allowed

$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -p TCP -i $INET_IFACE -j
tcp_packets


So, if I understand what you're saying, I shouldn't
have this

$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 21 -j
allowed

in my INPUT. I should have it in FORWARD. Right ?

I thought it should be in INPUT so that the router
'gets' the incoming request, and once it has it, it
will FORWARD it to the LAN server. 

Now, if this rule should be in the FORWARD, what
should I have in INPUT in order to acept NEW FTP
requests ? Or is FORWARD doing this automatically ? 

I promised that the previous message would be the last
one. Sorry for breaking my promise :-)

__________________________________
Do you Yahoo!?
Free Pop-Up Blocker - Get it now
http://companion.yahoo.com/

