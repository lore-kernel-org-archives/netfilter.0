From: Tommy McNeely <Tommy.McNeely@Sun.COM>
Subject: wireless filter question
Date: Sun, 05 Jan 2003 15:37:42 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1041806262.6022.77.camel@cookies.local.redneck.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
To: netfilter@lists.netfilter.org

Thanks for your quick answer on the ftp port issue (I learned a new
command "modinfo" that will make it so I can answer module questions on
my own from now on)


I have my wireless network being "firewalled" by my Linux box...
(something like)

:INPUT DROP [0:0]
(definitions removed)

[0:0] -A INPUT -i lo -j ACCEPT
[0:0] -A INPUT -i eth0 -j ACCEPT
[0:0] -A INPUT -i eth1 -j PublicFilter
[0:0] -A INPUT -i eth2 -j WirelessFilter
[0:0] -A INPUT -i ppp+ -j PublicFilter

(excess rules removed)

##### WIRELESS FILTER
[0:0] -A WirelessFilter -p udp -m udp --dport 53 -j ACCEPT
[0:0] -A WirelessFilter -p tcp -m tcp --dport 53 -j ACCEPT
[0:0] -A WirelessFilter -p tcp -m tcp --dport 80 -j ACCEPT
[0:0] -A WirelessFilter -p udp -m udp --dport 67 -j ACCEPT
[0:0] -A WirelessFilter -m mac --mac-source (censored) -j ACCEPT
[0:0] -A WirelessFilter -m mac --mac-source (censored) -j ACCEPT
[0:0] -A WirelessFilter -m mac --mac-source (censored) -j ACCEPT
[0:0] -A WirelessFilter -m state --state RELATED,ESTABLISHED -j ACCEPT
[0:0] -A WirelessFilter -m state --state NEW -j MyREJECT



<--/\/--- eth1 {LinuxBox} eth0 --- WIRED LAN ----
                  |
                eth2
                  |
                  WIRELESS



and below is basically what I have

this if from the iptables-save type command for use in a redhat 8
/etc/sysconfig/iptables file incase that matters (but it shouldn't)


Basically what I am trying to accomplish here is that _IF_ you figure
out my key (which I know is trivial) and know the name of the ESSID
(which is not being broadcast), then I want to have a little firewall
waiting for you on the other side.

I _DO_ want to allow them to come online and be able to look up their
DNS (so windows thinks its online)... but I want to have it so that only
my machines have full access to the network, and people who dont have
access (should be my friends that I have given ESSID and KEY to) will
get a webpage that says something generic like "You are on such and such
wireless network.. If you do not have permission to be here, get off
now.. otherwise, please email wirelessadmin@somedomain.com to be added
to the access list."

My problem is.. that while I feel the actual firewall HOST is protected
by the rules below, I don't have any fricken clue how to do the redirect
thing to the web site.. and I think I probably need some freakey forward
rules or maybe something in -t nat? and squid?? or ?? maybe a neat
virtual host in apache?? 


Any help you can offer is appreciated... right now I have them go to MY
website (which is why port 80 is allowed) to see if they are working,
then look in the arp table (or dhcp stuff) for their mac entry and
temporarily add them (ie not in the config file so I can just service
iptables restart to get back to my base config)



on a side note... is there a ip_conntrack_nfs so I dont have to trust my
internal interface explicitly?


Thanks,
Tommy


