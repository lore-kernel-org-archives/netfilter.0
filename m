From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Example scripts with DNS and DMZ solutions
Date: Wed, 25 Feb 2004 12:47:43 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122EF8@alderaan.smgtec.com>
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
To: "Nikolaj G." <damn_you_alexis@yahoo.com>, netfilter@lists.netfilter.org

One important thing you never mentioned was if you were hosting your own
internet records, or if you had a provider doing it. I am assuming that
you do host your own external records.

1. LAN - This services requests for LAN clients only.
	Resolves all machines inside the DMZ and servers that the DMZ
needs inside the LAN
	This view then uses the DMZ DNS for forwarding
	This does do dynamic DNS updates

2. DMZ - This services requests for all clients. There are two views,
one for internet traffic and one for everyone else.
   View #1:=20
 	Access is available to internet users
	This view does not return recursive results
	This view links to only publically available DNS information
(mail,web...)
   View #2:=20
	Access is available to non-internet users
	Resolves all machines inside the DMZ and servers that the DMZ
needs inside the LAN
	This view then uses your ISP's DNS for forwarding
	This does not do dynamic DNS updates
  =20
There should be enough examples on the net to describe how bind views
work. If not, just reply and I can fill in blanks.

Limitations:
	#1 The Internal DNS clients need to be on a separate DNS domain
than the DMZ servers. Eg:
		client_workstation.mynetwork.com
		dmz_server.dmz.mynetwork.com
	This only applies to the internal network, of course, but it may
fck up simple windows networks

	#2 I am assuming your using BIND on Linux. If you are using
windows DNS, I don't believe they understand the concept of views which
means you'd need a third DNS server
=09
	#3 No DMZ machines should have dynamic DNS. This isn't a
requirement, but you should damn well follow it.
=09
	#4 DMZ Machines cannot reach Dynamic IP machines without
hand-holding the static DNS list. Why would anyone want to do this
anyways? (Correction, you could make the network less secure and have
the LAN's DNS server pushing DNS updates to the DMZ DNS. I wouldn't
though.)


