From: "Rakhmat Farunuddin" <rakhmatf@softhome.net>
Subject: problem with ftp data connection
Date: Thu, 8 Apr 2004 14:33:19 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NIBBICIKKLPBAGJAKCNBIEDJCAAA.rakhmatf@softhome.net>
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
To: iptables netfilter <netfilter@lists.netfilter.org>

hai all

i have this configuration for my iptables (/etc/rc.d/init.d/iptables) below,
but with this configuration i only can login into the server, nothing more,
i can't download or upload my files, is there something wrong with my
configuration?


#############start
/etc/rc.d/init.d/iptables###################################################
#############
-----snipped-------------------
case "$1" in
start)
    echo -n "Starting Firewalling: "

############################################################################
########
    ##  CONFIGURATION (changes this value)
    IF_NAME="eth1"
    IP_ADDR="x.x.x.x"    ## IP address
    OKE_NET="x.x.x.x/24" ## Oke network
    IPTABLES="/sbin/iptables" ## path to iptables

############################################################################
########
    ## STATIC CONFIGURATION (DON'T TOUCH THIS)
    ANY_PORTS="0:65535"
    BCAST_SRC="0.0.0.0"
    BCAST_DST="255.255.255.255"
    CLASS_A="10.0.0/8"
    CLASS_B="172.16.0.0/12"
    CLASS_C="192.168.0.0/16"
    CLASS_D="224.0.0.0/4"
    CLASS_E="240.0.0.0/4"


-----snipped-------------------

    ## ALLOWING FTP CONNECTION FROM INTERNET
    $IPTABLES -A masup -p tcp -s 0/0 --sport $ANY_PORTS -d $IP_ADDR --dport
21 -m state --state NEW,ESTABLISHED -j ACCEPT
    $IPTABLES -A kuar -p tcp -s $IP_ADDR --sport 21 -d 0/0 --dport
$ANY_PORTS -m state --state ESTABLISHED -j ACCEPT

    ## ALLOWING FTP DATA CONNECTION FROM INTERNET
    $IPTABLES -A masup -p tcp -s 0/0 --sport $ANY_PORTS -d $IP_ADDR --dport
$ANY_PORTS -m state --state ESTABLISHED,RELATED -j ACCEPT
    $IPTABLES -A kuar -p tcp -s $IP_ADDR --sport $ANY_PORTS -d 0/0 --dport
$ANY_PORTS -m state --state ESTABLISHED -j ACCEPT

    ## ALLOWING FTP DATA CONNECTION FROM INTERNET
    $IPTABLES -A kuar -p tcp -s $IP_ADDR --sport 20  -d 0/0 --dport
$ANY_PORTS -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
    $IPTABLES -A masup -p tcp -s 0/0 --sport $ANY_PORTS -d $IP_ADDR --dport
20 -m state --state ESTABLISHED -j ACCEPT


-----snipped-------------------
#############end
/etc/rc.d/init.d/iptables###################################################
#############


Best Regards

Rakhmat Farunuddin, ST         | http://www.oke.com
Network & Security Engineer    | Jl. Abdul Muis 24 Jakarta
PT Trikomsel Multimedia        | 62-21 3440220


