From: Alessandro Prete <alessandro.prete@polial.polito.it>
Subject: Problem with ip_nat_amanda
Date: Sat, 24 May 2003 18:22:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3ECF9C4C.7070300@polial.polito.it>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,
=20
I=E2=80=99m going into troubles using the new ip_nat_amanda module, it se=
ems to=20
correctly translate my internal IP into the nat-ext if. IP with =E2=80=9C=
master=20
connections=E2=80=9D (UDP port 10080), but no translation is done for the=
 TCP=20
ones, as you can see from sendbackup log. Now Amanda works if the client=20
on the external net knows how to reach the IP of the internal server,=20
this is good, but not very elegant for a nat implementation.
All machines use Kernel is 2.4.20-13.8 from RHNet, but I have made a=20
custom and patched 2.4.20-9 and found the same problem.
I am thinking on a problem of the ip_nat_amanda module because otherwise=20
the my nat works great.
Can someone help me?
=20
Thank,
            Alessandro


Network diagram:

amanda client
        |
        | nat-ext. if.
      nat
        | nat-int. if.
        | 192.168.1.1
amanda server

iptables script:

...

FWD=3D`cat /proc/sys/net/ipv4/ip_forward`
echo "0" > /proc/sys/net/ipv4/ip_forward

echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter

echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route

echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects

echo 0 > /proc/sys/net/ipv4/conf/all/log_martians

echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all

echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout

echo 1800 > /proc/sys/net/ipv4/tcp_keepalive_intvl


$IPTABLES -P OUTPUT  DROP
$IPTABLES -P INPUT   DROP
$IPTABLES -P FORWARD DROP


MODULE_DIR=3D"/lib/modules/`uname -r`/kernel/net/ipv4/netfilter/"=20
MODULES=3D`(cd $MODULE_DIR; ls *_conntrack_*  *_nat_* | sed 's/\.o.*$//')=
`
for module in $(echo $MODULES); do=20
  if $LSMOD | grep ${module} >/dev/null; then continue; fi
  if [ -e "${MODULE_DIR}/${module}.o" -o -e "${MODULE_DIR}/${module}.o.gz=
" ]; then=20
    $MODPROBE ${module} ||  exit 1=20
  fi=20
done


#
#  Rule 0(NAT)
#=20
#=20
$IPTABLES -t nat -A PREROUTING  -p tcp  -s 192.168.1.0/24  --destination-=
port 80 -j REDIRECT --to-ports 8080 =20
#
#  Rule 1(NAT)
#=20
#=20
$IPTABLES -t nat -A POSTROUTING -o eth0  -s 192.168.1.0/24 -j SNAT --to-s=
ource <nat-ext. if> =20
#
#


$IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

...

# Rule 1(global)
#=20
#=20
$IPTABLES -A INPUT -p tcp  -m multiport  -s <nat-ext. if>  --destination-=
ports 80,443,53,22,25  -m state --state NEW  -j ACCEPT=20
$IPTABLES -A INPUT -p tcp  -m multiport  -s 192.168.0.2  --destination-po=
rts 80,443,53,22,25  -m state --state NEW  -j ACCEPT=20
$IPTABLES -N Cid3DE1F6A4.0
$IPTABLES -A INPUT -p udp  -m multiport  --destination-ports 53,123  -m s=
tate --state NEW  -j Cid3DE1F6A4.0=20
$IPTABLES -A Cid3DE1F6A4.0  -s <nat-ext. if>  -m state --state NEW  -j AC=
CEPT=20
$IPTABLES -A Cid3DE1F6A4.0  -s 192.168.0.2  -m state --state NEW  -j ACCE=
PT=20
$IPTABLES -A OUTPUT -p tcp  -m multiport  --destination-ports 80,443,53,2=
2,25  -m state --state NEW  -j ACCEPT=20
$IPTABLES -A OUTPUT -p udp  -m multiport  --destination-ports 53,123  -m =
state --state NEW  -j ACCEPT=20

...
# Rule 8(global)
#=20
$IPTABLES -N RULE_8
$IPTABLES -A INPUT  -s 192.168.1.0/24  -m state --state NEW  -j RULE_8 =20
$IPTABLES -A RULE_8   -m limit --limit 5/second -j LOG  --log-level info =
--log-prefix "RULE 8 -- ACCEPT "=20
$IPTABLES -A RULE_8  -j ACCEPT=20
# Rule 13(global)
#=20
#=20
$IPTABLES -A INPUT  -s 192.168.1.0/24  -m state --state NEW  -j ACCEPT=20
$IPTABLES -A OUTPUT  -s 192.168.1.0/24  -m state --state NEW  -j ACCEPT =20
$IPTABLES -A FORWARD  -s 192.168.1.0/24  -m state --state NEW  -j ACCEPT=20
#=20
# Rule 14(global)
#=20
$IPTABLES -N RULE_14
$IPTABLES -A OUTPUT  -j RULE_14=20
$IPTABLES -A INPUT  -j RULE_14=20
$IPTABLES -A FORWARD  -j RULE_14=20
$IPTABLES -A RULE_14   -m limit --limit 5/second -j LOG  --log-level info=
 --log-prefix "RULE 14 -- DROP "=20
$IPTABLES -A RULE_14  -j DROP=20
#
#
echo 1 > /proc/sys/net/ipv4/ip_forward




----- amandad log:

amandad: debug 1 pid 17674 ruid 33 euid 33 start time Fri May 23 21:00:00=
 2003
amandad: version 2.4.2p2
amandad: build: VERSION=3D"Amanda-2.4.2p2"
amandad:        BUILT_DATE=3D"Sun Jun 23 09:39:09 EDT 2002"
amandad:        BUILT_MACH=3D"Linux perf90.perf.redhat.com 2.4.18-5smp #1=
 SMP Mon Jun 10 15:19:40 EDT 2002 i686 unknown"
amandad:        CC=3D"gcc"
amandad: paths: bindir=3D"/usr/bin" sbindir=3D"/usr/sbin"
amandad:        libexecdir=3D"/usr/lib/amanda" mandir=3D"/usr/share/man"
amandad:        AMANDA_TMPDIR=3D"/tmp/amanda" AMANDA_DBGDIR=3D"/tmp/amand=
a"
amandad:        CONFIG_DIR=3D"/etc/amanda" DEV_PREFIX=3D"/dev/"
amandad:        RDEV_PREFIX=3D"/dev/r" DUMP=3D"/sbin/dump"
amandad:        RESTORE=3D"/sbin/restore" SAMBA_CLIENT=3D"/usr/bin/smbcli=
ent"
amandad:        GNUTAR=3D"/bin/tar" COMPRESS_PATH=3D"/bin/gzip"
amandad:        UNCOMPRESS_PATH=3D"/bin/gzip" MAILER=3D"/usr/bin/Mail"
amandad:        listed_incr_dir=3D"/var/lib/amanda/gnutar-lists"
amandad: defs:  DEFAULT_SERVER=3D"localhost" DEFAULT_CONFIG=3D"DailySet1"
amandad:        DEFAULT_TAPE_SERVER=3D"localhost"
amandad:        DEFAULT_TAPE_DEVICE=3D"/dev/null" HAVE_MMAP HAVE_SYSVSHM
amandad:        LOCKING=3DPOSIX_FCNTL SETPGRP_VOID DEBUG_CODE
amandad:        AMANDA_DEBUG_DAYS=3D4 BSD_SECURITY USE_AMANDAHOSTS
amandad:        CLIENT_LOGIN=3D"amanda" FORCE_USERID HAVE_GZIP
amandad:        COMPRESS_SUFFIX=3D".gz" COMPRESS_FAST_OPT=3D"--fast"
amandad:        COMPRESS_BEST_OPT=3D"--best" UNCOMPRESS_OPT=3D"-dc"
got packet:
--------
Amanda 2.4 REQ HANDLE 005-10680608 SEQ 1053716405
SECURITY USER amanda
SERVICE sendsize
OPTIONS maxdumps=3D5;hostname=3D<amanda client>;
GNUTAR / 0 1970:1:1:0:0:0 -1 exclude-file=3D./amhdisk
GNUTAR / 1 2003:5:21:19:7:10 -1 exclude-file=3D./amhdisk
--------

sending ack:
----
Amanda 2.4 ACK HANDLE 005-10680608 SEQ 1053716405
----

bsd security: remote host <nat-ext.if> user amanda local user amanda
amandahosts security check passed
amandad: running service "/usr/lib/amanda/sendsize"
amandad: sending REP packet:
----
Amanda 2.4 REP HANDLE 005-10680608 SEQ 1053716405
OPTIONS maxdumps=3D5;
/ 0 SIZE 5145230
/ 1 SIZE 2825450
----

amandad: got packet:
----
Amanda 2.4 ACK HANDLE 005-10680608 SEQ 1053716405
----

amandad: pid 17674 finish time Fri May 23 21:01:38 2003


------ sendbackup log:

sendbackup: debug 1 pid 17707 ruid 33 euid 33 start time Fri May 23=20
21:07:05 2003

/usr/lib/amanda/sendbackup: version 2.4.2p2
sendbackup: got input request: GNUTAR / 1 2003:5:21:19:7:10 OPTIONS |;bsd=
-auth;compress-fast;index;exclude-file=3D./amhdisk;
  parsed request as: program `GNUTAR'
                     disk `/'
                     lev 1
                     since 2003:5:21:19:7:10
                     opt `|;bsd-auth;compress-fast;index;exclude-file=3D.=
/amhdisk;'
sendbackup: try_socksize: send buffer size is 65536
sendbackup: stream_server: waiting for connection: 0.0.0.0.41834
sendbackup: stream_server: waiting for connection: 0.0.0.0.41835
sendbackup: stream_server: waiting for connection: 0.0.0.0.41836
  waiting for connect on 41834, then 41835, then 41836
sendbackup: stream_accept: connection from 192.168.1.1.33517 <-----------=
---------- instead of <nat-ext.if>
sendbackup: stream_accept: connection from 192.168.1.1.33521 <-----------=
---------- instead of <nat-ext.if>
sendbackup: stream_accept: connection from 192.168.1.1.33524 <-----------=
---------- instead of <nat-ext.if>
got all connections
sendbackup: spawning /bin/gzip in pipeline
sendbackup: argument list: /bin/gzip --fast
sendbackup-gnutar: pid 17708: /bin/gzip --fast
sendbackup-gnutar: doing level 1 dump as listed-incremental from /var/lib=
/amanda/gnutar-lists/<amanda client>__0 to /var/lib/amanda/gnutar-lists/<=
amanda client>__1.new
sendbackup-gnutar: doing level 1 dump from date: 2003-05-21 19:07:11 GMT
sendbackup: spawning /usr/lib/amanda/runtar in pipeline
sendbackup: argument list: gtar --create --file - --directory / --one-fil=
e-system --listed-incremental /var/lib/amanda/gnutar-lists/<amanda client=
>__1.new --sparse --ignore-failed-read --totals --exclude ./amhdisk .
sendbackup: started index creator: "/bin/tar -tf - 2>/dev/null | sed -e '=
s/^\.//'"
sendbackup-gnutar: /usr/lib/amanda/runtar: pid 17710
sendbackup: index created successfully
sendbackup: pid 17707 finish time Fri May 23 21:28:18 2003




