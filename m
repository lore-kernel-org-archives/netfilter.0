From: Mogens Valentin <monz@danbbs.dk>
Subject: Re: ICMP types
Date: Sat, 30 Apr 2005 14:23:24 +0200
Message-ID: <427378BC.6070804@danbbs.dk>
References: <000101c54cf4$955d5460$6363a8c0@compaq>
Reply-To: monz@danbbs.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000101c54cf4$955d5460$6363a8c0@compaq>
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
To: 'Netfilter list' <netfilter@lists.netfilter.org>

Ken Hilliard wrote:
 > In reading different firewall scripts/tutorials many of them recommend
 > filtering ICMP packets. I added ICMP filter in my firewall but was
 > unsure of the value as well. What is the consensus view out there?

Not wanting to comment what the consensus are, but some types are 
generally considered nessesary to filter/allow.

But its really not just a matter of filtering this-or-that, also what's 
set in /proc . There's a lot to read...
A few ideas:

Filtering ICMP:

### Define icmp_packets chain:
     $IPT -F icmp_packets
     $IPT -X icmp_packets
     $IPT -N icmp_packets
     $IPT -A icmp_packets -p icmp --icmp-type echo-request -j ACCEPT
     $IPT -A icmp_packets -p icmp --icmp-type echo-reply -j ACCEPT
     $IPT -A icmp_packets -p icmp --icmp-type destination-unreachable -j 
ACCEPTlog
     $IPT -A icmp_packets -p icmp --icmp-type network-unreachable -j 
ACCEPTlog
     $IPT -A icmp_packets -p icmp --icmp-type network-prohibited -j 
ACCEPTlog
     $IPT -A icmp_packets -p icmp --icmp-type source-quench -j ACCEPTlog
     $IPT -A icmp_packets -p icmp --icmp-type parameter-problem -j ACCEPTlog
     $IPT -A icmp_packets -p icmp --icmp-type time-exceeded -j ACCEPTlog
     $IPT -A icmp_packets -p icmp --icmp-type fragmentation-needed -j 
ACCEPTlog
     #$IPT -A icmp_packets -p icmp -j ACCEPTlog
     $IPT -A icmp_packets -p icmp -j LOG



A few /proc settings:

### /proc settings:
     setup_procfs() {

       # Disable forwarding while setting up rules (needed for 
masquerading):
       # Note: this is now done in forwarding.def
           #echo "0" >/proc/sys/net/ipv4/ip_forward

       # Initially, disable ICMP echo-requests altogether (normally only 
used if DoSed):
       # Note: this is now done in forwarding.def
           #echo "1" >/proc/sys/net/ipv4/icmp_echo_ignore_all

       # Disable ICMP echo-request to broadcast addresses (Smurf amplifier):
           echo "1" >/proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

       # Enable syn-cookies (prevent syn-flood attacks):
           echo "1" >/proc/sys/net/ipv4/tcp_syncookies

       # Reduce number of possible SYN Floods:
           echo "1024" >/proc/sys/net/ipv4/tcp_max_syn_backlog

       # Enable defrag error protection:
           echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

       # Enable time-wait assassination hazards in tcp (RFC 1337):
           echo "1" >/proc/sys/net/ipv4/tcp_rfc1337

       # Prevent remote digging of OS-type and uptime (RFC1323):
           #echo "1" >/proc/sys/net/ipv4/tcp_timestamps    # enable 
timestamps
           echo "0" >/proc/sys/net/ipv4/tcp_timestamps    # disable 
timestamps

       # Disable RFC2018 TCP Selective Acknowledgements:
           echo 0 > /proc/sys/net/ipv4/tcp_sack


       # Sourcerouting and spoofing:
           for i in /proc/sys/net/ipv4/conf/*; do
               # Drop all source-routed packets:
               echo "0" >$i/accept_source_route

               # Deactivate normal ICMP redirect accept/send:
               echo "0" >$i/accept_redirects
               echo "0" >$i/send_redirects

               # Activate secure ICMP redirects (send only?) (on by 
default):
               echo "1" >$i/secure_redirects

               # Enable ingress + egress source-address verification 
(prevent spoofing):
               #echo "0" >$i/rp_filter   # disable
               echo "1" >$i/rp_filter   # enable
           done

       # Log spoofed, source routed and redirect packets:
           #echo 1 >/proc/sys/net/ipv4/conf/all/log_martians
           echo 0 >/proc/sys/net/ipv4/conf/all/log_martians

     }

-- 
Kind regards,
Mogens Valentin


Q: How does a hacker fix a function which doesn't
    work for all of the elements in its domain?
A: He changes the domain.
   -- unknown


