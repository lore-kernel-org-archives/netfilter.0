From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Snort Output v. Iptables Log
Date: Tue, 4 Nov 2003 14:59:36 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E9D@alderaan.smgtec.com>
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
To: IPTables List <netfilter@lists.netfilter.org>

Maybe this is because snort is running in promisc mode and listening to
packets that aren't destined for the machine, whereas the Netfilter
never sees them because the packets are dropped at a later level?

239.* is multicast, so maybe your firewall discards multicast packets by
policy before filtering?

Quote from RFC 3171:

239.0.0.0   - 239.255.255.255 (239/8)       Administratively Scoped
                                               Block

-----Original Message-----
From: David C. Hart [mailto:DCH@TQMcube.com]=20
Sent: Tuesday, November 04, 2003 2:25 PM
To: iptables mailing list
Subject: Snort Output v. Iptables Log

If I run snort, I get tons of these from a neighboring IP (I'm assuming
"dirty" windows in contrast to anything malicious BTW).
----------------------------
[**] MISC UPnP malformed advertisement [**]
11/04-16:25:15.492306 151.202.17.22:1901 -> 239.255.255.250:1900
UDP TTL:150 TOS:0x0 ID:1 IpLen:20 DgmLen:355
Len: 327
---------------------------
None of these packets get logged by IPTables. To be sure, I added a
"kitchen sink" rule at the very top specific to the offending IP with no
parameters:

-A INPUT -s 151.202.17.22 -j LOG  --log-prefix "Firewall: " --log-level
debug --log-tcp-sequence --log-tcp-options --log-ip-options

Any ideas? What am I not understanding?

