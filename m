From: Tasha Smith <natasha3641@yahoo.com>
Subject: Re: Logging Portscans
Date: Mon, 21 Oct 2002 16:33:12 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021021233312.512.qmail@web40701.mail.yahoo.com>
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

you mean you never get any logs at all, or you get log entries on the screen 
but not in a file, or you get logs sometimes, but not when you're doing a 
particular type of scan ?

--->I am scanning my firewall machine from a machine on a "different network".

--->And when the scan is finished i  check the log file of my firewall machine
and there are no reports of a scan to any port. My log file being
"/var/log/messages"

--->Here is what the nmap scan i used   "namp -sS -sT -P0 -v 152.22.xx.xx"
    

> I even added this to my syslog.conf file......
>
>  kern.warn                            /var/log/fwlog

Does this successfully log anything at all ?  I mean, if you insert a rule 
right at the start of your INPUT chain:
iptables -I INPUT -j LOG --log-prefix "fwlog: "

Does anything go into /var/log/fwlog ?
---> Yes, somehting does go into the "/var/log/fwlog" file. (All kernel messages
goes into this file like:
OCT 21 01:4443 HOSTNAME   kernel : Linux version 2.4.19
(root@hostname.bc.hisa.telus.net) gcc version 2.96)
OCT 21 01:4443 HOSTNAME   kernel Mount-cache has tables entyries: 1024 (order:
1, 8192 bytes
OCT 21 01:4443 HOSTNAME   kernel : Buffer-cache hash tables entries:4096
(order:2, 16384
And and someother kernel messages 

(I would expect you to have to add the option "--log-level=warn" to match the 
entry in your syslog.conf file.)

>  How can i get this machine to log STEALTH port scans and stuff???

Explain what you mean by a Stealth port scan ?   If yu;re using nmap, what 
options are you using ?

---> Here what options im using "namp -sS -sT -P0 -v 152.22.xx.xx"

> iptables           --flush
> iptables -t -nat   --flush
> iptables -t mangle --flush
>
> iptables -A INPUT  -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
>
> iptables --policy INPUT DROP
> iptables --policy FORWARD DROP
> iptables --policy OUTPUT ACCEPT
--->#when this line is added to my script:
  iptables -I INPUT -j LOG --log-prefix "fwlog: "
># When this line is added to my script and i run the nmap scan from a computer
with an ip address of 152.22.xx.xxx  the only things that get log in the fwlog
file are:
OCT 21 01:4453 HOSTNAME   kernel : fwlog: IN eth1 OUT= MAC=
ff:ff:ff:ff:00:43:xx:xx:xx src=192.168.0.11 DST=192.168.0.255 LEN=78 TOS=0x00
PREC=0x00 TTL=128 ID 63894 PROTO=UDP SPT=137 DPT=137 LEN=58
---> But nothing from the computers ip addressd that i did the port scan with
only tarffic that is getting logged is my machine behind the firewall and the
firewall machines eth1.

 
  iptables -A INPUT      -p tcp --tcp-flags ALL NONE -j DROP
> iptables -A FORWARD    -p tcp --tcp-flags ALL NONE -j DROP

> iptables -A INPUT    -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A OUTPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FOWWARD  -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> iptables -A INPUT -i eth0 -p udp \
>          -s ISP.DHCP  --sport 67 \
>          --dport 68 -j ACCEPT
> iptables -A OUTPUT -o eth0 -p udp \
>          -s eth0 --sport 68 \
>          -d ISP.DHCP --dport 67 -j ACCEPT
>
> iptables -A FORWARD -i eth1 -o eth0 -s 192.168.0.0/24 -j ACCEPT
>
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>
> iptables -A INPUT -i eth0 -p tcp \
>          --dport 22,25,111,1024,1025 -j LOG --log-prefix "Log-test: "

Okay, so this LOGging rule is last in your INPUT chain, just before the 
default DROP policy.

I assume you are scanning the Firewall address itself ?
--->Yes...im scanning the firewall computers ip addrsss,  152.22.xx.xx and im
not scanning  from a machine behind the firewall.Its a machine on a different
network!

By the way, what result do you get from the scan ?   Does it suggest you have 
closed ports, open ones, nothing accessible, what ?
---> The relsut i get is: All 1601 scanned ports on "firewall machine" are
filtered."

What happens if you simply ssh to the Firewall, or telnet to port 25 ?   Do 
you see a log entry then ?
--->No, i dont!
--->The script is exactly what it look like now when i did the scan!


__________________________________________________
Do you Yahoo!?
Y! Web Hosting - Let the expert host your web site
http://webhosting.yahoo.com/

