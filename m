From: "Robert Allmeroth" <netfilter@epygi.de>
Subject: How fast is a rule append ?
Date: Fri, 27 Jun 2003 16:12:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <PIEIIGGHCLEGAPAHFMDOMEFNCOAA.netfilter@epygi.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="macroman"
To: netfilter@lists.netfilter.org

hello :)


we have a script which is doing the following... but the NTP client fails


        /bin/iptables -A SystemOut -p udp --sport 1024:65535 --dport 123 =
-j ACCEPT
        /bin/msntp -r -x $TIME_UPDATE -f /var/run/msntp.save -F $PIDFILE =
$TIMESERVER


If we change the script like this, it works pretty good.
        /bin/iptables -A SystemOut -p udp --sport 1024:65535 --dport 123 =
-j ACCEPT
	  /bin/sleep 1
        /bin/msntp -r -x $TIME_UPDATE -f /var/run/msntp.save -F $PIDFILE =
$TIMESERVER

As you can see the LOG is matched, but the same "accept" rule (recently a=
dded)
has not matched (counter 0).
any ideas ?

best regards
  Robert & Markus

----- log ------
user.info msntp: [3215]: msntp started
daemon.warn klogd: IN=3D OUT=3Deth1 SRC=3D10.20.10.177 DST=3D195.13.1.153=
 LEN=3D76 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DFPROTO=3DUDP SPT=3D1028=
 DPT=3D123
LEN=3D56
daemon.warn klogd: seen IN=3D OUT=3Deth1 SRC=3D10.20.10.177 DST=3D195.13.=
1.153 LEN=3D76 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DUDP SPT=3D=
1028
DPT=3D123 LEN=3D56
user.err msntp: [3215]: unable to send NTP packet
user.err msntp: [3215]: Operation not permitted
user.notice init.d: ntp: started
------- end log -------
+bash-2.05# iptables -vnL SystemOut
Chain SystemOut (1 references)
 pkts bytes target     prot opt in     out     source               desti=
nation
    9   684 LOG        udp  --  *      *       0.0.0.0/0            0.0.0=
.0/0          udp dpt:123 LOG flags 0 level 4 prefix `seen
'
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0=
.0/0          udp spts:1024:65535 dpt:123


------------------
Epygi Labs DE           |  Herrenstra=DFe 23
Robert Allmeroth        |  76133 Karlsruhe
Tel: +49 721 20596 43   |  Fax: +49 721 20596 59


