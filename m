From: Charles Delorme <charles.delorme@suricat.net>
Subject: Problem with DNAT from localhost to LAN via loopback
Date: Thu, 14 Apr 2005 17:28:39 +0200
Message-ID: <1113492519.425e8c27488ab@imp1-q.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hello list...

I've read a lot in the archive about DNAT/loopback and redirect, but I st=
ill
haven't found what I'm looking for (ok, I had some U2 in my mind at that =
time.
Don't you now ? :-)

My configuration can be simplified as this (configuration is far more
complicated, but I assume you only need revelant informations) :
- a linux routeur/firewall/sshd/squid/etc with two interfaces (LAN -RFC19=
18 -
and WAN static official IP)
- a LAN machine hosting a P2P service (PixVillage photo sharing - nothing
illegal)
- the P2P protocol only knows about the WAN IP of the linux box.

I've configured PREROUTING entries and associated POSTROUTING which works
perfectly from internet or another machine on the LAN. A simple extract :

$IPTABLES -t nat -A PREROUTING -d $FW_INTERNET -p tcp --dport 3739 -j DNA=
T
--to-destination 192.168.38.9:3739
$IPTABLES -t nat -A POSTROUTING -s $LAN -d $LAN -p tcp --dport 3739 -j SN=
AT
--to-source $FW_INTERNET

My problem is from the linux box when trying "telnet [official WAN IP] 37=
39"
which replies "connection refused". "tcpdump -nt -i lo" shows a simple SY=
N then
RST. I've add LOG to chains (INPUT/FORWARD/OUTPUT/PREROUTING/POSTROUTING)=
 and
found this telnet connection does not go via the PREROUTING chain. So it
doesn't find any local 3739 port listening so it is not redirected to the
LAN... When I fire up a netcat listing on the port, I can get the connect=
ion -
off course (but as I said before, configuration is more complicated and t=
his
test was mandatory)

I've read in the archive this might be the normal behaviour, PREROUTING c=
hain
being used only for external and not loopback connection. Is that true ?

Is there a solution via iptables to solve this ?

Or should I set up a local proxy listening on loopback to relay from 3739=
 to the
remote machine as if DNAT didn't exists ? Is so, can someone suggest a ge=
neric
tcp proxy I could use (even if this would be the worst solution since I d=
on't
have only one port to relay like that...)

Thanks a lot !








