From: "former03 | Baltasar Cevc" <baltasar.cevc@former03.de>
Subject: Re: Preventing port scanning using iptables ?
Date: Sun, 6 Aug 2006 11:26:33 +0200
Message-ID: <6c6b5e1c0daf49cbc42b7ecc329cc3e7@former03.de>
References: <20060805062309.43523.qmail@web56213.mail.re3.yahoo.com>
	<44D4456C.5050203@mymail.ch>
	<02BB8A4AC86C564C89C7F14CF98CE0C40127F4@knowledge.wizdom.nu>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C40127F4@knowledge.wizdom.nu>
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
Content-Type: text/plain; charset="macroman"; format="flowed"
To: netfilter@lists.netfilter.org
Cc: Ruprecht Helms <rhelms@mymail.ch>


On 05.08.2006, at 15:41, Sietse van Zanen wrote:
> If you set the policy of the INPUT and FORWARD chains to DROP and only=20=

> allow connection to ports you need from IP's that need to access these=20=

> ports, you're automagically protected against portscans. Iptables will=20=

> drop all connections to ports you have not opened, and the scanner=20
> will not know anything about them. Any ports you have opened will be=20=

> visible to scanners ofcourse.
Just for the record: there is a side effect the dropping behaviour.=20
While not exposing whether the port is open or closed, show some=20
scanners will conclude that there is a filter. If you want the scanner=20=

to think the ports are closed, you could issue send back a port=20
unreachable packet (-j REJECT --reject-with icmp-port-unreachable)

Baltasar

--

Baltasar Cevc

_____ former 03 gmbh
_____ infanteriestra=DFe 19 haus 6 eg
_____ D-80797 muenchen

_____ http://www.former03.de


