From: alexander.swann@synetics.fr
Subject: Logging - where does it go??
Date: Wed, 3 Jul 2002 20:24:03 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <OF4C10C9CF.58EEBC03-ONC1256BEB.00610871-C1256BEB.00654974@synetics.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org
Cc: russell.seymour@energis.com

Hi !

(Sorry I can't send the history back in this mail, I just suscribed and=

first post)

I have the same problem than Russell :-((((

My iptables rule :
$PATH -A FORWARD -i $LAN -p tcp -s 0.0.0.0/0 --dport 80 -j LOG --log-le=
vel
DEBUG --log-prefix "FWlogHTTP :"

Does my rule work ? (yes)
# iptables -L -v -n
 pkts bytes target     prot opt in     out     source
destination
 2793  241K LOG        tcp  --  eth3   *       0.0.0.0/0
0.0.0.0/0          tcp dpt:80 LOG flags 0 level 7 prefix `FWlogHTTP :'

Ok now lest do a little # dmesg
# dmesg
FWlogHTTP :IN=3Deth3 OUT=3Deth0 SRC=3D192.168.252.48 DST=3D194.98.133.x=
xx LEN=3D48
TOS=3D0x08 PREC=3D0x00 TTL=3D127 ID=3D12358 DF PROTO=3DTCP SPT=3D2271 D=
PT=3D80
WINDOW=3D16384 RES=3D0x00 SYN URGP=3D0
FWlogHTTP :IN=3Deth3 OUT=3Deth0 SRC=3D192.168.255.184 DST=3D213.193.13.=
xx LEN=3D48
TOS=3D0x08 PREC=3D0x00 TTL=3D127 ID=3D19957 DF PROTO=3DTCP SPT=3D1114 D=
PT=3D80
WINDOW=3D16384 RES=3D0x00 SYN URGP=3D0

ok, it's logging in the kernel ring buffer

lets see my /etc/syslog.conf

*.info;mail.none;authpriv.none;cron.none
/var/log/messages
(this one shud work ? no ?)

I tested to add these 2 ones (as suggested by GeorgeV)... but without a=
ny
result ...

*.*                                       /var/log/test
*.=3Ddebug                                  /var/log/debugF

(I restarted the syslogd also)

So my stupid question is :
What did I miss so that all logs goes in a file ? /var/log/messages or =
an
other one ...

Help ;-))

I am running on a RH 7.2


Alexander SWANN
Administrateur Syst=E8mes et R=E9seaux
SYNETICS Groupe Soft-Computing
75015 PARIS=



