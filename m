From: "Harrison, James" <james.harrison@americancolor.com>
Subject: Re: Firewall Sending Resets(was Troubleshooting Netfilter Firewall
	(performance issues))
Date: Fri, 04 Nov 2005 16:16:40 -0600
Message-ID: <1131142600.10871.13.camel@localhost.localdomain>
References: <1131140392.10871.11.camel@localhost.localdomain>
	<Pine.LNX.4.58.0511042258530.17779@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0511042258530.17779@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

On Fri, 2005-11-04 at 23:01 +0100, Jozsef Kadlecsik wrote:
> On Fri, 4 Nov 2005, Harrison, James wrote:
> 
> > We have determined, that during large(50-100MB) file transfers the
> > firewall is spuriously sending a tcp reset to both server and client.
> [...]
> 
> netfilter sends RST if it was configured to do so by using the REJECT
> target.
> 
> No vanilla netfilter sends RST to client and server, in any setup.
> 
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary

I understand, but the file transfer is initiated, begins, and can and
will run for a period of time, then out of the blue it fires the RST.

Why?

-- 
James Harrison RHCE
Manager, Information Security

