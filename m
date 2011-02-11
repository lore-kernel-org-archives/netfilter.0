From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Question on raw table and match state
Date: Fri, 11 Feb 2011 09:15:19 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1102110913530.16335@blackhole.kfki.hu>
References: <AANLkTin7iGxO6rS4XiziUVWJt-4cfH8-h4-cg3354-2C@mail.gmail.com> <AANLkTi=HmeFD06=BXZ2wL1BeK_UgR=3_RuJ9_asjPP9K@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=HmeFD06=BXZ2wL1BeK_UgR=3_RuJ9_asjPP9K@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pandu Poluan <pandu@poluan.info>
Cc: netfilter@vger.kernel.org

On Fri, 11 Feb 2011, Pandu Poluan wrote:

> On Fri, Feb 11, 2011 at 14:46, Pandu Poluan <pandu@poluan.info> wrote:
> > I am wondering if the following rule will work:
> >
> > iptables -t raw -A PREROUTING -p icmp -m state --state
> > RELATED,ESTABLISHED -j ACCEPT
> 
> Okay, to answer my own question: It won't work.

Yes, and that's just OK: in the raw table the state of the packets are not 
known yet.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
