From: "Aldo Lagana" <ALagana@p21.com>
Subject: RE: track bandwith used
Date: Wed, 30 Jun 2004 10:07:20 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5EDC9B3CC8401E4184D3B43B75A75C2B46D687@mx.p21.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter <netfilter@lists.netfilter.org>

iptraf=20

-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Wednesday, June 30, 2004 9:41 AM
To: netfilter
Subject: Re: track bandwith used


On Wednesday 30 June 2004 2:07 pm, Peter Marshall wrote:

> Hi again,
>
> I was also wondering if anyone knows a way to track bandwith being =
used
> through the firewall .......

Well, there are plenty of network monitoring tools which will give you =
this=20
sort of information as an aggregate figure for an interface, or broken =
down=20
by source/destination address, port number etc - iptraf is not a bad =
start to=20
see what can be done.

Other than that you can use netfilter rules to count the packets & =
bytes, and=20
then use a cron job to record the counts at whatever intervals you want=20
(every minute, every hour, every day...), and then process them =
yourself.

Things I would mention if you're going to try the latter option:

1. Most packets do not match against rules in the nat table, so don't =
try=20
counting those - the only packets which match these are the first of =
each=20
connection - all the rest are processed invisibly by netfilter in the=20
background, and your rules don't see them (this is also the reason why =
you=20
should never set a default DROP policy on a nat table!)

2. If you are using a standard -m state --state ESTABLISHED,RELATED rule =
in=20
your FORWARD chain, remember that nearly all packets will match that, no =

matter which direction they're going through the machine, and which =
port/s=20
they're going to or from.   Again, most of the rules in your FORWARD =
chain=20
will only match the first packet of a given connection, so you won't see =
much=20
traffic on these rules either (although they can give you a useful =
indication=20
of the number of connections of that type which get created).

3. The FORWARD mangle table can be a good place to put rules which will =
see=20
all traffic going through the system.

4. For accounting purposes, you can quite readily use rules with no =
target=20
(eg: iptables -A FORWARD -p tcp --dport 25); these will make no =
difference to=20
whether the packets are ACCEPTed, DROPped, LOGged, REJECTed, or whatever =

(obviously you need separate rules to do that somewhere else), but the =
packet=20
& byte counters from iptables -L -nvx will show you how many of that =
type of=20
packet were seen.   You can make the rules as specific as you like if =
you=20
want to count certain connections in minute detail (eg: iptables -A =
FORWARD=20
-p tcp --dport 25 -s my.mail.ser.ver -d ISP.mail.ser.ver)

5. Don't overlook the raw packet & byte counts available from ifconfig =
if all=20
you want to do is monitor traffic in & out of an interface.

Hope this give you some ideas.

Regards,

Antony.

--=20
"The future is already here.   It's just not evenly distributed yet."

 - William Gibson

                                                     Please reply to the =
list;
                                                           please don't =
CC me.


