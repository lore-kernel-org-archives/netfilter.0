From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Forwarding GnomeMeeting to internal network
Date: Wed, 12 Nov 2003 12:56:56 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122EA2@alderaan.smgtec.com>
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
To: Julien Didron <admin@tripnotik.dyndns.org>, Netfilter Mailing List <netfilter@lists.netfilter.org>

If you are using a newish version of Netfilter, you can execute
something like the following:

echo "1000" >
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_close_wait

This would set TCP CLOSE_WAIT timeouts to 1000 seconds. The default
number is 3 days, so within that time, any traffic that does not close
the connection properly will linger inside the conntrack systems.

I don't have the option to fix the bad system. I do Nagios probes for
Windows 2000 RDP uptimes using tcp socket probing (I know I could use
RPC, blah blah), but the RDP connections are never fully closed by the
windows machine, so within a couple days of probing various servers, I
have quite a large conntrack table.=20


-----Original Message-----
From: Julien Didron [mailto:admin@tripnotik.dyndns.org]=20
Sent: Wednesday, November 12, 2003 5:11 AM
To: Netfilter Mailing List
Subject: Re: Forwarding GnomeMeeting to internal network

Hi again,


Thanks for the answer Antony.
I'll then grant this box a fixed IP using DHCP declaration with the MAC=20
adress.

Concerning the ip_conntrack table, I indeed have a sort of worm on my
network=20
called "MLdonkey" ;o) (it's on some other box on the network), process
that I=20
kill everytime the problem occurs, but with no success : i still get the
very=20
same error line in syslog.
after increasing the value of ip_conntrack_max, I monitored the traffic
on=20
the outgoing interface, that was very little : say from 150B/s to 500B/s
up=20
and down.
For information my local network (this is home) is composed of 4
machines=20
ranging from mail server (smtp and pop) to DDNS, DHCP and web server ...
But=20
I really don't think it to be a "large" network :o)


