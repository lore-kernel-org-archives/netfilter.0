From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: can't patch with patch-o-matic
Date: Tue, 18 Feb 2003 20:56:57 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0302182055500.9519-100000@blackhole.kfki.hu>
References: <5.2.0.9.2.20030218163537.01c473e8@172.26.0.8>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.0.9.2.20030218163537.01c473e8@172.26.0.8>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luis Miguel Cruz Miranda <luismi@b2bi.es>
Cc: Sneppe Filip <Filip.Sneppe@cronos.be>, netfilter@lists.netfilter.org

On Tue, 18 Feb 2003, Luis Miguel Cruz Miranda wrote:

> I deleted /usr/src/linux at all.
> I use the original 2.4.19 source code and I still can't apply
> tcp-window-tracking patch :(

The most recent tcp-window-tracking patch from cvs works with 2.4.20.
It requires all the submitted and pending patches.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


