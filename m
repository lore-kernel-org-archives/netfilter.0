From: Greg Cope <gregcope@gmail.com>
Subject: Re: Help debugging iptables firewall....
Date: Tue, 25 Jan 2005 17:24:59 +0000
Message-ID: <c0e9781f050125092466365224@mail.gmail.com>
References: <27594E8BA9D5CA458F5EF87D88B6B48F01991C@pxtvjoexd01.pxt.primeexalia.com>
Reply-To: Greg Cope <gregcope@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <27594E8BA9D5CA458F5EF87D88B6B48F01991C@pxtvjoexd01.pxt.primeexalia.com>
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

Hi Gary,

Pinholes?  If you mean specific IP to specific IP:PORT on specfic
interfaces then yes.

DB is an oracle listener (port 1521)

I have these:

# for ssh to db server from webserver
$IPTABLES -A FORWARD -p tcp --dport 22 -i $DMZ_IFACE -s $DMZ_EDGE_IP
-o $LAN_IFACE -d $TROT_IP -j ACCEPT

$IPTABLES -A FORWARD -p tcp --dport 1521 -i $DMZ_IFACE -s $DMZ_EDGE_IP
-o $LAN_IFACE -d $TROT_IP -j ACCEPT

I added 2 of your examples one before one after, and only see:

Jan 25 17:21:43 gateway kernel: Oracle 1521 [tcp] before: IN=eth1
OUT=eth2 SRC=192.168.254.3 DST=192.168.0.5 LEN=60 TOS=0x00 PREC=0x00
TTL=63 ID=30447 DF PROTO=TCP SPT=32907 DPT=1521 WINDOW=5840 RES=0x00
SYN URGP=0

Which would imply that the rule is ok and the packets goes through -
but why I am not getting a connection?

Thanks,

Greg

On Tue, 25 Jan 2005 09:13:04 -0800, Gary W. Smith <gary@primeexalia.com> wrote:
> I would recommend that you put a log entry for the protocol(s) or IP to
> IP connections that you want to debug across the DMZ.  I did this while
> trying to debug some IPSEC traffic.
> 
> -A FORWARD -p tcp -m tcp --dport 1433 -j LOG --log-prefix "MySQL [tcp]:
> " --log-level 1
> -A FORWARD -p udp -m udp --dport 1433 -j LOG --log-prefix "MySQL [udp]:
> " --log-level 1
> 
> Put this at the beginning of the chain (tweak it for whatever DB you
> need) and then just watch the calls to make sure that you are see the
> flow that you want.  When you are done move them down to the end of the
> chain, if they are still hitting then you are loosing packets.
> 
> BTW, are you running pinholes (point to point IP for each port you want
> open)?  What DB?
> 
> Gary Wayne Smith
> 
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Greg Cope
> Sent: Tuesday, January 25, 2005 8:54 AM
> To: netfilter@lists.netfilter.org
> Subject: Help debugging iptables firewall....
> 
> Hi All,
> 
> I have a 3 interface firewall (internet, dmz, lan).
> 
> For some reason a dmz host can longer ssh or connect to a DB server on
> the lan(it could before).
> 
> Nothing seems to get logged with a $IPTABLES -A FORWARD -j LOG
> --log-prefix "FORWARD DENY: " rule.  And when I disable the FW and
> enable the plain routing it seems to be able to connect ok.
> 
> At a loss as to why this would not work without logging something.
> 
> Firewall and Webserver are FC1, DB server is Redhat AS3.
> 
> Could someone suggest some ideas on debuging this?
> 
> Any  ideas gratefully received.
> 
> Greg
> 
>

