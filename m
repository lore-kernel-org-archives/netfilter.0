From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: iptables on Satellite receive only linux PC
Date: Sat, 31 Jul 2004 19:44:51 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051215@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

> Actually assuming that the satellite card is pentanet0 you want
>
> echo 0 > /proc/sys/net/ipv4/conf/all/rp_filters
> echo 1 > /proc/sys/net/ipv4/conf/pentanet0/rp_filters
>
> To only turn off spoofing protection on the one interface.

That achieves the opposite effect.  The above will disable reverse path =
filtering for all interfaces except pentanet0.  The opposite, would do =
what you are suggesting:

# enable reverse-path filtering on all interfaces
echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter

# disable reverse-path filtering on pentanet0 interface
echo 0 > /proc/sys/net/ipv4/conf/pentanet0/rp_filter

-j

