From: "GoMi" <gomi@perezoso.net>
Subject: NAT FTP module problem
Date: Sun, 18 Apr 2004 18:24:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1BFF6m-0003u6-4Y@vishnu.netfilter.org>
References: <200404171906.i3HJ61Wr020416@server5.bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404171906.i3HJ61Wr020416@server5.bandwidthco.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: markee@bandwidthco.com, 'IT Clown' <iptables@mailbox.co.za>, netfilter@lists.netfilter.org

I have a problem inserting the ipt_nat_module

insmod ip_nat_ftp
Using /lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_nat_ftp.o
/lib/modules/2.4.20/kernel/net/ipv4/netfilter/ip_nat_ftp.o: init_module:
Device or resource busy
Hint: insmod errors can be caused by incorrect module parameters, =
including
invalid IO or IRQ parameters.
      You may find more information in syslog or the output from dmesg

Any ideas?

-----Mensaje original-----
De: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] En nombre de Mark E. =
Donaldson
Enviado el: s=E1bado, 17 de abril de 2004 21:06
Para: 'IT Clown'; netfilter@lists.netfilter.org
Asunto: RE: passive ftp

=20

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of IT Clown
Sent: Saturday, April 17, 2004 10:51 AM
To: netfilter@lists.netfilter.org
Subject: passive ftp

Hi=20

I am having some trouble to access passive mode ftp sites.I have a =
firewall
with ip forwarding enabled.When a pc on the network want to access =
passive
ftp servers i need to do the following in my rules ( on the server ):

-A OUTPUT -p tcp -m multiport --dport 21,20 -j ACCEPT -A INPUT -m state
--state RELATED,ESTABLISHED -j ACCEPT -A FORWARD -i eth0 -j ACCEPT -A
FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

But i do not want every query to be forwarded i only want say ftp access =
to
be forwarded. Why does the following not work ( on the server ):

-A FORWARD -p tcp -i eth0 -o ppp0 --dport 20 -j ACCEPT -A FORWARD -p tcp =
-i
eth0 -o ppp0 --dport 21 -j ACCEPT -A FORWARD -m state --state
RELATED,ESTABLISHED -j ACCEPT Regards=20
______________________________________________________________
Herbalife Independent Distributor http://www.healthiest.co.za


Be sure you have the two support modules you need loaded:

$MODPROBE ip_nat_ftp
$MODPROBE ip_conntrack_ftp

Passive FTP data transfers take place on a "high port" that the server
recommends to the client, and the client then establishes the new =
connection
on that high port that the server uses as well. Neither Port 20 or 21 =
are
used during this part of the process.  Therefore, the ftp connection
tracking modules are necessary for all this to happen.






