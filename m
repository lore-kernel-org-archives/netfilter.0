From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: MSN access with a webcam
Date: Wed, 11 Aug 2004 16:37:07 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051273@asimail2.alphanumeric.com>
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

> I can use Microsoft's MSN(chat) but using a webcam wont work.
>
> Here's a part listings of my firewall MSN rules:
>
> echo "MSN Messenger..."
> iptables -t filter -A FORWARD -i $lan -o $wan -p tcp --dport 1863 -s =
$net_lan -j ACCEPT
> iptables -t filter -A FORWARD -i $wan -o $lan -p tcp --sport 1863 -m =
state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -t filter -A FORWARD -i $lan -o $wan -p tcp --dport 443 -s =
$net_lan -j ACCEPT
> iptables -t filter -A FORWARD -i $wan -o $lan -p tcp --sport 443 -m =
state --state ESTABLISHED,RELATED -d $net_lan -j ACCEPT
>
> Is a webcam using another TCP port?

as far as i know, it uses UPnP.  take a look at:  =
http://sourceforge.net/projects/linux-igd/

i have no idea if IGD actually works or not...

-j

