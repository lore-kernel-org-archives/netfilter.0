From: "Khanh Tran" <khanh@slc.edu>
Subject: RE: virus scanning with iptables
Date: Thu, 9 Sep 2004 20:36:24 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <01CEA3A5B8B2D511890F0002A5870AEC02CE644C@exchange.admin.slc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org

How about port scanning clients behind from the firewall?  Suggestions?
I'm thinking of something that could be scripted to append an iptables
rule to block the MAC address of the offending client, then notify me.
Am I looking at an NMAP plugin possibly?


Khanh Tran
Network Operations
Sarah Lawrence College


-----Original Message-----
From: Daniel Chemko [mailto:dchemko@smgtec.com]=20
Sent: Thursday, September 09, 2004 7:27 PM
To: Khanh Tran; netfilter@lists.netfilter.org
Subject: RE: virus scanning with iptables

Khanh Tran wrote:
> Is any using a virus scanning application with iptables?  I'd like to=20
> know if it's possible for me to detect viruses that go across my=20
> iptables firewalls.

There isn't currently a tool to perform Virus scanning of iptables data.
The closest match would be snort-inline which can locate some virus
signatures. Inline scanning of anything can have averse effects on the
transmission. You'll quickly find that detailed scans require a lot of
CPU usage. Just for monitoring network thoughtput with ntop, I'd max out
my P4 CPU when backups kicked off.

The better approach would be to implement transparent proxies of
pertinent services like SMTP and use virus scanning addons. for them.
You may also look at the 'l7-filter' project or the 'string' extension
to see if their implementation suits your needs.


