From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Question about nfmark
Date: 04 Jun 2003 21:53:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054756430.818.32.camel@elendil.intranet.cartel-securite.net>
References: <3EDE33EA.6030908@cpsc.ucalgary.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EDE33EA.6030908@cpsc.ucalgary.ca>
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
To: gupta@cpsc.ucalgary.ca
Cc: netfilter@lists.netfilter.org

Le mer 04/06/2003 =E0 20:01, Abhinav Gupta a =E9crit :
> I am a newbie to netfilter. While going through some code, I saw a=20
> comment that nfmark can be used for communicating between the different=
=20
> hooks. Could someone please explain me how this can be done.

Netfilter gives you the ability to mark packets using mangle table MARK
target (mangle table is attached to every hook in the stack). This mark,
commonly called nfmark (Netfilter mark) is a field within the data
structure that contains the packet (skb). This means once a packet is
marked, mark will be carried the whole packet life into the system.

Now, you have a mark match that allows you to read nfmark field. This
means in on given hook, you can extract information from another hook
though nfmark.

An example... Suppose you implement DNAT. This sits in PREROUTING chain.

	iptables -t nat -A PREROUTING -d $PUB_IP -j DNAT --to $PRIV_IP

How can I filter packets destined to $PUB_IP form those which were
destined to $PRIV_IP as they appear the same way into FORWARD chain ?
Use mark.

	iptables -t mangle -A PREROUTING -d $PRIV_IP -j MARK --mark 0x01

Then, in filter table, I do this :

	iptables -A FORWARD -m mark --mark 0x01 -j DROP

As I don't people access directly my private IP. Doing this, you get in
FORWARD chain information that would not be available otherwise.


Besides this, nfmark is more powerful than this as it allows Netfilter
to communicate with routing and QoS processes. This means you can take
routing or QoS decisions based on nfmark. Transparent proxying can be
done using nfmark (see http://lartc.org/), as well as QoS. This allows
you to use all Netfilter packet matching capabilities for routing and
shaping.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

