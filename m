From: "Jonathan Villa" <jvilla@e37.net>
Subject: Re: allow range syntax - perplexed
Date: Tue, 15 Jun 2004 14:24:39 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1921.64.2.245.108.1087327479.squirrel@64.2.245.108>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108>
    <200406151952.48641.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed;boundary="----=_20040615142439_80380"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406151952.48641.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

------=_20040615142439_80380
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




> On Tuesday 15 June 2004 6:00 pm, Jonathan Villa wrote:
>
>> To my understanding the following will allow any address in the x.x.x.=
0
>> block access
>>
>> $IPTABLES -A INPUT -p tcp --dport 22 -s xxx.xxx.xx.0/24  -j ACCEPT
>> $IPTABLES -A INPUT -p tcp --dport 3306 -s xxx.xxx.xx.0/24  -j ACCEPT
>> $IPTABLES -A INPUT -p tcp --dport 80 -s xxx.xxx.xx.0/24 -j ACCEPT
>
> I agree - the above rules should allow any IP within the xxx.xxx.xx.0/2=
4
> Class
> C range access the firewall on port 22, 80 or 3306.
>
>> It of course is not working...
>
> Huh?   Why "of course"?   Come to that, why isn't it working?   I use t=
hat
> sort of netmask notation all the time...

I didn't meant "of course" in a bad way, I meant it in reference to my ba=
d
luck.


>> my temporary solution : looping through 1-254
>
> Ugh!

yes, very much.


> Show us the rest of your INPUT and OUTPUT ruleset, and tell us how you =
are
> testing the system (and where from).
>
> The output from "iptables -L -nvx" would be useful, as it shows us the
> rules
> in the correct order, which interfaces they apply to, and the packet /
> byte
> counts so we can see how many times particular rules have been matched.
>
> Feel free to munge IP addresses if you want to hide things from the lis=
t
> archives :)
>


here is the output for iptables -L -nvx. I've also attached a txt file in
case you want to see a cleaner output

One thing to keep in mind, since we are trying to use the machine, I had
to open up some ports to everyone :( until the issue is resolved.

Chain INPUT (policy ACCEPT 2403 packets, 206290 bytes)
    pkts      bytes target     prot opt in     out     source            =
=20
 destination
       0        0 ACCEPT     icmp --  eth0   *       0.0.0.0/0          =20
0.0.0.0/0           state ESTABLISHED
   23171  1256484 ACCEPT     tcp  --  eth0   *       0.0.0.0/0          =20
0.0.0.0/0           state ESTABLISHED
       1      137 ACCEPT     udp  --  eth0   *       0.0.0.0/0          =20
0.0.0.0/0           state ESTABLISHED
       0        0 ACCEPT     tcp  --  *      *       127.0.0.1          =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       127.0.0.1          =20
0.0.0.0/0           tcp dpt:3306
      28     1512 ACCEPT     tcp  --  *      *       127.0.0.1          =20
0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xx.xx        =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xx.xx        =20
0.0.0.0/0           tcp dpt:3306
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xx.xx        =20
0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *       xx.xxx.xx.xxx      =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xx.xxx.xx.xxx      =20
0.0.0.0/0           tcp dpt:3306
       0        0 ACCEPT     tcp  --  *      *       xx.xxx.xx.xxx      =20
0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx      =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx      =20
0.0.0.0/0           tcp dpt:3306
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx      =20
0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xx.xxx       =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xx.xxx       =20
0.0.0.0/0           tcp dpt:3306
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xx.xxx       =20
0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx       =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx       =20
0.0.0.0/0           tcp dpt:3306
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx       =20
0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx      =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx      =20
0.0.0.0/0           tcp dpt:3306
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx      =20
0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx       =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx       =20
0.0.0.0/0           tcp dpt:3306
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx       =20
0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx       =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx       =20
0.0.0.0/0           tcp dpt:3306
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx       =20
0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx       =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx       =20
0.0.0.0/0           tcp dpt:3306
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx       =20
0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx      =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx      =20
0.0.0.0/0           tcp dpt:3306
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx      =20
0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *       xx.xxx.xx.xxx      =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xx.xxx.xx.xxx      =20
0.0.0.0/0           tcp dpt:3306
       0        0 ACCEPT     tcp  --  *      *       xx.xxx.xx.xxx      =20
0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx     =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx     =20
0.0.0.0/0           tcp dpt:3306
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx     =20
0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xx      =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xx      =20
0.0.0.0/0           tcp dpt:3306
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xx      =20
0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx     =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx     =20
0.0.0.0/0           tcp dpt:3306
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx     =20
0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx     =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx     =20
0.0.0.0/0           tcp dpt:3306
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx     =20
0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx     =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx     =20
0.0.0.0/0           tcp dpt:3306
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx     =20
0.0.0.0/0           tcp dpt:80
      99     4512 ACCEPT     tcp  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           tcp dpt:80
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           tcp dpt:3306
       1       52 ACCEPT     tcp  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xx.x.xxx.xxx       =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xx.xxx.xx.xxx      =20
0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       xx.xxx.xxx.x       =20
0.0.0.0/0           tcp dpt:22
    6442   564926 LOG        all  --  !lo    *       0.0.0.0/0          =20
0.0.0.0/0           limit: avg 3/sec burst 5 LOG flags 0 level 4
    8334   748621 DROP       all  --  !lo    *       0.0.0.0/0          =20
0.0.0.0/0

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source            =
=20
 destination
       0        0 RH-Firewall-1-INPUT  all  --  *      *       0.0.0.0/0 =
=20
         0.0.0.0/0

Chain OUTPUT (policy ACCEPT 69219 packets, 67312095 bytes)
    pkts      bytes target     prot opt in     out     source            =
=20
 destination

Chain RH-Firewall-1-INPUT (1 references)
    pkts      bytes target     prot opt in     out     source            =
=20
 destination
       0        0 ACCEPT     all  --  lo     *       0.0.0.0/0          =20
0.0.0.0/0
       0        0 ACCEPT     icmp --  *      *       0.0.0.0/0          =20
0.0.0.0/0           icmp type 255
       0        0 ACCEPT     esp  --  *      *       0.0.0.0/0          =20
0.0.0.0/0
       0        0 ACCEPT     ah   --  *      *       0.0.0.0/0          =20
0.0.0.0/0
       0        0 ACCEPT     all  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           state RELATED,ESTABLISHED
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           state NEW tcp dpt:3306
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           state NEW tcp dpt:22
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           state NEW tcp dpt:80
       0        0 REJECT     all  --  *      *       0.0.0.0/0          =20
0.0.0.0/0           reject-with icmp-host-prohibited


here's my script

#!/bin/bash
#
# Allow only access to MySQL, HTTP, and SSH
#
IPTABLES=3D/sbin/iptables

#flush existing rules
$IPTABLES -F INPUT

#This allows all data that has been sent out for the computer running the
firewall
# to come back
#(for all of ICMP/TCP/UDP).
#For example, if a ping request is made it will allow the reply back
$IPTABLES -A INPUT -j ACCEPT -m state --state ESTABLISHED -i eth0 -p icmp
$IPTABLES -A INPUT -j ACCEPT -m state --state ESTABLISHED -i eth0 -p tcp
$IPTABLES -A INPUT -j ACCEPT -m state --state ESTABLISHED -i eth0 -p udp

#list of ips allowed to access the server
ALLOWIPS=3D"127.0.0.1 etc... etc..."

for ip in $ALLOWIPS;
do
$IPTABLES -A INPUT -p tcp --dport 22 -s $ip  -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 3306 -s $ip -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 80 -s $ip -j ACCEPT
done

#$IPTABLES -A INPUT -p tcp --dport 22 -s xxx.xxx.xx.0/24  -j ACCEPT
#$IPTABLES -A INPUT -p tcp --dport 3306 -s xxx.xxx.xx.0/24  -j ACCEPT
#$IPTABLES -A INPUT -p tcp --dport 80 -s xxx.XXX.XX.0/24 -j ACCEPT


#do not modify.  Allows JV access from office, home, and from remote
server for the weekends JVIPS=3D"more ips"

for jvip in $JVIPS;
do
$IPTABLES -A INPUT -p tcp --dport 22 -s $jvip -j ACCEPT
done

#Drop and log all other data
#The logging is set so if more than 5 packets are dropped in
#three seconds they will be ignored. This helps to prevent a DOS attack
#Crashing the computer the firewall is running on
$IPTABLES -A INPUT -m limit --limit 3/second --limit-burst 5 -i ! lo -j L=
OG

#drop anything else that does not come from the localhost interface
$IPTABLES -A INPUT -i ! lo -j DROP

#save rules
/etc/init.d/iptables save



------=_20040615142439_80380
Content-Type: text/plain; name="out.txt"
Content-Disposition: attachment; filename="out.txt"
Content-Transfer-Encoding: quoted-printable

Chain INPUT (policy ACCEPT 2403 packets, 206290 bytes)
    pkts      bytes target     prot opt in     out     source            =
   destination        =20
       0        0 ACCEPT     icmp --  eth0   *       0.0.0.0/0           =
 0.0.0.0/0           state ESTABLISHED=20
   23171  1256484 ACCEPT     tcp  --  eth0   *       0.0.0.0/0           =
 0.0.0.0/0           state ESTABLISHED=20
       1      137 ACCEPT     udp  --  eth0   *       0.0.0.0/0           =
 0.0.0.0/0           state ESTABLISHED=20
       0        0 ACCEPT     tcp  --  *      *       127.0.0.1           =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       127.0.0.1           =
 0.0.0.0/0           tcp dpt:3306=20
      28     1512 ACCEPT     tcp  --  *      *       127.0.0.1           =
 0.0.0.0/0           tcp dpt:80=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xx.xx         =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xx.xx         =
 0.0.0.0/0           tcp dpt:3306=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xx.xx         =
 0.0.0.0/0           tcp dpt:80=20
       0        0 ACCEPT     tcp  --  *      *       xx.xxx.xx.xxx       =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xx.xxx.xx.xxx       =
 0.0.0.0/0           tcp dpt:3306=20
       0        0 ACCEPT     tcp  --  *      *       xx.xxx.xx.xxx       =
 0.0.0.0/0           tcp dpt:80=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx       =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx       =
 0.0.0.0/0           tcp dpt:3306=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx       =
 0.0.0.0/0           tcp dpt:80=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xx.xxx        =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xx.xxx        =
 0.0.0.0/0           tcp dpt:3306=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xx.xxx        =
 0.0.0.0/0           tcp dpt:80=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx        =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx        =
 0.0.0.0/0           tcp dpt:3306=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx        =
 0.0.0.0/0           tcp dpt:80=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx       =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx       =
 0.0.0.0/0           tcp dpt:3306=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx       =
 0.0.0.0/0           tcp dpt:80=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx        =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx        =
 0.0.0.0/0           tcp dpt:3306=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx        =
 0.0.0.0/0           tcp dpt:80=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx        =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx        =
 0.0.0.0/0           tcp dpt:3306=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx        =
 0.0.0.0/0           tcp dpt:80=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx        =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx        =
 0.0.0.0/0           tcp dpt:3306=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xx        =
 0.0.0.0/0           tcp dpt:80=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx       =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx       =
 0.0.0.0/0           tcp dpt:3306=20
       0        0 ACCEPT     tcp  --  *      *       xx.xx.xxx.xxx       =
 0.0.0.0/0           tcp dpt:80=20
       0        0 ACCEPT     tcp  --  *      *       xx.xxx.xx.xxx       =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xx.xxx.xx.xxx       =
 0.0.0.0/0           tcp dpt:3306=20
       0        0 ACCEPT     tcp  --  *      *       xx.xxx.xx.xxx       =
 0.0.0.0/0           tcp dpt:80=20
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx      =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx      =
 0.0.0.0/0           tcp dpt:3306=20
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx      =
 0.0.0.0/0           tcp dpt:80=20
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xx       =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xx       =
 0.0.0.0/0           tcp dpt:3306=20
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xx       =
 0.0.0.0/0           tcp dpt:80=20
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx      =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx      =
 0.0.0.0/0           tcp dpt:3306=20
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx      =
 0.0.0.0/0           tcp dpt:80=20
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx      =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx      =
 0.0.0.0/0           tcp dpt:3306=20
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx      =
 0.0.0.0/0           tcp dpt:80=20
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx      =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx      =
 0.0.0.0/0           tcp dpt:3306=20
       0        0 ACCEPT     tcp  --  *      *       xxx.xxx.xx.xxx      =
 0.0.0.0/0           tcp dpt:80=20
      99     4512 ACCEPT     tcp  --  *      *       0.0.0.0/0           =
 0.0.0.0/0           tcp dpt:80=20
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0           =
 0.0.0.0/0           tcp dpt:3306=20
       1       52 ACCEPT     tcp  --  *      *       0.0.0.0/0           =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xx.x.xxx.xxx        =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xx.xxx.xx.xxx       =
 0.0.0.0/0           tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       xx.xxx.xxx.x        =
 0.0.0.0/0           tcp dpt:22=20
    6442   564926 LOG        all  --  !lo    *       0.0.0.0/0           =
 0.0.0.0/0           limit: avg 3/sec burst 5 LOG flags 0 level 4=20
    8334   748621 DROP       all  --  !lo    *       0.0.0.0/0           =
 0.0.0.0/0          =20

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source            =
   destination        =20
       0        0 RH-Firewall-1-INPUT  all  --  *      *       0.0.0.0/0 =
           0.0.0.0/0          =20

Chain OUTPUT (policy ACCEPT 69219 packets, 67312095 bytes)
    pkts      bytes target     prot opt in     out     source            =
   destination        =20

Chain RH-Firewall-1-INPUT (1 references)
    pkts      bytes target     prot opt in     out     source            =
   destination        =20
       0        0 ACCEPT     all  --  lo     *       0.0.0.0/0           =
 0.0.0.0/0          =20
       0        0 ACCEPT     icmp --  *      *       0.0.0.0/0           =
 0.0.0.0/0           icmp type 255=20
       0        0 ACCEPT     esp  --  *      *       0.0.0.0/0           =
 0.0.0.0/0          =20
       0        0 ACCEPT     ah   --  *      *       0.0.0.0/0           =
 0.0.0.0/0          =20
       0        0 ACCEPT     all  --  *      *       0.0.0.0/0           =
 0.0.0.0/0           state RELATED,ESTABLISHED=20
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0           =
 0.0.0.0/0           state NEW tcp dpt:3306=20
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0           =
 0.0.0.0/0           state NEW tcp dpt:22=20
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0           =
 0.0.0.0/0           state NEW tcp dpt:80=20
       0        0 REJECT     all  --  *      *       0.0.0.0/0           =
 0.0.0.0/0           reject-with icmp-host-prohibited=20
------=_20040615142439_80380--



