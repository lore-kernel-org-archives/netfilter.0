From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: how do i forward ftp from my firewall to an internal server?
Date: Sun, 29 Feb 2004 15:15:45 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402292315.i1TNFffG003448@server5.bandwidthco.com>
References: <4042635E.1060702@karlskrona.net>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4042635E.1060702@karlskrona.net>
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
To: 'Gustav Petersson' <gustav.petersson@karlskrona.net>
Cc: netfilter@lists.netfilter.org

OK - seems like you left out your DNAT rule for port 20 this time.  You
could simplify that some by using just one rule.  Here is how I DNAT my FTP
servers:

$IPT -t nat -A PREROUTING -p tcp --destination-port 20:21 -i $FW_INET_IFACE
-j LOG --log-level $LOG_LEVEL --log-prefix "DNAT IN SERVICE FTP: "

$IPT -t nat -A PREROUTING -p tcp --destination-port 20:21 -i $FW_INET_IFACE
-j DNAT --to-destination $SERVICE_FTP

I assume you have enabled logging (as I have done with this rule) so you can
check you logs to see what the packets are doing?

OK - now what else.  The fact that your outbound is working is significant,
and makes me think we should at applications after all. Few more questions:

Is this an "anonymous" FTP server setup, or is it account authorized?  Could
there be a permissions problem within your "ftpusers" file? Is your ftp
daemon initialized by inetd, and if so could tcpwrappers be killing the
connections? Have you made sure that your PAM configuration is not killing
the connections?

These are mostly food-for-thought questions. I should also point out (and
I'm sure you know this already) but once you have this debugged, you will
want to set your default policies on INPUT and FORWARD to DROP, and then
create the needed permit rules from there.

-----Original Message-----
From: Gustav Petersson [mailto:gustav.petersson@karlskrona.net] 
Sent: Sunday, February 29, 2004 2:11 PM
To: markee@bandwidthco.com
Cc: netfilter@lists.netfilter.org
Subject: Re: how do i forward ftp from my firewall to an internal server?

I cleaned up my script a bit as you suggested but with the same result. 
I should mention that outbound ftp works just fine.

Here is the revised script:
#!/bin/sh
 


EXTIF=eth0
INTIF=eth1
EXTIP=213.88.181.68
INTIP=192.168.150.3
LOCALNET=192.168.150.0
FTPSVR=192.168.150.10
HTTPSVR=192.168.150.10

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Load modules
modprobe ip_conntrack_ftp
modprobe ip_nat_ftp

# Set default policies and flush tables
iptables -t nat -F
iptables -P INPUT ACCEPT
iptables -F INPUT
iptables -P OUTPUT ACCEPT
iptables -F OUTPUT
iptables -P FORWARD ACCEPT
iptables -F FORWARD

# Masquerade on $EXTIF
iptables -t nat -A POSTROUTING -o $EXTIF -s $LOCALNET/24 -d ! 
$LOCALNET/24 \         # here I have tried both with and without the -d 
! $LOCALNET/24
        -j SNAT --to $EXTIP

# Forward ftp traffic to internal server iptables -t nat -A PREROUTING -d
$EXTIP -p TCP --dport 21 \
        -j DNAT --to $FTPSVR:21

# Forward http traffic to internal server iptables -t nat -A PREROUTING -d
$EXTIP -p TCP --dport 80 \
        -j DNAT --to $HTTPSVR:80

Mark E. Donaldson wrote:

>Yes - I see what you are saying now.  And indeed, if your FORWARD 
>policy is set to ACCEPT, your packets should be properly DNATTED with 
>the rules you list. And you are correct, the FTPD application in use 
>would not be a factor at all here. You also seem to have all the needed 
>modules you need loaded as well.  So, how do we fix this?
>
>First a question on your SNAT rule: iptables -t nat -A POSTROUTING -o 
>eth0 -j SNAT --to 213.88.181.68
>
>Is 213.88.181.68 the external IP?  If so, is it the same as the 
>variable $EXP_IP is set to, and if so why not use $EXP_IP instead?  I 
>would also add a -s address or network to the rule to assure only the 
>packets you want SNATTED are SNATTED.  I doubt if this is causing your 
>problem, but these things need to get cleaned up to help troubleshoot the
problem.
>
>Next - run an lsmod after your ruleset is loaded to confirm all the 
>needed modules have loaded.
>
>Also - I notice you are flushing your NAT table after you have set your 
>default policies: iptables -t nat -F.  I would move this up and flush 
>before the policies are set.
>
>Try all this and we shall go from there.
>
>-----Original Message-----
>From: Gustav Petersson [mailto:gustav.petersson@karlskrona.net]
>Sent: Sunday, February 29, 2004 11:15 AM
>To: markee@bandwidthco.com
>Cc: netfilter@lists.netfilter.org
>Subject: Re: how do i forward ftp from my firewall to an internal server?
>
>Thanks for your reply Mark.
>I should have explained better. I know that ftp uses two ports with a 
>different setup for active and passive mode. That is not the problem.
>Right now I am only DNATing the control port and my INPUT,OUTPUT and 
>FORWARD chains have a default policy of ACCEPT. The rules I posted are 
>the _only_ rules I have for my firewall. The problem is that when I 
>telnet to my $EXTIP port 21 I should get a welcome message and be able 
>to send some commands but from logging all traffic to and from my 
>internal ftp server I can see the following traffic:
>Client->FTP: SYN
>FTP->Client: SYN ACK
>Client->FTP: ACK
>FTP->Client: ACK PSH
>FTP->Client: ACK PSH
>FTP->Client: ACK PSH
>FTP->Client: ACK PSH
>Client->FTP: RST
>
>after this short exchange the connection is terminated. If i telnet to 
>$EXTIP port 80 and do a 'GET /' everything works fine. I have tried 
>proftpd, in.ftpd, wu-ftpd and they all give the same result so it's not 
>a problem with the ftp server software.
>
>Gustav Petersson
>
>Mark E. Donaldson wrote:
>
>  
>
>>The FTP protocol works completely differently than http, particularly 
>>in the way connections are negotiated and accepted.  You must also 
>>account for both active and passive modes. I'm assuming the rules you 
>>have here are for new connections to your FTP server?  What are your 
>>FTP rules for the FORWARD chain?
>>
>>-----Original Message-----
>>From: netfilter-admin@lists.netfilter.org
>>[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Gustav 
>>Petersson
>>Sent: Saturday, February 28, 2004 12:28 AM
>>To: netfilter@lists.netfilter.org
>>Subject: how do i forward ftp from my firewall to an internal server?
>>
>>Like the subject line says.. how do I do it?
>>
>>I have port http traffic forwarded to the same server but when i use 
>>the same rule with only the port(s) changed for ftp traffic my ftp 
>>server opens the connection but immediately closes it again. I have 
>>tried running both the standard in.ftpd and proftpd. Any help would be
>>    
>>
>greatly appreciated.
>  
>
>>Gustav Petersson
>>
>>I am running debian 3.0 with kernel 2.4.24 and I have the following 
>>modules
>>loaded:
>>
>>ipt_LOG
>>ipt_state
>>iptable_filter
>>ip_nat_ftp
>>ip_conntrack_ftp
>>iptable_nat
>>ip_conntrack
>>ip_tables
>>
>>Here is my firewall config:
>>#!/bin/sh
>>
>>EXT_IP=1.2.3.4
>>INT_IP=192.168.x.x
>>
>>modprobe iptable_nat
>>modprobe ip_conntrack_ftp
>>modprobe ip_nat_ftp
>>
>>echo "1" > /proc/sys/net/ipv4/ip_forward
>>
>>iptables -P INPUT ACCEPT
>>iptables -F INPUT
>>iptables -P OUTPUT ACCEPT
>>iptables -F OUTPUT
>>iptables -P FORWARD ACCEPT
>>iptables -F FORWARD
>>iptables -t nat -F
>>
>># NAT
>>iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 213.88.181.68
>>
>>
>>
>>
>># Forward port 80 to internal server
>>iptables -A PREROUTING -t nat -p tcp -d $EXT_IP --dport 80 \
>>       -j DNAT --to $INT_IP:80
>>
>># Forward ports 20 and 21 to internal server iptables -A PREROUTING -t 
>>nat -p tcp -d $EXT_IP --dport 20 \
>>       -j DNAT --to $INT_IP:20
>>
>>
>>
>>iptables -A PREROUTING -t nat -p tcp -d $EXT_IP --dport 21 \
>>       -j DNAT --to $INT_IP:21
>>
>>
>>
>>
>> 
>>
>>    
>>
>
>
>  
>




