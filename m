From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: h323 ALG .
Date: Tue, 22 Jun 2010 14:42:17 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1006221435590.2393@blackhole.kfki.hu>
References: <AANLkTilxYbk1LBMGelD3NAzSeUXmKm_oWmepxVL8M9Hb@mail.gmail.com> <alpine.DEB.2.00.1006221348240.2393@blackhole.kfki.hu> <AANLkTikkysjYCFbZAsmnCDSX6ExiAGaQPue--XtGws4r@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikkysjYCFbZAsmnCDSX6ExiAGaQPue--XtGws4r@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

On Tue, 22 Jun 2010, ratheesh k wrote:

> On Tue, Jun 22, 2010 at 5:21 PM, Jozsef Kadlecsik
> <kadlec@blackhole.kfki.hu> wrote:
> >> 1.  ALG will allow wan to lan calls ? No need for specific iptables
> >> forwarding rule if alg is needed ?
> >
> > Yes. That's the point for a helper.
> 
> I thought , ALG  will install related connection tuple , if a
> connection is thru .
> what i meant is : suppose a  ftp connection ( active ) is tried to
> make from lan-to-wan side ( it will go thru as per iptables ) . 

No, active/passive FTP connections are not "tried". The corresponding FTP 
command is issued in the command channel and that is interpreted by the 
FTP helper. Which then add a connection expectation to conntrack - and 
which you allow through by the "-m state --state RELATED -j ACCEPT" rule. 
The same happens with H.323.

> Since  here  the  pkt is  from wan-to-lan   and is  blocked by
> iptables  . How ALG got triggered without any pkt flow ?

You allow clients on the LAN to connect outside and enable bidirectional 
connections. After that any side of the connection can issue correct H.323 
protocol commands and trigger expectations in any direction.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
