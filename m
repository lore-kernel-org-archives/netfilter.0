From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Need to replace a SonicWall firewall with an iptables firewall.
Date: Mon, 30 Aug 2004 16:45:22 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051308@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

>  iptables -t nat -A PREROUTING -i $INTERNAL_IF -o $DMZ_IF \
>    -d $DMZ_PUB_IP -j DNAT --to-detination $DMZ_PRIV_IP

those with a discerning eye will probably be quick to note that i'm =
missing an 's' in destination there...

  iptables -t nat -A PREROUTING -i $INTERNAL_IF -o $DMZ_IF \
    -d $DMZ_PUB_IP -j DNAT --to-destination $DMZ_PRIV_IP

argh...

-j

