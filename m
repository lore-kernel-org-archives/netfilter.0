From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: non-standard FTP ports and connection tracking (redux)
Date: Tue, 10 Dec 2002 09:46:12 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0212100943130.9625-100000@blackhole.kfki.hu>
References: <200212100312.13403.apapadop@cmu.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212100312.13403.apapadop@cmu.edu>
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
To: Alexandros Papadopoulos <apapadop@cmu.edu>
Cc: netfilter@lists.netfilter.org

On Tue, 10 Dec 2002, Alexandros Papadopoulos wrote:

> In any case, the relevant rules from the output chain are:
                   ^^^^^^^^^^^^^^
Isn't there a rule intented for other purposes, which blocks the passive
data channel?

> I'd bet that the problem is that the SYN request sent from the client to
> my server gets dropped, though. Seems like a conntrack/INPUT thing.

I'd setup logging rules to see where and why the connection gets blocked.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


