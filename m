From: <colonyofcrumbs@bellsouth.net>
Subject: Problem with iptables routing decision
Date: Mon, 13 Jun 2005 18:01:20 -0400
Message-ID: <20050613220120.YYWD4468.ibm61aec.bellsouth.net@mail.bellsouth.net>
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

I've configured iptables v1.2.9 on a FC2 box for my network and everything =
is working perfectly.  Well, almost.

*1* of my 60 clients is having trouble connecting to a RAS running some cus=
tom software.  Here is what happens:

The client comes in on my external interface and gets to the PREROUTING and=
 FORWARD chains.  The two following rules complete my forwarding process:

iptables -t nat -A PREROUTING -p tcp -i $EXT_IFACE -d $EXT_IP --dport $EVOP=
ORT -j DNAT --to-destination $EVORAS_IP:EVOPORT

iptables -A FORWARD -p tcp -i $EXT_IFACE -d $EVORAS_IP --dport $EVOPORT -j =
ACCEPT

The client will successfully connect to the server and everything is fine. =
 From that point, if the client closes the software (normally or abnormally=
) and immediately tries to load the software and connect again, they will s=
how up in my logs as a dropped packet from the INPUT chain resulting from t=
hese rules:

iptables -A INPUT -d $EXT_IP -i $EXT_IFACE -j LOG_DROP

iptables -A INPUT -j DROP

Excerpt from LOG_DROP table (excerpts from /var/log/messages are located at=
 the end of this e-mail):
iptables -A LOG_DROP -j LOG --log-tcp-options --log-ip-options --log-prefix=
 '[IPTABLES DROP] : '
iptables -A LOG_DROP -j DROP

Now, this cycle continues on every login.  The client will be able to login=
, then won't, then will, then won't, etc. =20

From the client's side - They can always start the program and log in.  It=
 will appear as if they are connected until they try and fetch their first =
payload of data.  At that time, if they've encountered the problem I'm desc=
ribing, the program will hang.

So, basically, I'm confused as to how a packet destined for an internal mac=
hine is all of a sudden being routed to the local host.  Has anyone seen an=
ything like this before?

Since, it's only 1 client out of 60, I would normally be quick to say "It's=
 on your side!" and turn away, but I'm just very interested in why this is =
happening and I'd like to understand as much as possible about the situatio=
n before I approach whatever is on their side.

Questions:
1) Considering the =91on/off=92 nature of this problem - Could this be some=
 sort of time out issue?  Or is that barking up the wrong tree?

2) With the proper and proven rules intact =96 What could cause a packet to=
 get routed to the wrong chain?

3) The dropped packets always seem to be ACKs.  This seems like an importan=
t piece of the puzzle, but I=92m not sure how it fits in.  Is this a signif=
icant point?

Anyone have any advice for me?  Need more information?  Please let me know.

The dropped packets look like this in /var/log/messages:

Jun 13 14:17:13 firewall kernel: [IPTABLES DROP] : IN=3Deth1 OUT=3D MAC=3D0=
0:40:f6:2c:0f:a9:00:a0:c8:10:5e:02:08:00 SRC=3DX.X.X.X DST=3DX.X.X.X LEN=3D=
52 TOS=3D0x00 PREC=3D0x00 TTL=3D113 ID=3D2209 DF PROTO=3DTCP SPT=3D59141 DP=
T=3D9999 WINDOW=3D65535 RES=3D0x00 ACK URGP=3D0 OPT (0101050AE9FDF3B9E9FDF9=
6D)
Jun 13 14:17:22 firewall kernel: [IPTABLES DROP] : IN=3Deth1 OUT=3D MAC=3D0=
0:40:f6:2c:0f:a9:00:a0:c8:10:5e:02:08:00 SRC=3DX.X.X.X DST=3DX.X.X.X LEN=3D=
52 TOS=3D0x00 PREC=3D0x00 TTL=3D113 ID=3D28870 DF PROTO=3DTCP SPT=3D59141 D=
PT=3D9999 WINDOW=3D65535 RES=3D0x00 ACK URGP=3D0 OPT (0101050AE9FDF3B9E9FDF=
96D)
Jun 13 14:17:39 firewall kernel: [IPTABLES DROP] : IN=3Deth1 OUT=3D MAC=3D0=
0:40:f6:2c:0f:a9:00:a0:c8:10:5e:02:08:00 SRC=3DX.X.X.X DST=3DX.X.X.X LEN=3D=
52 TOS=3D0x00 PREC=3D0x00 TTL=3D113 ID=3D25485 DF PROTO=3DTCP SPT=3D59141 D=
PT=3D9999 WINDOW=3D65535 RES=3D0x00 ACK URGP=3D0 OPT (0101050AE9FDF3B9E9FDF=
96D)

Thank you for your time,

Joshua


