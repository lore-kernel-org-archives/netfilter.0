From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: Re: Packets Counting
Date: Wed, 16 Mar 2005 16:24:59 -0500
Message-ID: <085901c52a6e$9ba8d770$b000a8c0@cybergeneration.com>
References: <4238655B@webmail.wichita.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: "M. A. Imam" <maimam@wichita.edu>
Cc: netfilter@lists.netfilter.org


Hello

Got a little script that i use to create graphs
with RRD tool.

The main idea is :
create a rule that will match packet that you want to
count. It can be ACCEPTED packets for bandwidth monitoring
or DROP / REJECT to know how many packets have been
blocked on the firewall.

example rules that will count inbound and outbound bytes and
packets for a NATed host :
$IPTABLES -t filter -A FORWARD -i eth0 -o ppp0 -s 192.168.0.2 -j ACCEPT
$IPTABLES -t filter -A FORWARD -i ppp0 -o eth0 -d 192.168.0.2 -j ACCEPT
...



change these rules to fit what you want to count (in your question,
it would be --sport 5001).

Then, another script to extract the information : "iptbwcheck.sh"

# extract information from iptables, put in a file and zero the counter (-Z)
# -x stands for "show info in bytes not megs or gigs"
/sbin/iptables -x -nvL -Z FORWARD >tmp_forward

# put these in local vars
inputPckMax=3D`grep "^.*ppp0   eth0.*192\.168\.0\.2 .*$" tmp_forward |awk
'{print $1}'`
inputBytesMax=3D`grep "^.*ppp0   eth0.*192\.168\.0\.2 .*$" tmp_forward |awk
'{print $2}'`
outputPckMax=3D`grep "^.*eth0   ppp0.*192\.168\.0\.2 .*$" tmp_forward |awk
'{print $1}'`
outputBytesMax=3D`grep "^.*eth0   ppp0.*192\.168\.0\.2 .*$" tmp_forward |awk
'{print $2}'`

# del tmp file
rm -f tmp_forward

# call RRD
endDate=3D`date +%s`
/usr/local/rrdtool-1.0.49/bin/rrdtool update nat.rrd \
$endDate:\
$inputBytesMax:$outputBytesMax:$inputPckMax:$outputPckMax

# do whatever else you want to do with this information
# ex : log in a file, log into mysql, upload to another syslog server, ...

See some graphs created from this script :

- Bandwidth monitoring
http://69.156.160.170/mephisto_day_full.gif

- Blocked packets / 5 mins
http://69.156.160.170/mephisto_day_full_firewall.gif

HTH

Maxime Ducharme
Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau

----- Original Message -----=20
From: "M. A. Imam" <maimam@wichita.edu>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, March 16, 2005 10:56 AM
Subject: Packets Counting


> Hi,
>
> How can i count the number of packets on an interface evry 2 or 5 seconds.
and
> i want to count only specific packets like only arriving packets from port
> 5001
>
> Any ideas...
>
> Muhammad
>


