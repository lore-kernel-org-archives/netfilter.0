From: Aldo Lagana <ALagana@p21.com>
Subject: RE: iptables and samba
Date: Fri, 28 May 2004 15:44:26 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0776B9DA384FFB4C94A6B73F7DC87A6003F35CB8@newman.p21.com>
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
To: 'azeem ahmad' <azeem484@hotmail.com>, netfilter@lists.netfilter.org

You are not getting any response since this has nothing to do with
routing/firewalling it has to do with samba and how samba works.  Since you
do not have a domain samba works very peculiar - like it will broadcast and
then wait to send out directed datagrams.  

Again read up on samba - what my opinion is is that the client is beginning
with a broadcast which doesn't get forwarded; the client then waits for a
timeout and finally directs a datagram to the samba server directly which
then does make it through the router.

-----Original Message-----
From: azeem ahmad [mailto:azeem484@hotmail.com]
Sent: Friday, May 28, 2004 3:33 PM
To: netfilter@lists.netfilter.org
Subject: RE: iptables and samba


the output of tcpdump that i have posted i last message is the output of the

command
#tcpdump -i eth0 host 192.168.0.2

and i only have one internal interface eth0 and one extrnal interface ppp0

Regards
Azeem


>From: Aldo Lagana <ALagana@p21.com>
>To: 'azeem ahmad' <azeem484@hotmail.com>, netfilter@lists.netfilter.org
>Subject: RE: iptables and samba
>Date: Thu, 27 May 2004 17:07:19 -0400
>
>tcpdump individually on the interfaces that the routing is going through
>while you attempt to 'browse' or whatever.
>You should see packets coming into your input interface but maybe NOT going
>out the output interface?!?
>
># tcpdump -i eth0 > /home/eth0.log &
># tcpdump -i eth1 > /home/eth1.log &
>
>(dont forget to kill both processes when done!)
>
>-----Original Message-----
>From: azeem ahmad [mailto:azeem484@hotmail.com]
>Sent: Thursday, May 27, 2004 4:57 PM
>To: netfilter@lists.netfilter.org
>Subject: RE: iptables and samba
>
>
>
>
>neither WINS nor DNS is on my network. only a caching only name server i m
>running. and i captured the output of /var/log/messages and that is as 
>below
>and i added rules for port udp 137,139,139 and tcp 137,138,139 mean all
>three ports of both protocols but it doesnt seem to work
>
>---------------------------------------------------------------------------
-
>--------------------------------------------------
>May 28 01:36:27 subzero kernel: IN=eth0 OUT=
>MAC=00:b0:d0:3d:84:1f:00:07:e9:f4:4d:ce:08:00 SRC=192.168.0.2
>DST=192.168.0.100 LEN=60 TOS=0x00 PREC=0x00 TTL=128 ID=51870 PROTO=ICMP
>TYPE=8 CODE=0 ID=512 SEQ=1024
>May 28 01:36:32 subzero kernel: IN=eth0 OUT=
>MAC=00:b0:d0:3d:84:1f:00:07:e9:f4:4d:ce:08:00 SRC=192.168.0.2
>DST=192.168.0.100 LEN=60 TOS=0x00 PREC=0x00 TTL=128 ID=51873 PROTO=ICMP
>TYPE=8 CODE=0 ID=512 SEQ=1280
>May 28 01:36:38 subzero kernel: IN=eth0 OUT=
>MAC=00:b0:d0:3d:84:1f:00:07:e9:f4:4d:ce:08:00 SRC=192.168.0.2
>DST=192.168.0.100 LEN=60 TOS=0x00 PREC=0x00 TTL=128 ID=51878 PROTO=ICMP
>TYPE=8 CODE=0 ID=512 SEQ=1536
>May 28 01:36:43 subzero kernel: IN=eth0 OUT=
>MAC=00:b0:d0:3d:84:1f:00:07:e9:f4:4d:ce:08:00 SRC=192.168.0.2
>DST=192.168.0.100 LEN=60 TOS=0x00 PREC=0x00 TTL=128 ID=51879 PROTO=ICMP
>TYPE=8 CODE=0 ID=512 SEQ=1792
>May 28 01:36:57 subzero kernel: IN=eth0 OUT=
>MAC=ff:ff:ff:ff:ff:ff:00:07:e9:f4:4d:ce:08:00 SRC=192.168.0.2
>DST=255.255.255.255 LEN=51 TOS=0x00 PREC=0x00 TTL=128 ID=51886 PROTO=UDP
>SPT=8167 DPT=8167 LEN=31
>May 28 01:36:59 subzero samba(pam_unix)[2284]: session closed for user 
>azeem
>May 28 01:38:09 subzero kernel: IN=eth0 OUT=
>MAC=ff:ff:ff:ff:ff:ff:00:07:e9:f4:4d:ce:08:00 SRC=192.168.0.2
>DST=255.255.255.255 LEN=81 TOS=0x00 PREC=0x00 TTL=128 ID=32 PROTO=UDP
>SPT=8167 DPT=8167 LEN=61
>May 28 01:38:09 subzero kernel: IN=eth0 OUT=
>MAC=ff:ff:ff:ff:ff:ff:00:07:e9:f4:4d:ce:08:00 SRC=192.168.0.2
>DST=255.255.255.255 LEN=45 TOS=0x00 PREC=0x00 TTL=128 ID=33 PROTO=UDP
>SPT=8167 DPT=8167 LEN=25
>May 28 01:38:09 subzero kernel: IN=eth0 OUT=
>MAC=ff:ff:ff:ff:ff:ff:00:07:e9:f4:4d:ce:08:00 SRC=192.168.0.2
>DST=255.255.255.255 LEN=45 TOS=0x00 PREC=0x00 TTL=128 ID=35 PROTO=UDP
>SPT=8167 DPT=8167 LEN=25
>May 28 01:38:29 subzero kernel: IN=eth0 OUT=
>MAC=ff:ff:ff:ff:ff:ff:00:07:e9:f4:4d:ce:08:00 SRC=192.168.0.2
>DST=255.255.255.255 LEN=45 TOS=0x00 PREC=0x00 TTL=128 ID=43 PROTO=UDP
>SPT=8167 DPT=8167 LEN=25
>May 28 01:38:59 subzero samba(pam_unix)[2552]: session opened for user must
>by (uid=0)
>May 28 01:39:33 subzero kernel: IN=lo OUT=
>MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
>LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=7796 DF PROTO=TCP SPT=35625 DPT=80
>WINDOW=32767 RES=0x00 SYN URGP=0
>May 28 01:39:36 subzero kernel: IN=lo OUT=
>MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
>LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=7797 DF PROTO=TCP SPT=35625 DPT=80
>WINDOW=32767 RES=0x00 SYN URGP=0
>May 28 01:39:42 subzero kernel: IN=lo OUT=
>MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
>LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=7798 DF PROTO=TCP SPT=35625 DPT=80
>WINDOW=32767 RES=0x00 SYN URGP=0
>May 28 01:39:50 subzero kernel: IN=ppp0 OUT= MAC= SRC=202.124.201.161
>DST=202.124.192.166 LEN=48 TOS=0x00 PREC=0x00 TTL=112 ID=38996 DF PROTO=TCP
>SPT=4811 DPT=2745 WINDOW=8760 RES=0x00 SYN URGP=14133
>May 28 01:39:54 subzero kernel: IN=lo OUT=
>MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
>LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=7799 DF PROTO=TCP SPT=35625 DPT=80
>WINDOW=32767 RES=0x00 SYN URGP=0
>May 28 01:40:18 subzero kernel: IN=lo OUT=
>MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
>LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=7800 DF PROTO=TCP SPT=35625 DPT=80
>WINDOW=32767 RES=0x00 SYN URGP=0
>May 28 01:41:06 subzero kernel: IN=lo OUT=
>MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
>LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=7801 DF PROTO=TCP SPT=35625 DPT=80
>WINDOW=32767 RES=0x00 SYN URGP=0
>May 28 01:41:33 subzero kernel: IN=lo OUT=
>MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
>LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=8465 DF PROTO=TCP SPT=35699 DPT=80
>WINDOW=32767 RES=0x00 SYN URGP=0
>May 28 01:41:36 subzero kernel: IN=lo OUT=
>MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
>LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=8466 DF PROTO=TCP SPT=35699 DPT=80
>WINDOW=32767 RES=0x00 SYN URGP=0
>May 28 01:41:42 subzero kernel: IN=lo OUT=
>MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
>LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=8467 DF PROTO=TCP SPT=35699 DPT=80
>WINDOW=32767 RES=0x00 SYN URGP=0
>May 28 01:41:54 subzero kernel: IN=lo OUT=
>MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
>LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=8468 DF PROTO=TCP SPT=35699 DPT=80
>WINDOW=32767 RES=0x00 SYN URGP=0
>May 28 01:42:18 subzero kernel: IN=lo OUT=
>MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
>LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=8469 DF PROTO=TCP SPT=35699 DPT=80
>WINDOW=32767 RES=0x00 SYN URGP=0
>May 28 01:42:32 subzero kernel: IN=lo OUT=
>MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
>LEN=65 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=32770 DPT=53 LEN=45
>May 28 01:43:06 subzero kernel: IN=lo OUT=
>MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
>LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=8470 DF PROTO=TCP SPT=35699 DPT=80
>WINDOW=32767 RES=0x00 SYN URGP=0
>---------------------------------------------------------------------------
-
>---------------------------------------------------------
>
>Regards
>Azeem
> >From: <alexis@tpys.com.ar>
> >To: "azeem ahmad" <azeem484@hotmail.com>
> >CC: <netfilter@lists.netfilter.org>
> >Subject: RE: iptables and samba
> >Date: Thu, 27 May 2004 16:28:35 -0000
> >
> >it seems a name resolution issue.
> >
> >check if you're using WINS or DNS and make sure you're allowing those 
>ports
> >in orden to resolve the names. and it will work just fine
> >
> >azeem ahmad <azeem484@hotmail.com> dijo:
> >
> > >
> > > no one out there could help me?
> > >
> > > >From: "azeem ahmad" <azeem484@hotmail.com>
> > > >To: netfilter@lists.netfilter.org
> > > >Subject: iptables and samba
> > > >Date: Sun, 23 May 2004 09:20:52 +0000
> > > >
> > > >hi
> > > >i m using the script below
> > >
> >
>
>---------------------------------------------------------------------------
> >----------------------------------------------------------
> > > >iptables -F
> > > >iptables -t nat -F
> > > >iptables -P INPUT DROP
> > > >iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> > > >iptables -A INPUT -i eth0 -p tcp --dport 8080 -j ACCEPT
> > > >iptables -A INPUT -i eth0 -p tcp --dport 22   -j ACCEPT
> > > >iptables -A INPUT -i eth0 -p tcp --dport 53   -j ACCEPT
> > > >iptables -A INPUT -i eth0 -p udp --dport 53   -j ACCEPT
> > > >iptables -A INPUT -i eth0 -p udp --dport 137  -j ACCEPT
> > > >iptables -A INPUT -i eth0 -p udp --dport 138  -j ACCEPT
> > > >iptables -A INPUT -i eth0 -p tcp --dport 139  -j ACCEPT
> > > >
> > > >iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port
> >8080
> > > >#iptables -t nat -A PREROUTING -p udp --dport 80 -j REDIRECT 
>--to-port
> >8080
> > > >
> > > >iptables -P FORWARD DROP
> > > >iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> > > >iptables -A FORWARD -i eth0 -p tcp --dport 21        -j ACCEPT
> > > >iptables -A FORWARD -i eth0 -p tcp --dport 443       -j ACCEPT
> > > >iptables -A FORWARD -i eth0 -p tcp --dport 5000      -j ACCEPT
> > > >iptables -A FORWARD -i eth0 -p tcp --dport 5001      -j ACCEPT
> > > >iptables -A FORWARD -i eth0 -p tcp --dport 5005      -j ACCEPT
> > > >iptables -A FORWARD -i eth0 -p tcp --dport 5050      -j ACCEPT
> > > >iptables -A FORWARD -i eth0 -p tcp --dport 6660:6670 -j ACCEPT
> > > >iptables -A FORWARD -i eth0 -p tcp --dport 7000      -j ACCEPT
> > > >iptables -A FORWARD -i eth0 -p tcp --dport 28805     -j ACCEPT
> > > >iptables -A FORWARD -i eth0 -p tcp --dport 51215     -j ACCEPT
> > > >
> > > >iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> > >
> >
>
>---------------------------------------------------------------------------
> >----------------------------------------------------------
> > > >
> > > >i have two shares on samba server "Soft and linux" in these shares
> >there
> > > >are many folders. whenever i run the above script and then i open the
> >share
> > > >it takes atleast 4  minutes to open the share. but it doesnt take 
>time
> > > >while browsing inside share.
> > > >mean there is a folder on soft share like soft/adobe/acrobat/acrobat6
> > > >when i double click on soft it takes atleast 4 minutes but after that
> >when
> > > >i click on adobe then acrobat then acrobat6 it takes now time it just
> >brose
> > > >them normally. same problem is with the other share named linux.
> > > >but if i dont run this script then all shares work fine with no delay
> > > >
> > > >i dont know what is the udp port 80 for but i just saw its traffic on
> >my
> > > >network in iptraf so i included it in my script
> > > >
> > > >Regards
> > > >Azeem
> > > >
> > > >_________________________________________________________________
> > > >Add photos to your e-mail with MSN 8. Get 2 months FREE*.
> > > >http://join.msn.com/?page=features/featuredemail
> > > >
> > > >
> > >
> > > _________________________________________________________________
> > > The new MSN 8: smart spam protection and 2 months FREE*
> > > http://join.msn.com/?page=features/junkmail
> > >
> > >
> > >
> >
> >
> >
> >--
> >
> >
> >
>
>_________________________________________________________________
>Help STOP SPAM with the new MSN 8 and get 2 months FREE*
>http://join.msn.com/?page=features/junkmail
>
>
>
>Visit our website at http://www.p21.com/visit
>The information in this e-mail is confidential and may contain legally
>privileged information.  It is intended solely for the person or entity to
>which it is addressed.  Access to this e-mail by anyone else is
>unauthorized. If you are not the intended recipient, any disclosure,
>copying, distribution, action taken, or action omitted to be taken in
>reliance on it, is prohibited and may be unlawful.  If you received this
>e-mail in error, please contact the sender and delete the material from any
>computer.
>
>
>

_________________________________________________________________
Help STOP SPAM with the new MSN 8 and get 2 months FREE*  
http://join.msn.com/?page=features/junkmail



Visit our website at http://www.p21.com/visit 
The information in this e-mail is confidential and may contain legally
privileged information.  It is intended solely for the person or entity to
which it is addressed.  Access to this e-mail by anyone else is
unauthorized. If you are not the intended recipient, any disclosure,
copying, distribution, action taken, or action omitted to be taken in
reliance on it, is prohibited and may be unlawful.  If you received this
e-mail in error, please contact the sender and delete the material from any
computer. 



