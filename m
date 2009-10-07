From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Correctly classifying iptables NAT beahaviour...
Date: Wed, 7 Oct 2009 12:26:48 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0910071222560.18065@blackhole.kfki.hu>
References: <4ACB3F84.1090107@ideaworkslabs.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ACB3F84.1090107@ideaworkslabs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Toby Bradshaw <Toby.Bradshaw@ideaworkslabs.com>
Cc: netfilter@vger.kernel.org

On Tue, 6 Oct 2009, Toby Bradshaw wrote:

> I notice that the default iptables MASQ and SNAT behaviour appears to be an
> odd hybrid of both port restricted and symmetric NATs. As long as the host
> behind the iptables NAT is the first sender then the external firewall port
> becomes open and packets sent from in reply from the right ip:port will pass
> through the firewall. This is classic port restricted behaviour. However, if a
> packet is sent first from an external host to the ip:port address that would
> have been used by an internal host then when the internal host attempts to
> send to the same external host it's port becomes changed on the way through
> NAT (usually to 1024 in my experience). This is classic symmetric behaviour.

As I wrote at netfilter-devel around May this year,

- According to the terminology of RFC 3489, netfilter implements port 
  restricted cone NAT. If the --random flag is specified to the 
  SNAT/MASQUERADE/... targets, it's better described as a symmetric NAT.
- According to the terminology of RFC 4787 and RFC 5382, netfilter
  implements
  - endpoint-independent mapping. If the --random flag is 
    specified to the SNAT/MASQUERADE/... targets, it's an
    address and port-dependent mapping.
  - address and port-dependent filtering.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
