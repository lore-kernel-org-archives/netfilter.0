From: Richard <netfilter@ghz.fr>
Subject: Re: IPtables settings to access a backup FTP
Date: Sun, 19 Aug 2007 00:36:09 +0200
Message-ID: <46C77459.7000000@ghz.fr>
References: <46C743CB.801@ghz.fr> <46C7539C.60002@rtij.nl>
	<46C755AE.4030804@ghz.fr> <46C756B6.4000003@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46C756B6.4000003@rtij.nl>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Martijn Lievaart a =E9crit :
> Richard wrote:
>=20
> [ Please don't toppost. Thanks ]
>=20
>> Hi I've got ip_conntrack running,
>=20
> I was talking about ip_conntrack_ftp, not ip_conntrack. You need both.=20
> The difference is between ftp working and not working at the first LS=20
> command.
>=20
>>
>> My server hosts FTP accounts and I also need outgoing ftp ...
>=20
> Clear, so you need the input rule on port 21 as well.
>=20
>>
>> No problems accessing the ftp hosted on this server, but can't do a=20
>> CWD (ls) from this server to another external ftp server unless the=20
>> firewall is disactivated.
>=20
> No problems? Impossible with the rules you posted.
>=20
>>
>> I guess you are going to say most of my settings are useless but here=20
>> goes my current settings :
>=20
> Thanks, but that is virtually unreadable. Post the output of=20
> iptables-save instead.
>=20
> HTH,
> M4
>=20

Thankyou ! That fixed my problem ! I did a lsmod and it was not there so=20
I did a mprobe ip_conntrack_ftp and then added ip_conntrack_ftp to=20
/etc/modules

Now my backup system works well !

Now for my iptable settings, here is my file :

------

#The NAT portion of the ruleset. Used for Network Address Transalation.
#Usually not needed on a typical web server, but it's there if you need i=
t.
*nat
:PREROUTING ACCEPT [127173:7033011]
:POSTROUTING ACCEPT [31583:2332178]
:OUTPUT ACCEPT [32021:2375633]
COMMIT

#The Mangle portion of the ruleset. Here is where unwanted packet types=20
get dropped.
#This helps in making port scans against your server a bit more time=20
consuming and difficult, but not impossible.
*mangle
:PREROUTING ACCEPT [444:43563]
:INPUT ACCEPT [444:43563]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [402:144198]
:POSTROUTING ACCEPT [402:144198]
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG=20
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j D=
ROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG=20
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j D=
ROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG=20
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j D=
ROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG=20
FIN,PSH,URG -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j D=
ROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
COMMIT

#The FILTER section of the ruleset is where we initially drop all=20
packets and then selectively open certain ports.
#We will also enable logging of all dropped requests.
*filter
:INPUT DROP [1:242]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]
:LOG_DROP - [0:0]
:LOG_ACCEPT - [0:0]
:icmp_packets - [0:0]

#test
-A FORWARD -i eth0 -o eth1 -p tcp --syn --dport 21 -j ACCEPT
#First, we cover the INPUT rules, or the rules for incoming requests.
#Note how at the end we log any incoming packets that are not accepted.
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -m tcp --dport 20 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 21 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 2022 -j LOG_ACCEPT
-A INPUT -p tcp -m tcp --dport 25 -j LOG_ACCEPT
-A INPUT -p tcp -m tcp --dport 43 -j ACCEPT
-A INPUT -p udp -m udp --dport 53 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 110 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 143 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 123 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 8443 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 8880 -j ACCEPT
#Passive FTP connections
-A INPUT -p tcp -m tcp --dport 32876 -j ACCEPT
-A INPUT -p udp -m udp --dport 32876 -j ACCEPT

#uncomment the next line if you are running Spamassassin on your server
#-A INPUT -p tcp -m tcp --dport 783 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 993 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 3306 -j ACCEPT
-A INPUT -s 127.0.0.1 -j ACCEPT
-A INPUT -p icmp -j icmp_packets
-A INPUT -j LOG_DROP

#Next, we cover the OUTPUT rules, or the rules for all outgoing traffic.
#Note how at the end we log any outbound packets that are not accepted.
-A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 20 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 21 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 2022 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 23 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 25 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 43 -j ACCEPT
-A OUTPUT -p udp -m udp --dport 53 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 80 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 110 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 143 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 443 -j ACCEPT
-A OUTPUT -p udp -m udp --dport 123 -j ACCEPT
#uncomment the next line if you are running Spamassassin on your server
#-A OUTPUT -p tcp -m tcp --dport 783 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 993 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 3306 -j ACCEPT
-A OUTPUT -d 127.0.0.1 -j ACCEPT
-A OUTPUT -p icmp -j icmp_packets
-A OUTPUT -j LOG_DROP

#Here we have 2 sets of logging rules. One for dropped packets to log=20
all dropped requests and one for accepted packets, should we wish to log=20
any accepted requesets.
-A LOG_DROP -j LOG --log-prefix "[IPTABLES DROP] : " --log-tcp-options=20
--log-ip-options
-A LOG_DROP -j DROP

-A LOG_ACCEPT -j LOG --log-prefix "[IPTABLES ACCEPT] : "=20
--log-tcp-options --log-ip-options
-A LOG_ACCEPT -j ACCEPT

#And finally, a rule to deal with ICMP requests. We drop all ping=20
requests except from our own server.
# Make sure you replace 1.2.3.4 with the IP address of your server.
#-A icmp_packets -p icmp -m icmp --icmp-type 0 -j ACCEPT
#-A icmp_packets -p icmp -m icmp --icmp-type 8 -j ACCEPT
#-A icmp_packets -p icmp -m icmp --icmp-type 3 -j ACCEPT
#-A icmp_packets -p icmp -m icmp --icmp-type 11 -j ACCEPT
-A icmp_packets -p icmp -m limit  --limit 1/s --limit-burst 1 -j ACCEPT
-A icmp_packets -p icmp -m limit --limit 1/s --limit-burst 1 -j LOG=20
--log-prefix "PING-DROP: "

COMMIT


-----

So as far as I understand, I must remove the two following lines :

-A INPUT -p tcp -m tcp --dport 20 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 20 -j ACCEPT

Thanks again !

Richard

