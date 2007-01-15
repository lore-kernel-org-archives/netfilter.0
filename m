From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: tcp conn tracking
Date: Mon, 15 Jan 2007 19:42:31 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0701151926260.9996@blackhole.kfki.hu>
References: <33219704.200191168881881760.JavaMail.root@smtp1.mistletoetech.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <33219704.200191168881881760.JavaMail.root@smtp1.mistletoetech.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Anil Gunturu <anil@mistletoetech.com>
Cc: netfilter@lists.netfilter.org

On Mon, 15 Jan 2007, Anil Gunturu wrote:

> OK. Does the same thing apply to ftp when NAT is involved? If the port 
> command comes fragmented and out-of-order, and the conntrack module 
> doesn't reassemble the packets, the "inside" ip address goes out 
> untranslated. Is this considered a security breach.

[Please do not top-post. Thanks.]

NAT is built on top of conntrack. So fragmented packets get defragmented 
before processing but out of order packets are not reordered by netfilter.

A deliberate attacker can force to break up PORT commands and PASV 
responses to be carried in multiple non-fragmented packets and those then 
"slip through" without NATing. However what can be gained by this? 
Conntrack cannot detect the IP address/port so the data channel won't be 
"opened up" by conntrack. The attacker can discover the real IP address of 
the other side, that's all. NAT is not meant to be a security solution.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
           H-1525 Budapest 114, POB. 49, Hungary

