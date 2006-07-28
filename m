From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: IPTABLES , help requested ,
	have problem in forwarding port 110 to 8110
Date: Fri, 28 Jul 2006 15:34:19 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C40127E9@knowledge.wizdom.nu>
References: <20060727063003.28711.qmail@web55508.mail.re4.yahoo.com><02BB8A4AC86C564C89C7F14CF98CE0C40127E7@knowledge.wizdom.nu>	<44C88315.3060006@plouf.fr.eu.org>
	<02BB8A4AC86C564C89C7F14CF98CE0C40127E8@knowledge.wizdom.nu>
	<44C9E97C.5090506@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

True, and what about a screendump of an fwbuilder rulebase. ;-)

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Pascal Hambourg
Sent: Fri 28-Jul-06 12:39
To: netfilter@lists.netfilter.org
Subject: Re: IPTABLES , help requested , have problem in forwarding port =
110 to 8110



Sietse van Zanen a =E9crit :
>
>>I strongly suggest John and anyone lists iptables rules with>
>>iptables-save instead of iptables -L.
>
> Or iptables -L -n -v would do fine too, I think.

IMHO iptables-save has some advantages over iptables -nvL :
- lists all loaded tables in one command unless specified otherwise
- output format is similar to the iptables syntax
- output format is more compact (simple rules can fit in 80 columns).




