From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Telnet not being let through
Date: Wed, 18 Sep 2002 08:50:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020918075004.IKXF295.mta06-svc.ntlworld.com@there>
References: <5.1.1.6.0.20020917182240.00b2f008@mail.attbi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.1.6.0.20020917182240.00b2f008@mail.attbi.com>
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

On Wednesday 18 September 2002 3:15 am, Chris Born wrote:

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
> ACCEPT $IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it
>
> Telnetting from and inside machine works just fine, but every time someone
> tries to connect from the outside the connection is refused. Wondering what
> I'm doing wrong here.

Simple.   You're putting the rules into the INPUT chain instead of the 
FORWARD chain.

INPUT is for packets destined to the machine running netfilter.

FORWARD is for packets going through the machine running netfilter.

Antony.

-- 

Which part of 'apt-get dist-upgrade' do you not understand ???

