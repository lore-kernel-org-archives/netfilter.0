From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Firewall Sending Resets(was Troubleshooting Netfilter Firewall
 (performance issues))
Date: Fri, 4 Nov 2005 23:01:38 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0511042258530.17779@blackhole.kfki.hu>
References: <1131140392.10871.11.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1131140392.10871.11.camel@localhost.localdomain>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Harrison, James" <james.harrison@americancolor.com>
Cc: netfilter@lists.netfilter.org

On Fri, 4 Nov 2005, Harrison, James wrote:

> We have determined, that during large(50-100MB) file transfers the
> firewall is spuriously sending a tcp reset to both server and client.
[...]

netfilter sends RST if it was configured to do so by using the REJECT
target.

No vanilla netfilter sends RST to client and server, in any setup.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

