From: "o omida parasita" <izghitu@gmail.com>
Subject: Problem with iptables/geoip
Date: Sat, 15 Apr 2006 11:57:46 +0300
Message-ID: <948a6d890604150157o41fae766l3c344ef5bcef7e26@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hello,
I compiled successfuly iptables with geoip support using the guide
from here: http://people.netfilter.org/peejix/geoip/howto/geoip-HOWTO-1.htm=
l
The problem is when I do the following for example:iptables -A INPUT
-m geoip ! --src-cc CA -j DROP
I receive the following error: iptables: Unknown error 4294967295

I did all this on FC4 with a 2.6 kernel

Please help

Thank you

