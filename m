From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: how to block packets with specific words inside udp datagram???
Date: 12 Oct 2003 13:50:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065981000.1122.3.camel@valhalla>
References: <000d01c390d6$89b13900$0201a8c0@leonardo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c390d6$89b13900$0201a8c0@leonardo>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: "Piotr P." <peterp@poczta.onet.pl>
Cc: netfilter@lists.netfilter.org

On Sun, 2003-10-12 at 11:35, Piotr P. wrote:
>
> Does any body know how to
> block traffic with this word using iptables?

iptables =E2=80=93A FORWARD =E2=80=93p udp =E2=80=93d 0/0 --dport 1024:65=
535 =E2=80=93m string --string
"KaZaA" =E2=80=93j DROP

should do the trick.

HTH,
C



