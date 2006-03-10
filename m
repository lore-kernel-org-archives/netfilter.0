From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Why is ipset nethash set type limited to /31?
Date: Fri, 10 Mar 2006 09:15:18 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0603100910240.6303@blackhole.kfki.hu>
References: <4410F444.3090407@netboxblue.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4410F444.3090407@netboxblue.com>
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
To: Menno Smits <menno@netboxblue.com>
Cc: netfilter@lists.netfilter.org

Hi,

On Fri, 10 Mar 2006, Menno Smits wrote:

> Is there a reason why the ipset's nethash set type can't be used with
> single IPs (/32) as well as larger networks? I'd really like to be able
> to use networks and IPs in the same set.

An IP(v4) address is a 32bit number. A network address consists of an IP
address and a mask value. In nethash the IP address *and* the mask
together are stored on 32bits. Therefore it is not possible to store plain
IP addresses in that type of sets.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

