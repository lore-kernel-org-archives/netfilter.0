From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Help debugging iptables firewall....
Date: Tue, 25 Jan 2005 09:46:20 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F01991D@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Greg Cope <gregcope@gmail.com>, netfilter@lists.netfilter.org

Are you getting the connection coming back?  Try

$IPTABLES -A FORWARD -o $DMZ_IFACE -o $LAN_IFACE -j ACCEPT

And see if it makes any difference.  Forward works in both directions.
We typically allow established,related to return the path that it came
from.  You might need to do the same.


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Greg Cope
Sent: Tuesday, January 25, 2005 9:25 AM
To: netfilter@lists.netfilter.org
Subject: Re: Help debugging iptables firewall....

Hi Gary,

Pinholes?  If you mean specific IP to specific IP:PORT on specfic
interfaces then yes.

DB is an oracle listener (port 1521)

I have these:

# for ssh to db server from webserver
$IPTABLES -A FORWARD -p tcp --dport 22 -i $DMZ_IFACE -s $DMZ_EDGE_IP
-o $LAN_IFACE -d $TROT_IP -j ACCEPT

$IPTABLES -A FORWARD -p tcp --dport 1521 -i $DMZ_IFACE -s $DMZ_EDGE_IP
-o $LAN_IFACE -d $TROT_IP -j ACCEPT

I added 2 of your examples one before one after, and only see:

Jan 25 17:21:43 gateway kernel: Oracle 1521 [tcp] before: IN=3Deth1
OUT=3Deth2 SRC=3D192.168.254.3 DST=3D192.168.0.5 LEN=3D60 TOS=3D0x00 =
PREC=3D0x00
TTL=3D63 ID=3D30447 DF PROTO=3DTCP SPT=3D32907 DPT=3D1521 WINDOW=3D5840 =
RES=3D0x00
SYN URGP=3D0

Which would imply that the rule is ok and the packets goes through -
but why I am not getting a connection?

Thanks,

Greg


