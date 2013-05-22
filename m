From: Nick Khamis <symack@gmail.com>
Subject: Re: IPTables - Going Stateless
Date: Wed, 22 May 2013 08:31:03 -0400
Message-ID: <CAGWRaZYbbKFeeRViAcbrV3LGv1s_fcbVk4qbcJjQKD4sy5i7uA@mail.gmail.com>
References: <CAGWRaZbwp8jDPxDzHX6g_LkpK74iB6K4GSoU7c_5THDSx1oDmQ@mail.gmail.com>
	<ACBD9B315535B2489252E981FF05808602C2A0A034@EDBCL19EX001.edb.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=ja+NOZm31C429vDsst9mX3uhkWQ293rYWovkBPDrPr4=;
        b=DWbTs/akAEk6Mw1JZpt39avH/XwyZFd4OWYEXZp/PddLC6NBgtCdoLRRoao9/24xsn
         csE5Hv9ckXQ3xJaz4g9t5ypzid0W4mbPmqiubuz3PzJy/jgE0DjD2d4AYSk//X3XQqDz
         16eYU73VD6XeAh1UN+iZQNDqRGRmhc2AgsYTO8sSjmZPz3IEEWw6jVLMnQDKRevfi6ns
         pp8bX4HvY9O46mbIDx+wLLlXJEtCp/hbo2s4ANZURgfKV58Patcnwyo8IjbD4uEWViMU
         MngxX24rqqBs2e9DhFmgScFbBwabc2H6uPKfYLKfe8X1ZJsmomhSfkFc2kV9iIkh5Yyd
         2QvA==
In-Reply-To: <ACBD9B315535B2489252E981FF05808602C2A0A034@EDBCL19EX001.edb.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?ISO-8859-1?Q?Paulsberg_Andr=E9?= <Andre.Paulsberg@evry.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello Everyone,

Thank you so much for your help. We have migrated to bare stateless
with modest performance gain to our front router (2 full bgp links).
At first glance we see a minimum of 3% of leaked bandwith getting put
back into use. For us that means 3000 kilobytes per link. This is
during bellow average traffic hours, I suspect more during peak.

Since I took bits an pieces from the different posts, I only find it
fair to post snippets of the config file that might help some future
poor souls. Nothing interesting for a lot of you here:

#Set interface values
INTIF1='eth0'

# Set Log Limit
LOGLIMIT="2/s"
LOGLIMITBURST="10"

#flush rules and delete chains
$IPTABLES -F
$IPTABLES -X

#echo -e "       - Dropping Forward Requests"
$IPTABLES -P FORWARD DROP

#echo -e "       - Dropping Input Requests"
$IPTABLES -P INPUT ACCEPT

#echo -e "       - Dropping output requests"
$IPTABLES -P OUTPUT ACCEPT

#echo -e "       - Accepting input lo traffic"
$IPTABLES -A INPUT -i lo -j ACCEPT

#echo -e "       - Accepting output lo traffic"
$IPTABLES -A OUTPUT -o lo -j ACCEPT

#echo -e "       - Defined Chains"
$IPTABLES -N ICMP
$IPTABLES -N TCP
$IPTABLES -N UDP
$IPTABLES -N LOGINPUT
$IPTABLES -N LOGOUTPUT

#echo -e "       - Accepting incomming ICMP pings"
$IPTABLES -A ICMP -p icmp -m icmp -s 10.10.1.0/24 -d 10.10.1.10
--icmp-type 8 -j ACCEPT
$IPTABLES -A ICMP -p icmp -m icmp -s 10.10.1.10 --icmp-type 0 -j ACCEPT

#echo -e "       - Accepting outgoing ICMP pings"
$IPTABLES -A ICMP -p icmp -m icmp -s 10.10.1.10 -d 10.10.1.0/24
--icmp-type 8 -j ACCEPT
$IPTABLES -A ICMP -p icmp -m icmp -s 10.10.1.0/24 --icmp-type 0 -j ACCEPT

#echo -e "       - Accepting incomming SSH Traffic"
$IPTABLES -A TCP -p tcp -m tcp -s 10.10.1.0/24 -d 10.10.1.10 --dport
22 -j ACCEPT
$IPTABLES -A TCP -p tcp -m tcp -s 0.0.0.0/0 -d 10.10.1.10 --dport 22 -j DROP

#echo -e "       - Accepting outgoing SSH Traffic"
$IPTABLES -A TCP -p tcp -m tcp -s 10.10.1.10 --sport 22 -d
10.10.1.0/24 -j ACCEPT
$IPTABLES -A TCP -p tcp -m tcp -s 10.10.1.10 --sport 22 -d 0.0.0.0/0 -j DROP

#echo -e "       - Accepting input ICMP, TCP, and UDP traffic to open ports"
$IPTABLES -A INPUT -i $INTIF1 -p icmp -j ICMP
$IPTABLES -A INPUT -i $INTIF1 -p tcp -j TCP
$IPTABLES -A INPUT -i $INTIF1 -p udp -j UDP

#echo -e "       - Accepting output ICMP, TCP, and UDP traffic to open ports"
$IPTABLES -A OUTPUT -o $INTIF1 -p icmp -j ICMP
$IPTABLES -A OUTPUT -o $INTIF1 -p tcp -j TCP
$IPTABLES -A OUTPUT -o $INTIF1 -p udp -j UDP

#echo -e "       - Logging Dropped Input Traffic"
$IPTABLES -A LOGINPUT -i $INTIF1 -p icmp -j LOG --log-prefix "ICMP
LOGINPUTDROP: " --log-tcp-options --log-ip-options
$IPTABLES -A LOGINPUT -i $INTIF1 -p tcp --tcp-flags FIN,SYN,RST,ACK
SYN -j LOG --log-prefix "TCP LOGINPUTDROP:: " --log-tcp-options
--log-ip-options
$IPTABLES -A LOGINPUT -i $INTIF1 -p udp  -j LOG --log-prefix "UDP
LOGINPUTDROP: " --log-tcp-options --log-ip-options
$IPTABLES -A LOGINPUT -i $INTIF1 -f      -j LOG --log-prefix "FRAGMENT
LOGINPUTDROP: " --log-tcp-options --log-ip-options

$IPTABLES -A LOGINPUT -j DROP
$IPTABLES -A INPUT -p icmp -i $INTIF1 -j LOGINPUT
$IPTABLES -A INPUT -p tcp  -i $INTIF1 -j LOGINPUT
$IPTABLES -A INPUT -p udp  -i $INTIF1 -j LOGINPUT

#echo -e "       - Logging Dropped Output Traffic"
$IPTABLES -A LOGOUTPUT -o $INTIF1 -p icmp -j LOG --log-prefix "ICMP
LOGOUTPUTDROP: " --log-tcp-options --log-ip-options
$IPTABLES -A LOGOUTPUT -o $INTIF1 -p tcp --tcp-flags FIN,SYN,RST,ACK
SYN -j LOG --log-prefix "TCP LOGOUTPUTDROP: " --log-tcp-options
--log-ip-options
$IPTABLES -A LOGOUTPUT -o $INTIF1 -p udp  -j LOG --log-prefix "UDP
LOGOUTPUTDROP: " --log-tcp-options --log-ip-options
$IPTABLES -A LOGOUTPUT -o $INTIF1 -f      -j LOG --log-prefix
"FRAGMENT LOGOUTPUTDROP: " --log-tcp-options --log-ip-options

$IPTABLES -A LOGOUTPUT -j DROP
$IPTABLES -A OUTPUT -p icmp -o $INTIF1 -j LOGOUTPUT
$IPTABLES -A OUTPUT -p tcp  -o $INTIF1 -j LOGOUTPUT
$IPTABLES -A OUTPUT -p udp  -o $INTIF1 -j LOGOUTPUT

#echo -e "       - Rejecting input TCP and UDP traffic to closed ports"
$IPTABLES -A INPUT -i $INTIF1 -p tcp -j REJECT --reject-with tcp-rst
$IPTABLES -A INPUT -i $INTIF1 -p udp -j REJECT --reject-with
icmp-port-unreachable

#echo -e "       - Rejecting output TCP and UDP traffic to closed ports"
$IPTABLES -A OUTPUT -o $INTIF1 -p tcp -j REJECT --reject-with tcp-rst
$IPTABLES -A OUTPUT -o $INTIF1 -p udp -j REJECT --reject-with
icmp-port-unreachable

#echo -e "       - Rejecting input traffic to remaining protocols sent
to closed ports"
$IPTABLES -A INPUT -i $INTIF1 -j REJECT --reject-with icmp-proto-unreachable

#echo -e "       - Rejecting output traffic to remaining protocols
sent to closed ports"
$IPTABLES -A OUTPUT -o $INTIF1 -j REJECT --reject-with icmp-proto-unreachable

Moving forward I am looking to add some DDOS measures in place,
starting with logs. I will post my problem in a separate email.

Kind Regards,

Nick.
