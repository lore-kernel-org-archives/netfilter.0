From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Telnet not being let through
Date: Wed, 18 Sep 2002 09:13:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020918081402.JFAL295.mta06-svc.ntlworld.com@there>
References: <FLEKIPPLAEDMJMOOBBDPCEPDCOAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FLEKIPPLAEDMJMOOBBDPCEPDCOAA.stewart.thompson@shaw.ca>
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

On Wednesday 18 September 2002 3:24 am, Stewart Thompson wrote:

> Chris:
>
> 	The order of the rules is important. You are jumping to the
> drop-and-log it chain I assume you also have defined. Remove the middle
> reference to it. Also define your Interfaces before you reference them in
> the script.

There's a few more fundamental aspects of this ruleset whcih I think need to 
be deal with here....

1. Rules are being defined with source & detination addresses of the internal 
land and the Internet, and these rules are being put in the INPUT chain.   
This makes no sense.

2. The 'drop and log' rule is quite reasonable, because it matches packets 
with an internal source address and an external destination, but which came 
in through the external interface....

3. The rule allowing packets from the Internet to go to the external IP of 
the firewall (which does make sense in the INPUT chain) allows for 
ESTABLISHED packets, and RELATED paclets, but not NEW ones, so there's no way 
to get the connection started...)

(NB: Since my last posting on this I've realised that even though Chris was 
defining rules with internal source and external destination addresses, he's 
not trying to allow traffic *through* the Firewall after all, therefore the 
Input chain is the correct place to put the rules.)

Antony.

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Chris Born
> Sent: September 17, 2002 7:15 PM
> To: netfilter@lists.netfilter.org
> Subject: Telnet not being let through
>
> I'm trying to allow telnet sessions through from the outside. Here are the
> rules I have for the input chain:
>
> $IPTABLES = /sbin/iptables
> $UNIVERSE = "0.0.0.0/0"
>
> $EXTIP = "`$IFCONFIG $EXTIF | /bin/grep 'inet addr'  | /bin/awk '{print 2}'
>
> | /bin/sed -e 's/.*://'`"
>
> $EXTIF = "eth1"
> $INTIF = "eth0"
>
> $INTNET = "192.168.0.0/24"
>
> $IPTABLES -P INPUT DROP
> $IPTABLES -F INPUT
>
> $IPTABLES -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
> $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $UNIVERSE -j ACCEPT
> $IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j drop-and-log-it
> $IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -m state --state
> ESTABLISEHED,RELATED
> $IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -p TCP --dport 23 -j
> ACCEPT
> $IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it
>
> Telnetting from and inside machine works just fine, but every time someone
> tries to connect from the outside the connection is refused. Wondering what
> I'm doing wrong here.
>
> -Chris Born

-- 

There are two possible outcomes.

If the result confirms the hypothesis, then you've made a measurement.
If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

