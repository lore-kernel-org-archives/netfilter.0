From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: PASV rules opening up my high-ports - Whoops - sent the first one in HTML
Date: Tue, 27 May 2003 07:54:30 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6CE9@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: jherschel <jherschel@quarry.com>, netfilter@lists.netfilter.org

Forget that whole script and use the ip_conntrack_ftp modules.
then just use -m state --state RELATED,ESTABLISHED and passive will =
work.

(BTW: Does anybody use google.com anymore, google is your friend.. ;) )

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: jherschel [mailto:jherschel@quarry.com]
Sent: Tuesday, May 27, 2003 6:01 AM
To: netfilter@lists.netfilter.org
Subject: PASV rules opening up my high-ports - Whoops - sent the first
one in HTML


Howdy,

Thanks in advance for reading this, if this is a common issue, I =
apologize -
but could you point me to a searchable archive so I don't bug this list =
with
previously asked questions?

Anyways - here goes ...

I've got rules for FTP inbound/outbound for both PORT and PASV =
connections.
I'm also running MySQL, which defaults to port 3306.

If FTP PASV rules are enabled, either as a server or client, it seems =
all my
high ports are open to be connected to.  I've tried enforcing state, but =
I
end up either breaking the rule so that FTP doesn't work, or I end up
opening the high-ports again.

Is there a way to fix this by developing a better rule? Or should I =
limit my
PASV ports to a range that does not overlap with other services?

Here are the related rules ... (the PASV rules are commented out)

#
# General rules
#
modprobe ip_tables
modprobe ip_conntrack
modprobe ip_conntrack_ftp

#################################################################
# Kernel configuration section and cleansing of the filter, nat,#
# and mangle tables                                             #
#################################################################
echo -n $"clearing old rules from tables:"

$IPTABLES -F && \
$IPTABLES -t filter -F INPUT && \
$IPTABLES -t filter -F FORWARD && \
# commands to zero chain counters - needed on restart
$IPTABLES -X
$IPTABLES -t filter -Z && \

success $"clearing old rules from tables" || \
failure $"clearing old rules from tables"
echo

# set all filtering to DROP as default
echo -n $"setting default rules to DROP: "

# used to be IPTABLES -t filter -P ...

$IPTABLES -P INPUT DROP && \
$IPTABLES -P FORWARD DROP && \
$IPTABLES -P OUTPUT DROP  && \

success $"setting default rules to DROP" || \
failure $"setting default rules to DROP"
echo

#
# FTP RULES
#

if [[ $FTP_client =3D=3D 1 ]] ; then
        echo -n $"adding FTP client rules: "

        # Outgoing Request

        $IPTABLES -A INPUT -i $IFACE -p tcp \
                        -s any/0 --sport 21 \
                        -d $LOCAL_IP --dport 1024: \
                        -m state --state ESTABLISHED \
                        -j ACCEPT &&\
        $IPTABLES -A OUTPUT -o $IFACE -p tcp \
                        -s $LOCAL_IP --sport 1024: \
                        -d any/0 --dport 21 \
                        -m state --state NEW,ESTABLISHED \
                        -j ACCEPT &&\

        # PORT FTP Connections

        $IPTABLES -A INPUT -i $IFACE -p tcp \
                        -s any/0 --sport 20 \
                        -d $LOCAL_IP --dport 1024: \
                        -m state --state ESTABLISHED,RELATED \
                        -j ACCEPT &&\
        $IPTABLES -A OUTPUT -o $IFACE -p tcp \
                        -s $LOCAL_IP --sport 1024: \
                        -d any/0 --dport 20 \
                        -m state --state ESTABLISHED \
                        -j ACCEPT &&\

        # PASV FTP Connections

#       $IPTABLES -A INPUT -i $IFACE -p tcp \
#                       -s any/0 --sport 1024: \
#                       -d $LOCAL_IP --dport 1024: \
#                       -m state --state ESTABLISHED \
#                       -j ACCEPT &&\
#       $IPTABLES -A OUTPUT -o $IFACE -p tcp \
#                       -s $LOCAL_IP --sport 1024: \
#                       -d any/0 --dport 1024: \
#                       -m state --state ESTABLISHED,RELATED \
#                      -j ACCEPT &&\

        success $"adding FTP client rules" || \
        failure $"adding FTP client rules"
        echo
fi

Thanks again,

James



