From: Jason Opperisano <opie@817west.com>
Subject: Re: firewall on dns server
Date: Wed, 19 Jan 2005 09:28:27 -0500
Message-ID: <1106144907.4934.20.camel@hubcap.ljm.dom>
References: <a0f69e50501182152e8fce13@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e50501182152e8fce13@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

On Wed, 2005-01-19 at 00:52, Askar wrote:
> Greetings, I'm pasting my firewall script which is running on our
> company cache only dns server (serving more then 700+ users), this
> server uses one of our company primary dns server as "Forwarder".
> what I want gurus in this list give a look to it and let me know if im
> missing something or doing any mistake.
> OS: slackware kernel 2.6.10, netfilter compiled in kernel.
> ###script 
> # Remove any existing rules from all chains
> # traceroute usually uses -S 32769:65535 -D 33434:33523
> TRACEROUTE_SRC_PORTS="32769:65535"
> TRACEROUTE_DEST_PORTS="33434:33523"
> 
> #Clear \ Flush all the rules from the different chains and tables
> 
> iptables --flush
> iptables --flush INPUT            #Flush the INPUT chain
> iptables --flush OUTPUT           #Flush the OUTPUT chain
> iptables --flush FORWARD          #Flush the FORWARD chain
> iptables -t nat --flush           #Flush the nat table
> iptables -t mangle --flush        #Flush the mangle table
> iptables --delete-chain           #Delete any pre-existing chains
> iptables -t nat --delete-chain    #Delete any pre-existing chains from nat table
> iptables -t mangle --delete-chain #Delete any pre-existing chains from
> the mangle table

you can slim the above down to:

  for table in mangle nat filter; do
    iptables -t $table -F
    iptables -t $table -X
  done

> #Setting the default Policies for the chains
> iptables --policy INPUT DROP      #Setting the default policy for INPUT chain
> iptables --policy FORWARD DROP    #Setting the default plicy for FORWARD chain
> iptables --policy OUTPUT DROP     #Setting the default policy for the
> OUTPUT chain
> 
> # Unlimited traffic on the loopback interface
> # Do immediately in case of firewall script errors!
> iptables -A INPUT  -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
> 
> # furtive port scan
> iptables -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit
> --limit 1/s -j ACCEPT

why rate-limit and accept packets with just the RST flag set?  valid RST
packets should have the ACK bit set as well.  it also seems strange that
you would choose to single out a RST scan, and not bother with something
like a SYN-FIN scan...i dunno, i'm sure you have your reasons.

> ###############################################################
> # Using Connection State to By-pass Rule Checking
> 
> iptables -A INPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> ###############################################################
> # Source Address Spoofing and Other Bad Addresses
> # Refuse packets claiming to be from the loopback interface (martian)
> iptables -A INPUT    -s 127.0.0.1 -j DROP
> iptables -A FORWARD  -s 127.0.0.1 -j DROP

as your parentheses indicate--the linux kernel routing code will drop
these packets as martians before the packets ever gets to the netfilter
hooks--so these rules are basically unnecessary.

> ###############################################################
> iptables -A INPUT -m state --state INVALID -j LOG --log-prefix "INVALID input: "
> iptables -A INPUT -m state --state INVALID -j DROP
> iptables -A OUTPUT -m state --state INVALID -j LOG --log-prefix
> "INVALID output: "
> iptables -A OUTPUT -m state --state INVALID -j DROP
> 
> ##################################################################################
> ## allow ssh from trusted IPs
> iptables -A INPUT -i eth0 -s xxx.xxx.xxx.x -p tcp -m tcp --dport 22 -j ACCEPT
> iptables -A INPUT -i eth0 -s xxx.xxx.xxx.x -p tcp -m tcp --dport 22 -j ACCEPT
> iptables -A INPUT -i eth0 -s xxx.xxx.xxx.x -p tcp -m tcp --dport 22 -j ACCEPT
> iptables -A INPUT -i eth0 -s xxx.xxx.xxx.x -p tcp -m tcp --dport 22 -j ACCEPT
> iptables -A INPUT -i eth0 -s xxx.xxx.xxx.x -p tcp -m tcp --dport 22 -j ACCEPT
> #################################################################
> iptables -A INPUT -p udp --dport 53 -j ACCEPT
> iptables -A INPUT -p tcp --dport 53 -j ACCEPT
> ################################################################
> iptables -A OUTPUT -s 0/0 -d 0/0 -p tcp --dport 53 -j ACCEPT
> iptables -A OUTPUT -s 0/0 -d 0/0 -p udp --dport 53 -j ACCEPT

stylistic note:  why did you use the "-s 0/0 -d 0/0" in the OUTPUT rules
but not the INPUT rules.  personally--i think the INPUT rules are much
easier to read, as the "-s 0/0 -d 0/0" is unnecessary.

> ########### Allow Traceroute
> iptables -A OUTPUT -o eth0 -p udp --sport $TRACEROUTE_SRC_PORTS
> --dport $TRACEROUTE_DEST_PORTS -m state --stat
> e NEW -j ACCEPT
> ########### Allow WHOIS
> iptables -A OUTPUT -o eth0 -p tcp --dport 43 -m state --state NEW -j ACCEPT
> 
> ### End script

seems odd to me that you would allow traceroute and whois outbound, but
not pings.  for that matter--in addition to allowing pings outbound--i
would also allow pings inbound from the company networks--for
troubleshooting purposes.

i'm not familiar with how slackware deals with updates and patches, but
on my machines--i normally need rules to allow HTTP or FTP outbound to
my local update mirror.

also--i always run some type of ntpd on my servers to keep their time in
sync--which would require an outbound rule for UDP port 123 to the time
server.

-j

--
"Boy, if you want anything in this life, you have to work for it. Now
 be quiet while I listen for these lottery numbers."
	--The Simpsons


