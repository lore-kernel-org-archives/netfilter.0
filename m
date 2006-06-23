From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Status open , filtered
Date: Fri, 23 Jun 2006 17:30:36 +0200
Message-ID: <449C091C.4060309@plouf.fr.eu.org>
References: <12ec50350606230755u68e1ad42p8c95714d208fad8c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <12ec50350606230755u68e1ad42p8c95714d208fad8c@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Fabio S. Silva a =E9crit :
> Hi all, i have a question, i make a firewall but when i make a scan
> using nmap it returns to me that the ports are in state filtered no
> close

What type of scan ? Which iptables target do you use to filter=20
connection attempts on ports you want to close ? DROP or REJECT (if so,=20
what type of reject) ?

My results with nmap 2.54 various TCP scans :
(better displayed with a fixed-sized font)

Target / TCP scan type  -T(connect) -S(syn)  -F(fin) -X(Xmas) -N(null)
DROP                     filtered  filtered   open     open     open
REJECT icmp-port-unreach  closed   filtered filtered filtered filtered
REJECT tcp-reset          closed    closed   closed   closed   closed

