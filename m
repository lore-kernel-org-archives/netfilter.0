From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: DNAT, Is it possible to find the original destination?
Date: Mon, 8 Nov 2004 15:14:17 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF56795AA@alderaan.smgtec.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jason Lunz <lunz@falooley.org>, netfilter@lists.netfilter.org

-m conntrack is the key here:

conntrack match v1.2.9 options:
 [!] --ctstate
[INVALID|ESTABLISHED|NEW|RELATED|UNTRACKED|SNAT|DNAT][,...]
                                State(s) to match
 [!] --ctproto  proto           Protocol to match; by number or name,
eg. `tcp'
     --ctorigsrc  [!] address[/mask]
                                Original source specification
     --ctorigdst  [!] address[/mask]
                                Original destination specification
     --ctreplsrc  [!] address[/mask]
                                Reply source specification
     --ctrepldst  [!] address[/mask]
                                Reply destination specification
 [!] --ctstatus [NONE|EXPECTED|SEEN_REPLY|ASSURED|CONFIRMED][,...]
                                Status(es) to match
 [!] --ctexpire time[:time]     Match remaining lifetime in seconds
against
                                value or range of values (inclusive)


