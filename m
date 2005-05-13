From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: tableview.sh
Date: Fri, 13 May 2005 18:48:44 +0200
Message-ID: <fad9d484050513094833eb1148@mail.gmail.com>
Reply-To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org, lartc <lartc@mailman.ds9a.nl>

netfilter and lartc members

I just thought it's time I contribute. I created this little script to
help me while setting up iptables rules for firewalling, shaping or
both. I hope this helps someone.

Called tableview.sh, inspired by Table Mountain, Cape Town, ZA :)

--- SOF ----

#!/bin/sh
#     ____
#  /\/    \/\
# /__________\
#
# Simple loop for keeping track of what is happening in a
# iptables setup
#

table_filter(){
        echo
        echo "FILTER TABLE"
        echo "------------"
        echo
        iptables -nvL
}
table_mangle(){
        echo
        echo "MANGLE TABLE"
        echo "------------"
        echo
        iptables -nvL -t mangle
}
table_nat(){
        echo
        echo "NAT TABLE"
        echo "---------"
        echo
        iptables -nvL -t nat
}
footer(){
        echo
        echo "-------------------------------------------------------------=
"
        echo "Show table: [F]ilter, [M]angle, [N]AT or hit return to reload=
"
}

last=3D"filter"

while [ 1 ]; do
        clear
        case "$REPLY" in
                "F" | "f" )
                        table_filter
                        last=3D"filter"
                        ;;
                "M" | "m" )
                        table_mangle
                        last=3D"mangle"
                        ;;
                "N" | "n" )
                        table_nat
                        last=3D"nat"
                        ;;
                "Q" | "q" )
                        exit 0
                        ;;
                *)
                        table_$last
                        ;;
        esac
        footer
        read
done

--- EOF ---

Regards

--=20

Kenneth Kalmer
kenneth.kalmer@gmail.com
http://opensourcery.blogspot.com

