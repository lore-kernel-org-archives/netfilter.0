From: Krunk <krunkalot@hotpop.com>
Subject: NFS and iptables.
Date: Sat, 24 Apr 2004 17:00:37 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082844037.10067.20.camel@james>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

I've bound my NFS ports (moountd, statd, lockd, quotad) and freed up the
ports they are bound to, but the client still hangs when I try to mount
the remote share. 

rpcinfo -p
 program vers proto   port
    100000    2   tcp    111  portmapper
    100000    2   udp    111  portmapper
    100024    1   udp  32765  status
    100024    1   tcp  32765  status
    100003    2   udp   2049  nfs
    100003    3   udp   2049  nfs
    100003    2   tcp   2049  nfs
    100003    3   tcp   2049  nfs
    100021    1   udp  32772  nlockmgr
    100021    3   udp  32772  nlockmgr
    100021    4   udp  32772  nlockmgr
    100021    1   tcp  32769  nlockmgr
    100021    3   tcp  32769  nlockmgr
    100021    4   tcp  32769  nlockmgr
    100005    1   udp  32767  mountd
    100005    1   tcp  32767  mountd
    100005    2   udp  32767  mountd
    100005    2   tcp  32767  mountd
    100005    3   udp  32767  mountd
    100005    3   tcp  32767  mountd

command that opens ports:
 NFS="2049 32764 32765 32766 32767 32768 32772 sunrpc"
# opening tcp for NFS
for i in $NFS
do
   echo -n "$i"
   $IPT -A OUTPUT  -o $EXTIF -p tcp -s $EXTIP  \
    --dport $i --syn -m state --state NEW -j ACCEPT
   $IPT -A FORWARD -i $INTIF1 -p tcp -s $INTNET1 \
    --dport $i --syn -m state --state NEW -j ACCEPT
   $IPT -A FORWARD -i $INTIF2 -p tcp -s $INTNET2 \
    --dport $i --syn -m state --state NEW -j ACCEPT
done
echo ""
#opening udp for NFS
for i in $NFS
do
    echo -n "$i"
    $IPT -A OUTPUT  -o $EXTIF -p udp -s $EXTIP  \
        --dport $i -m state --state NEW -j ACCEPT
    $IPT -A FORWARD -i $INTIF1 -p udp -s $INTNET1 \
        --dport $i -m state --state NEW -j ACCEPT
    $IPT -A FORWARD -i $INTIF2 -p udp -s $INTNET2 \
        --dport $i -m state --state NEW -j ACCEPT
done
echo ""


This same loop is used for every service I've opened up (cups, ssh, etc)
and works fine. So I'm sure the loop itself works (e.g. it's in the
right spot sequentially, and the rest of the script works fine).

output of log file when client is trying to connect:

Apr 24 16:53:35 tuxmac DROPl:IN=eth1 OUT= MAC=<mac here> SRC=192.168.xxx.xxx DST=192.168.xxx.xxx LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=41035 DF PROTO=TCP SPT=896 DPT=111 WINDOW=5840 RES=0x00 SYN URGP=0
Apr 24 16:53:37 tuxmac DROPl:IN=ppp0 OUT= MAC= SRC=129.81.224.6 DST=<my isp assigned ip> LEN=89 TOS=0x00 PREC=0x00 TTL=46 ID=17196 DF PROTO=TCP SPT=143 DPT=49366 WINDOW=32900 RES=0x00 ACK PSH FIN URGP=0
Apr 24 16:53:38 tuxmac DROPl:IN=eth1 OUT= MAC=<eth1 mack here> SRC=192.168.xxx.xxx DST=192.168.xxx.xxx LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=41036 DF PROTO=TCP SPT=896 DPT=111 WINDOW=5840 RES=0x00 SYN URGP=0
Apr 24 16:53:44 tuxmac DROPl:IN=eth1 OUT= MAC=<eth1 mac here> SRC=192.168.xxx.xxx DST=192.168.xxx.xxx LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=41037 DF PROTO=TCP SPT=896 DPT=111 WINDOW=5840 RES=0x00 SYN URGP=0

The source and destination ip's are right.



