From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: QoS on dynamic port allocation protocols
Date: Thu, 13 Mar 2003 15:54:29 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0303131553570.5562-100000@blackhole.kfki.hu>
References: <1047562853.3e708a65c21a5@www.spsul.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1047562853.3e708a65c21a5@www.spsul.com.br>
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
To: alexb@atix.com.br
Cc: raymondl@knowledgefactory.co.za, Netfilter Mailing List <netfilter@lists.netfilter.org>

On Thu, 13 Mar 2003 alexb@atix.com.br wrote:

> But how do I distinguish RELATED connection from ftp and H323 ?
> If I only whant to limit bandwidht for ftp and not for H323, how could I tell
> iptable to mark only the RELATED packets from ftp connections ?

Use the helper match.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


