From: Frederic de Villamil <neuro@seclab.jp>
Subject: Re: is this possible ?
Date: Sat, 10 Apr 2004 22:54:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040410205446.GB34633@jesus.seclab.jp>
References: <006d01c41f3a$35d37030$0300000a@serverxx>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <006d01c41f3a$35d37030$0300000a@serverxx>
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
Content-Transfer-Encoding: 7bit
To: Syed Faisal Gillani <faisal@clickonlinenetworks.com>
Cc: netfilter@lists.netfilter.org

On Sun, 11 Apr 2004, Syed Faisal Gillani wrote:

> is it possible in iptables to FW a port traffic (eg 80) to an internal =
> ipaddress of a webserver ?

Hi,
it's called NAT (network address translation).

iptables -t nat -A PREROUTING -p tcp -d your.external.addy --dport 80 -j DNAT --to your.local.addy:80

Maybe you should have a look at
http://netfilter.org/documentation/HOWTO//NAT-HOWTO.html

regards
Frederic
--
< Ylli> lol je rigole neuro jte prend pa pr un pervers ms un president
et pere de famille respectable :s
http://www.seclab.jp

