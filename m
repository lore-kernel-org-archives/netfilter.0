From: Askar Ali Khan <askarali@gmail.com>
Subject: service attacks (DoS)
Date: Thu, 19 Aug 2004 17:47:49 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e5040819054736ace4f6@mail.gmail.com>
Reply-To: Askar Ali Khan <askarali@gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

hi,

im try to protect my server from various type of DoS for example
Syn-flood protection,  Furtive port scanner, Ping of death. Its our
server B protected by firewall machine A.

client traffic follow A-------------->B
                          (fw)              (server)

what I did first to log packets on Server B to check with (thanks to Anthony)

# To log avoid various denial of service attacks (DoS) with a faster
rate to increase responsiveness
iptables -N LogPackets

# Call the chain right at the top of the INPUT table so we see all the packets
iptables -I INPUT -j LogPackets

# Create a unique log entry for each type of packet we want to know about
##Syn-flood protection
iptables -A LogPackets -p tcp --syn -m limit --limit 1/s  -j LOG
--log-prefix "Syn-flood "

## Furtive port scanner
iptables -A LogPackets -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit
--limit 1/s -j LOG --log-prefix "Furtive port scanner "

## Ping of death
iptables -A LogPackets -p icmp --icmp-type echo-request -m limit
--limit 1/s -j LOG --log-prefix "Ping of death "

when i do "iptables -L LogPackets -nvx" im getting lot of  new packets/s

 iptables -L LogPackets -nvx
Chain LogPackets (1 references)
    pkts      bytes target     prot opt in     out     source         
     destination
      25     1248 LOG        tcp  --  *      *       0.0.0.0/0        
   0.0.0.0/0           tcp flags:0x16/0x02 limit: avg 1/sec burst 5
LOG flags 0 level 4 prefix `Syn-flood '
      24      960 LOG        tcp  --  *      *       0.0.0.0/0        
   0.0.0.0/0           tcp flags:0x17/0x04 limit: avg 1/sec burst 5
LOG flags 0 level 4 prefix `Furtive port scanner '
       3      192 LOG        icmp --  *      *       0.0.0.0/0        
   0.0.0.0/0           icmp type 8 limit: avg 1/sec burst 5 LOG flags
0 level 4 prefix `Ping of death '

My question: 
1)                 what exactly im not getting is  "-m limit --limit
1/s", what values to set for my enviroment, with 100 users connected
at any time?

2) ACCEPTed or DROPed ?

regards
Askar

