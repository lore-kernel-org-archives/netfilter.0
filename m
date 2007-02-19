From: Gregory Carter <gcarter@aesgi.com>
Subject: Re: throttling an internal IP's upstream bandwidth
Date: Mon, 19 Feb 2007 09:52:46 -0600
Message-ID: <45D9C7CE.6060301@aesgi.com>
References: <Pine.LNX.4.64.0702091134220.18820@novak.ethosuk.org.uk>
	<45D83C7C.6000501@rtij.nl>
	<Pine.LNX.4.64.0702181232550.32641@novak.ethosuk.org.uk>
	<45D858AD.5060501@rtij.nl> <45D90B6E.3020801@aesgi.com>
	<Pine.LNX.4.64.0702191106070.32641@novak.ethosuk.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0702191106070.32641@novak.ethosuk.org.uk>
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

Ok, here it is:

This is the QoS policy I have on my BGP routers.

It is a fairly basic policy that allows me to dynamically adjust 
bandwidth based on need and priority.

You will note that this QoS policy is divided up into three policies or 
channels.

Channel #1 is the highest priority and this is where all of my ssh 
session traffic and windows terminal server traffic goes.

Essentially this is RDP and NX traffic as all of the my desktops in the 
office, and also on our forklifts are a combination of KDE and Windows 
using NX clients.

NX works over port 22 and so on.

Notice that the recipe has three channels and these channels have to add 
up to and not exceed the UPRATE.

(i.e. PRIORATE1+PRIORATE2+PRIORATE3=UPRATE)

Right now for example my upstream capacity on my cable line is 1Mbit.   
So, in order for queueing to happen so I can properly prioritize the 
traffic, I have to reduce the upstream rate to a point where it is 
backing up on the BGP router, not the cable modem.   I found 768K to be 
very reliable in all cases.

You have to get that right otherwise QoS may be erratic or simply not work.

I think the script is pretty self documenting but if you want me to 
spell out the details about how it works, and what is what with the 
iptables portion of the script I would be happy to answer any questions.

-gc

#! /bin/sh
##
# Author: Gregory Carter <gcarter@aesgi.com>
#
# /etc/init.d/qos
#

### BEGIN INIT INFO
# Provides:       qos
# Required-Start: $network
# Required-Stop:
# Default-Start:  2 3 5
# Default-Stop:
# Description:    quality of service policy gurantees for network services
### END INIT INFO


# Shell functions sourced from /etc/rc.status:
#      rc_check         check and set local and overall rc status
#      rc_status        check and set local and overall rc status
#      rc_status -v     ditto but be verbose in local rc status
#      rc_status -v -r  ditto and clear the local rc status
#      rc_failed        set local and overall rc status to failed
#      rc_failed <num>  set local and overall rc status to <num><num>
#      rc_reset         clear local rc status (overall remains)
#      rc_exit          exit appropriate to overall rc status
. /etc/rc.status

# First reset status of this service
rc_reset

# Return values acc. to LSB for all commands but status:
# 0 - success
# 1 - generic or unspecified error
# 2 - invalid or excess argument(s)
# 3 - unimplemented feature (e.ga "reload")
# 4 - insufficient privilege
# 5 - program is not installed
# 6 - program is not configured
# 7 - program is not running
#
# Note that starting an already running service, stopping
# or restarting a not-running service as well as the restart
# with force-reload (in case signalling is not supported) are
# considered a success.

# Real Physical Interface
IFACE=eth2

# Priority Channels

MARKPRIO1="1"
MARKPRIO2="2"
MARKPRIO3="3"


# Master Rate
UPRATE="768"

# Channel Rates
PRIORATE1="340"
PRIORATE2="128"
PRIORATE3="300"

case "$1" in
    start)
        echo -n "Starting Quality of Service Policy"
        ## Start daemon with startproc(8). If this fails
        ## the echo return value is set appropriate.

        echo "TOS Settings"
     # Set priorities by marking packets.

     #
     # TOS Matching
     #
     # Make sure the TOS headers in each TCP transaction are prioritized 
first
     #
          iptables -t mangle -A PREROUTING -m tos --tos 
Minimize-Delay      -j MARK --set-mark $MARKPRIO1
          iptables -t mangle -A PREROUTING -m tos --tos 
Minimize-Delay      -j RETURN
          iptables -t mangle -A PREROUTING -m tos --tos 
Minimize-Cost       -j MARK --set-mark $MARKPRIO2
          iptables -t mangle -A PREROUTING -m tos --tos 
Minimize-Cost       -j RETURN
          iptables -t mangle -A PREROUTING -m tos --tos 
Maximize-Throughput -j MARK --set-mark $MARKPRIO3
          iptables -t mangle -A PREROUTING -m tos --tos 
Maximize-Throughput -j RETURN

          iptables -t mangle -A OUTPUT -m tos --tos Minimize-Delay      
-j MARK --set-mark $MARKPRIO1
          iptables -t mangle -A OUTPUT -m tos --tos Minimize-Delay      
-j RETURN
          iptables -t mangle -A OUTPUT -m tos --tos Minimize-Cost       
-j MARK --set-mark $MARKPRIO2
          iptables -t mangle -A OUTPUT -m tos --tos Minimize-Cost       
-j RETURN
          iptables -t mangle -A OUTPUT -m tos --tos Maximize-Throughput 
-j MARK --set-mark $MARKPRIO3
          iptables -t mangle -A OUTPUT -m tos --tos Maximize-Throughput 
-j RETURN

     # Maximum Priority Services

     echo "SSH Priority 1"
     # ssh
          iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 22 -j 
MARK --set-mark $MARKPRIO1
          iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 22 -j 
RETURN
          iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 22 -j 
MARK --set-mark $MARKPRIO1
          iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 22 -j 
RETURN

          iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 22 -j MARK 
--set-mark $MARKPRIO1
          iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 22 -j RETURN
          iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 22 -j MARK 
--set-mark $MARKPRIO1
          iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 22 -j RETURN

     echo "Terminal Services Priority 1"
     # Terminal Services
          iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 3389 -j 
MARK --set-mark $MARKPRIO1
          iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 3389 -j 
RETURN
          iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 3389 -j 
MARK --set-mark $MARKPRIO1
          iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 3389 -j 
RETURN

          iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 3389 -j 
MARK --set-mark $MARKPRIO1
          iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 3389 -j RETURN
          iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 3389 -j 
MARK --set-mark $MARKPRIO1
          iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 3389 -j RETURN


     # Services trying to establish an initial connection between 
locations must be
     # at highest priority as they are already slow over the back haul.

     echo "TCP Connection States Priority 1"

          iptables -t mangle -I PREROUTING -p tcp -m tcp --tcp-flags 
SYN,RST,ACK SYN -j MARK --set-mark $MARKPRIO1
          iptables -t mangle -I PREROUTING -p tcp -m tcp --tcp-flags 
SYN,RST,ACK SYN -j RETURN

          iptables -t mangle -I OUTPUT -p tcp -m tcp --tcp-flags 
SYN,RST,ACK SYN -j MARK --set-mark $MARKPRIO1
          iptables -t mangle -I OUTPUT -p tcp -m tcp --tcp-flags 
SYN,RST,ACK SYN -j RETURN


     # Prio 2
     #
     # 2nd Class Priority Services
     #

     echo "Freightlink Clients Priority 2"
     # Freightlink Client
          iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 52272 
-j MARK --set-mark $MARKPRIO2
          iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 52272 
-j RETURN
          iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 52272 
-j MARK --set-mark $MARKPRIO2
          iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 52272 
-j RETURN

          iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 52272 -j 
MARK --set-mark $MARKPRIO2
          iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 52272 -j RETURN
          iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 52272 -j 
MARK --set-mark $MARKPRIO2
          iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 52272 -j RETURN

     echo "DNS Priority 2"
     # DNS
       iptables -t mangle -A PREROUTING -p udp -m udp --sport 53 -j MARK 
--set-mark $MARKPRIO2
       iptables -t mangle -A PREROUTING -p udp -m udp --sport 53 -j RETURN
       iptables -t mangle -A PREROUTING -p udp -m udp --dport 53 -j MARK 
--set-mark $MARKPRIO2
       iptables -t mangle -A PREROUTING -p udp -m udp --dport 53 -j RETURN

       iptables -t mangle -A OUTPUT -p udp -m udp --sport 53 -j MARK 
--set-mark $MARKPRIO2
       iptables -t mangle -A OUTPUT -p udp -m udp --sport 53 -j RETURN
       iptables -t mangle -A OUTPUT -p udp -m udp --dport 53 -j MARK 
--set-mark $MARKPRIO2
       iptables -t mangle -A OUTPUT -p udp -m udp --dport 53 -j RETURN



     echo "SMTP Priority 2"
     # SMTP
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 25 -j MARK 
--set-mark $MARKPRIO2
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 25 -j RETURN
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 25 -j MARK 
--set-mark $MARKPRIO2
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 25 -j RETURN

       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 25 -j MARK 
--set-mark $MARKPRIO2
       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 25 -j RETURN
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 25 -j MARK 
--set-mark $MARKPRIO2
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 25 -j RETURN

     echo "POP3 Priority 2"
     # POP3
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 110 -j 
MARK --set-mark $MARKPRIO2
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 110 -j RETURN
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 110 -j 
MARK --set-mark $MARKPRIO2
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 110 -j RETURN

       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 110 -j MARK 
--set-mark $MARKPRIO2
       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 110 -j RETURN
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 110 -j MARK 
--set-mark $MARKPRIO2
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 110 -j RETURN


     echo "LDAP Priority 2"
     # LDAP
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 389 -j 
MARK --set-mark $MARKPRIO2
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 389 -j RETURN
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 389 -j 
MARK --set-mark $MARKPRIO2
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 389 -j RETURN

       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 389 -j MARK 
--set-mark $MARKPRIO2
       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 389 -j RETURN
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 389 -j MARK 
--set-mark $MARKPRIO2
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 389 -j RETURN


     # LDAPS
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 636 -j 
MARK --set-mark $MARKPRIO2
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 636 -j RETURN
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 636 -j 
MARK --set-mark $MARKPRIO2
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 636 -j RETURN

       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 636 -j MARK 
--set-mark $MARKPRIO2
       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 636 -j RETURN
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 636 -j MARK 
--set-mark $MARKPRIO2
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 636 -j RETURN

     # Prio 3
     #
     # 3th Class Priority Services
     #
     echo "SMB over TCP Priority 3 (Bulk Default Channel)"
     # Microsoft SMB over TCP File Server Traffic
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 445 -j 
MARK --set-mark $MARKPRIO3
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 445 -j RETURN
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 445 -j 
MARK --set-mark $MARKPRIO3
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 445 -j RETURN

       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 445 -j MARK 
--set-mark $MARKPRIO3
       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 445 -j RETURN
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 445 -j MARK 
--set-mark $MARKPRIO3
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 445 -j RETURN

     echo "SMB over NETBIOS Priority 3 (Bulk Default Channel)"
     # Microsoft SMB over NETBIOS Name Service
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 137 -j 
MARK --set-mark $MARKPRIO3
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 137 -j RETURN
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 137 -j 
MARK --set-mark $MARKPRIO3
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 137 -j RETURN

       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 137 -j MARK 
--set-mark $MARKPRIO3
       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 137 -j RETURN
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 137 -j MARK 
--set-mark $MARKPRIO3
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 137 -j RETURN


     echo "SMB over NETBIOS Datagram Service Priority 3 (Bulk Default 
Channel)"
     # Microsoft SMB over NETBIOS Datagram Service
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 138 -j 
MARK --set-mark $MARKPRIO3
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 138 -j RETURN
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 138 -j 
MARK --set-mark $MARKPRIO3
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 138 -j RETURN

       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 138 -j MARK 
--set-mark $MARKPRIO3
       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 138 -j RETURN
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 138 -j MARK 
--set-mark $MARKPRIO3
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 138 -j RETURN

     echo "SMB over NETBIOS Session Service Priority 3 (Bulk Default 
Channel)"
     # Microsoft SMB over NETBIOS Session Service
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 139 -j 
MARK --set-mark $MARKPRIO3
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 139 -j RETURN
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 139 -j 
MARK --set-mark $MARKPRIO3
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 139 -j RETURN

       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 139 -j MARK 
--set-mark $MARKPRIO3
       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 139 -j RETURN
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 139 -j MARK 
--set-mark $MARKPRIO3
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 139 -j RETURN

     echo "AXIS Web Services Gateway Priority 3 (Bulk Default Channel)"
     # AXIS Web Services Gateway Traffic
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 8080 -j 
MARK --set-mark $MARKPRIO3
       iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 8080 -j RETURN
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 8080 -j 
MARK --set-mark $MARKPRIO3
       iptables -t mangle -A PREROUTING -p tcp -m tcp --dport 8080 -j RETURN

       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 8080 -j MARK 
--set-mark $MARKPRIO3
       iptables -t mangle -A OUTPUT -p tcp -m tcp --sport 8080 -j RETURN
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 8080 -j MARK 
--set-mark $MARKPRIO3
       iptables -t mangle -A OUTPUT -p tcp -m tcp --dport 8080 -j RETURN

     echo "Set Interface Target Q"
     # Set queue length for IFACE
          ifconfig $IFACE txqueuelen 16

     echo "Setting Queue Type...."
     # Specify queue discipline
          tc qdisc add dev $IFACE root handle 1:0 htb default 103 r2q 1

     echo "Setting Root Class"
     # Set root class
          tc class add dev $IFACE parent 1:0 classid 1:1 htb rate 
${UPRATE}kbit ceil ${UPRATE}kbit

     # Specify sub classes
          tc class add dev $IFACE parent 1:1 classid 1:101 htb rate 
${PRIORATE1}kbit ceil ${UPRATE}kbit prio 0
          tc class add dev $IFACE parent 1:1 classid 1:102 htb rate 
${PRIORATE2}kbit ceil ${UPRATE}kbit prio 1
          tc class add dev $IFACE parent 1:1 classid 1:103 htb rate 
${PRIORATE3}kbit ceil ${UPRATE}kbit prio 2

     # Filter packets
          tc filter add dev $IFACE parent 1:0 protocol ip prio 1 handle 
$MARKPRIO1 fw classid 1:101
          tc filter add dev $IFACE parent 1:0 protocol ip prio 1 handle 
$MARKPRIO2 fw classid 1:102
          tc filter add dev $IFACE parent 1:0 protocol ip prio 1 handle 
$MARKPRIO3 fw classid 1:103

     # Add queuing disciplines
          tc qdisc add dev $IFACE parent 1:101 sfq perturb 16
          tc qdisc add dev $IFACE parent 1:102 sfq perturb 16
          tc qdisc add dev $IFACE parent 1:103 sfq perturb 16

        # Remember status and be verbose
        rc_status -v
        ;;
    stop)
        echo -n "Removing QoS Policies.....done"
        ## Stop daemon with killproc(8) and if this fails
        ## set echo the echo return value.

        tc qdisc del dev $IFACE root handle 1:0 htb default 103 r2q 1

        rc_status -v
        ;;
    status)
        echo -n "Currrent QoS queue stats: "
        ## Check status with checkproc(8), if process is running
        ## checkproc will return with exit status 0.

        # Status has a slightly different for the status command:
        # 0 - service running
        # 1 - service dead, but /var/run/  pid  file exists
        # 2 - service dead, but /var/lock/ lock file exists
        # 3 - service not running

        # NOTE: checkproc returns LSB compliant status values.

        tc -s -d class show dev $IFACE

        rc_status -v
        ;;
    *)
        echo "Usage: $0 
{start|stop|status|try-restart|restart|force-reload|reload}"
        exit 1
        ;;
esac
rc_exit


Scott van Looy wrote:
> ooh, please!
>
> On Feb 18 Gregory Carter did spake thusly:
>
>> I can post a simple tc / iptables recipe if need be to address this 
>> problem.
>>
>> -gc
>>
>> Martijn Lievaart wrote:
>>
>>> Scott van Looy wrote:
>>>
>>>> Today Martijn Lievaart did spake thusly:
>>>>
>>>>> Scott van Looy wrote:
>>>>>
>>>>>>
>>>>>> I'm on DSL, I only have small upstream and big downstream. 
>>>>>> Everything goes through a 1:1 NAT iptables firewall - so internal 
>>>>>> IPs are directly mapped to an external IP. I want to throttle the 
>>>>>> internal upstream bandwidth so the internal machines can't upload 
>>>>>> at more than 25k/s as the maxing out of the upstream is killing 
>>>>>> the much faster downstream...is there a way to do this using 
>>>>>> iptables?
>>>>>>
>>>>>
>>>>> Google for wondershaper.
>>>>
>>>>
>>>> I use wondershaper, it doesn't let me throttle on a per machine 
>>>> basis tho - I want the firewall to only allow a max of 25k out for 
>>>> each of my internal machines
>>>>
>>>
>>> Ah, then you have to do some work yourself. The answer is most 
>>> probably tc, not netfilter. If you don't have a lot of internal 
>>> machines, you can add a filter/qdisc for all of them but for large 
>>> amounts of internal machines (or with dhcp), this gets unwieldy.
>>>
>>> However, wondershaper should do what you ultimately want, shape 
>>> traffic so uploads don't disturb downloads. It works for me.
>>>
>>> M4
>>>
>>
>>
>


