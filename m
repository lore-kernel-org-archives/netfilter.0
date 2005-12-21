From: Mogens Valentin <mogensv@vip.cybercity.dk>
Subject: Re: network flood imunity
Date: Wed, 21 Dec 2005 13:27:53 +0100
Message-ID: <43A94A49.60506@vip.cybercity.dk>
References: <43A7F1C3.7010805@gmail.com>
Reply-To: mogensv@vip.cybercity.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43A7F1C3.7010805@gmail.com>
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
To: Sorin Panca <sorin.panca@gmail.com>
Cc: netfilter@lists.netfilter.org

Sorin Panca wrote:
> Hi!
> I have a network with no natting and i would linke to develop a rule set
> for flood protection of some windows stations. Recently one station was
> flooded while it was powered off (for me this is a uncomprehensible
> situation / act)..

Ehh? Flooded while powered off? Says who? Your ISP? If they can see YOUR 
  IP getting spoofed (while powered off), they -may- have a problem with 
overlapping custumer IP's; I've seend that before :)

> My ISP added a filter against my station and I can't
> acces the internet on it now. The server is running kernel 2.4.22-10mdk
> with mandrake-<some.version> and iptables-1.2.8. I tried to replace it
> (the server) but due to unknown reasons, I failed three times. And I
> gave up.
> If someone has an ideea of how can I protect the server in this
> configuration against floods, I would be very happy to learn.

I havne't got time for rule examples, but you may find the following 
/proc settings quite helpful:

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


-- 
Kind regards,
Mogens Valentin


