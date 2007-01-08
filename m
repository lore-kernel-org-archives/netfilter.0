From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Limit IP
Date: Mon, 8 Jan 2007 10:28:25 +0100
Message-ID: <002e01c73307$596ea6c0$0b0ffe0a@NS006819>
References: <562d10500701080045t1c33b4f7v607c1630da710d7e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <562d10500701080045t1c33b4f7v607c1630da710d7e@mail.gmail.com>
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

netfilter-bounces@lists.netfilter.org wrote:
> Hi,
> 
> does anyone know how to limit the IP connection from going out to
> internet? 
> 
> example:
> LAN: 192.168.0.0/24
> 
> but im only want to give 10 IP's go out to internet

You can:

- if these IP's are random in 192.168.0.0/24, put 10 rules in place
which each describe which 192.168 ip can be forwarded.

$ipt -A FORWARD -s 192.168.x.x [...] -j ACCEPT
...

- if these IP's form a range in 192.168.0.0/24, use the range match to
describe a range of ip's that can be forwarded. However, the range match
is in POM-ng so you'll have to check if your install supoprts it.
http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-i
prange

Gr,
Rob



