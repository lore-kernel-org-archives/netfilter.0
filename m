From: David Busby <busby@edoceo.com>
Subject: Re: --policy DROP kills everything?
Date: Wed, 08 Jun 2005 16:32:23 -0700
Message-ID: <42A78007.7080504@edoceo.com>
References: <20050608220107.994108EDCEB@smtp.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050608220107.994108EDCEB@smtp.sterenborg.info>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Rob Sterenborg wrote:
> 
> Add this on top of the other INPUT rules :
> 
> -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> 

Ok so I changed the rules to this:

Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
ACCEPT     all  --  127.0.0.0/8          0.0.0.0/0
ACCEPT     udp  --  192.168.42.1         192.168.42.2        udp spt:53
ACCEPT     tcp  --  0.0.0.0/0            192.168.42.2        tcp dpt:22
ACCEPT     tcp  --  0.0.0.0/0            192.168.42.2        tcp dpt:80
LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG level warning

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

But it won't accept new connections on port 80 or 22.  The Established SSH conection is fine.
I can see new connections to port 80 or 22 in my logs, see:

IN=eth0 OUT= MAC=00:01:03:d2:db:0b:00:11:5b:50:ff:a4:08:00 SRC=192.168.42.34 DST=192.168.42.2 LEN=48 TOS=0x00 PREC=0x00 
TTL=128 ID=18259 DF PROTO=TCP SPT=3704 DPT=80 WINDOW=65535 RES=0x00 SYN URGP=0

IN=eth0 OUT= MAC=00:01:03:d2:db:0b:00:11:5b:50:ff:a4:08:00 SRC=192.168.42.34 DST=192.168.42.2 LEN=48 TOS=0x00 PREC=0x00 
TTL=128 ID=18526 DF PROTO=TCP SPT=3705 DPT=22 WINDOW=65535 RES=0x00 SYN URGP=0

Why they don't jump to accept?  They match a rule.

So then I adjusted #1 above to this

ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state NEW,RELATED,ESTABLISHED

Doesn't that now allow any new connection to any port on any protocol making my FW worthless?
Then I tried moving the RELATED,ESTABLISHED to the last rule like this:

imperium root # iptables -L INPUT -n
Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  127.0.0.0/8          0.0.0.0/0
ACCEPT     udp  --  192.168.42.1         192.168.42.2        udp spt:53
ACCEPT     tcp  --  0.0.0.0/0            192.168.42.2        tcp dpt:22
ACCEPT     tcp  --  0.0.0.0/0            192.168.42.2        tcp dpt:80
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 4

But I still cannot get new connections in and my estabilshed SSH is still OK.

Should I not use policy DROP but add a last rule of DROP?  Which is the "right" way?
I guess I learned so far that I need to accept new and established.  But I cannot seem to get the rules to work.
I've been up and down the man page and samples but seem to be missing one more stupid little thing :(
Please help.

/djb

