From: "Shazad Malik" <smalik@vistawiz.com>
Subject: Re: [Fwd: Anyone with vpn and iptable strange error message??]
Date: Fri, 31 May 2002 18:55:22 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <3108.192.168.1.27.1022885722.squirrel@mail.vistawiz.com>
References: <200205312131.g4VLVVA06481@Networker.rockstone.co.uk>
Reply-To: smalik@vistawiz.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200205312131.g4VLVVA06481@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Antony@Soft-Solutions.co.uk
Cc: netfilter@lists.samba.org

Thanks Anthony for your response!

But I think i know what the problem might be............ [I think so! :) ]

This is my ipsec barf output:  This is the IP connection I made yesterday:
May 31 09:32:44 new Pluto[2325]: "hallian" 219.241.233.88 #87: starting
keying attempt 86 of an unlimited number
May 31 09:32:44 new Pluto[2325]: "hallian" 219.241.233.88 #88: initiating
Main Mode to replace #87
May 31 09:32:44 new Pluto[2325]: ERROR: "hallian" 219.241.233.88 #88:
sendto on eth0 to 219.241.233.88:500 failed in main
_outI1. Errno 1: Operation not permitted

From my /proc/net/ip_conntrack this is the output:
# more ip_conntrack
tcp      6 349606 ESTABLISHED src=219.241.233.88 dst=192.168.1.99
sport=2578 dport=22 src=192.168.1.99 dst=209.244.2
33.88 sport=22 dport=2578 [ASSURED] use=1

Do you SEE Something:  The established number is 349606 seconds before it
drops the connection.
hmmmmmmmm..............

If we check this ip_conntrack_proto_tcp.c:
static unsigned long tcp_timeouts[]
= { 30 MINS,    /*      TCP_CONNTRACK_NONE,     */
    5 DAYS,     /*      TCP_CONNTRACK_ESTABLISHED,      */
    2 MINS,     /*      TCP_CONNTRACK_SYN_SENT, */
    60 SECS,    /*      TCP_CONNTRACK_SYN_RECV, */
    2 MINS,     /*      TCP_CONNTRACK_FIN_WAIT, */
    2 MINS,     /*      TCP_CONNTRACK_TIME_WAIT,        */
    10 SECS,    /*      TCP_CONNTRACK_CLOSE,    */
    60 SECS,    /*      TCP_CONNTRACK_CLOSE_WAIT,       */
    30 SECS,    /*      TCP_CONNTRACK_LAST_ACK, */
    2 MINS,     /*      TCP_CONNTRACK_LISTEN,   */
};

Now, do we need TCP_CONNTRACK_ESTABLISHED to be 5 days?  I need to bring it
down!!!!  Any suggestions! Anyone!!  Thats why my ipsec servers was trying
to make attaempt after 18 hrs too! :(

BUT for those who want a guideline for freeswan and iptables: See my config
files below:

For those who are familiar with freeswan 1.9.7 and iptables v1.2.6a, these
are my rules in iptables and the _updown script which is started during
boot time for ipsec.  Any feedback would be welcome...........

--------------------------------
-- part of iptables conf file --
--------------------------------
# VPN Usage with the right credentials.
$IPTABLES -N IPSEC_USAGE
$IPTABLES -F IPSEC_USAGE

$IPTABLES -A IPSEC_USAGE -p udp --sport 500 --dport 500 -j LOG --log-level
$LOG_LEVEL --log-prefix "IPSEC:"
$IPTABLES -A IPSEC_USAGE -p udp --sport 500 --dport 500 -j ACCEPT

$IPTABLES -A IPSEC_USAGE -p 50 -j LOG --log-level $LOG_LEVEL --log-
prefix "IPSEC PORT 50: "
$IPTABLES -A IPSEC_USAGE -p 50 -j ACCEPT

$IPTABLES -A IPSEC_USAGE -p 51 -j LOG --log-level $LOG_LEVEL --log-
prefix "IPSEC PORT 51: "
$IPTABLES -A IPSEC_USAGE -p 51 -j ACCEPT

# INPUT to the external Interface. ACCEPT packets based on the IPSEC
$IPTABLES -A INPUT -i $EXTERNAL -j IPSEC_USAGE

# OUTPUT on the external interface. ACCEPT packets based on the IPSEC
$IPTABLES -A OUTPUT -o $EXTERNAL -j IPSEC_USAGE

-----------------------------------
-- _updown config file for ipsec --
-----------------------------------

up-client:)
# connection to client subnet, with (left/right)firewall=yes, coming up
# This is used only by the default updown script, not by your custom
# ones, so do not mess with it; see CAUTION comment up at top.

iptables -D FORWARD -s $PLUTO_MY_CLIENT_NET/$PLUTO_MY_CLIENT_MASK -d
$PLUTO_PEER_CLIENT_NET/$PLUTO_PEER_CLIENT_MASK -j ACCEPT

iptables -D FORWARD -d $PLUTO_MY_CLIENT_NET/$PLUTO_MY_CLIENT_MASK -s
$PLUTO_PEER_CLIENT_NET/$PLUTO_PEER_CLIENT_MASK -j ACCEPT
        ;;

down-client:)
# connection to client subnet, with (left/right)firewall=yes, going down
# This is used only by the default updown script, not by your custom
# ones, so do not mess with it; see CAUTION comment up at top.

iptables -D FORWARD -s $PLUTO_MY_CLIENT_NET/$PLUTO_MY_CLIENT_MASK -d
$PLUTO_PEER_CLIENT_NET/$PLUTO_PEER_CLIENT_MASK -j ACCEPT

iptables -D FORWARD -d $PLUTO_MY_CLIENT_NET/$PLUTO_MY_CLIENT_MASK -s
$PLUTO_PEER_CLIENT_NET/$PLUTO_PEER_CLIENT_MASK -j ACCEPT
        ;;
> On Friday 31 May 2002 9:10 pm, Shazad Malik wrote:
>
>> Hi all,
>>
>> I have iptables and freeswan VPN working in my lab but a very
>> interesting thing is happening and not sure if someone else has seen
>> this:
>>
>> When I start my ipsec client from my windows2000 to my iptables
>> servers which is running NAT too works perfectly fine.  It's when i
>> logoff my ipsec connection then I get this error message on my
>> iptables logs which start to drop all packets in  both directions!
>> This is the message I get:
>>
>> ip_conntack: table full, dropping packets
>
> Is this perhaps something to do with the routing table changes which
> happen  when FreeS/Wan comes up and down ?
>
> Do your netfilter rules tend to specify interfaces, or do you just use
> IP  addresses ?   I'm thinking perhaps if you use interface names in
> the rules,  they're going to be different depending on whether
> FreeS/Wan is up or down,  so they're not going to route packets in the
> same way ?
>
> I think your connection tracking table is filling up because you're
> building  up a whole set of half-open TCP connections which are not
> getting repled to  because the link is down ?
>
>
> Hope this helps,
>
>
> Antony.


-- 
Shazad Malik
work: (845)623-2161
fax: (845) 623-1154



