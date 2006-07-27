From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: IPTABLES , help requested ,
	have problem in forwarding port 110 to 8110
Date: Thu, 27 Jul 2006 16:31:19 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C40127E8@knowledge.wizdom.nu>
References: <20060727063003.28711.qmail@web55508.mail.re4.yahoo.com><02BB8A4AC86C564C89C7F14CF98CE0C40127E7@knowledge.wizdom.nu>
	<44C88315.3060006@plouf.fr.eu.org>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@lists.netfilter.org

>> ACCEPT     all  --  anywhere             anywhere
>> This converts your DROP policy to an ACCEPT, doesn't seem wise.

>Remember that iptables -L hides some rule parameters such as =
interfaces.
>I would not be surprised that this rule actually contains "-i eth1".
>I strongly suggest John and anyone lists iptables rules with>
>iptables-save instead of iptables -L.

Or iptables -L -n -v would do fine too, I think.


