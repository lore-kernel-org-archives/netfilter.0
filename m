From: Tasha Smith <tashamaillist@yahoo.com>
Subject: Confused about LAN machines connecting through my FIREWALL to TROJAN servers.
Date: Tue, 24 Jun 2003 14:37:45 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030624213745.9276.qmail@web80510.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi...

Im running iptables 1.2.7a with RedHat7.3(2.4.20). I have my rules posted here:
http://lists.netfilter.org/pipermail/netfilter/2003-June/044918.html

My question is...if my Windows machines behind the firewall/Router get infected with
a Trojan/Virus...and are trying to connect to there servers from my mahcine using
PORT 80 these rules of mine would not try to stop the connection from going through,
Right! Soo i was wondering what i could add to the Script to make it soo that if a
Trojan using port 80 to connect out does happen to get on my mahcine how would i
stop this. 

Cause yesterday i installed Kero Personal Firewall on my windows mahcine and set the
default OUTPUT rule to DROP and noticed WUAUCLT.exe trying to connect to PORT 80 to
some ip address  and i think it would have made it through. Here is one site that
said it was a VIRUS.
http://www.sophos.com/virusinfo/analyses/trojcultb.html

Can anyone explain to me a little better on how to stop these connectiions from
happening butyet still letting Netcape and IE and normal webrowsers through. Thanks
Guys!

Tasha@---<----

P.S.> Overall how secure do you boys think my script is? I know nothing is evn close
to %100 secure but do you notice somehting i could change or add that would help it.
I have this also at the begining.
# Enable broadcast echo protection
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

# Disable source routed packets
for f in /proc/sys/net/ipv4/conf/*/accept_source_route; do
	echo 0 > $f
done

# Enable syn cookie protection.
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

# Disable ICMP Redirect Acceptence
for f in /proc/sys/net/ipv4/conf/*/accept_redirects; do
	echo 0 > $f
done

# Drop spoofed packets comeing in on an interface, ehich if replied 
# to,would result the reply going out another interface.
for f in /proc/sys/net/ipv4/conf/*/rp_filter; do
     echo 1 > $f
done

# Dont't send Redirect Messages
for f in /proc/sys/net/ipv4/conf/*/send_redirects; do
	echo 0 > $f
done

# Log packets with impossiable addreses.
for f in /proc/sys/net/ipv4/conf/*/log_martians; do
    echo 1 > $f
done


__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com

