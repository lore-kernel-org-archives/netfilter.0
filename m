From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: h323 ALG .
Date: Tue, 22 Jun 2010 15:00:21 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1006221449380.2393@blackhole.kfki.hu>
References: <AANLkTilxYbk1LBMGelD3NAzSeUXmKm_oWmepxVL8M9Hb@mail.gmail.com> <alpine.DEB.2.00.1006221348240.2393@blackhole.kfki.hu> <AANLkTikkysjYCFbZAsmnCDSX6ExiAGaQPue--XtGws4r@mail.gmail.com> <alpine.DEB.2.00.1006221435590.2393@blackhole.kfki.hu>
 <AANLkTimByxaiayUJc6JxD04N91-I2rU1f7p_Dko-v9QN@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimByxaiayUJc6JxD04N91-I2rU1f7p_Dko-v9QN@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

On Tue, 22 Jun 2010, ratheesh k wrote:

> >> On Tue, Jun 22, 2010 at 5:21 PM, Jozsef Kadlecsik
> >> <kadlec@blackhole.kfki.hu> wrote:
> > You allow clients on the LAN to connect outside and enable bidirectional
> > connections. After that any side of the connection can issue correct H.323
> > protocol commands and trigger expectations in any direction.
> 
> Could you please explain in detail  ?   How tcp+syn packets comes from
> wan side and hit ip_conntrack_in ()  ?

You have got these rules:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i lan0  -o wan0  -j ACCEPT
iptables -A FORWARD -j DROP

which I break up into the following ones:

1. iptables -A FORWARD -m state --state ESTABLISHED -j ACCEPT
2. iptables -A FORWARD -m state --state RELATED -j ACCEPT
3. iptables -A FORWARD -i lan0  -o wan0  -j ACCEPT
4. iptables -A FORWARD -j DROP

plus an application helper loaded in, in this example FTP:

- your client send a SYN packet to an FTP server: allowed by rule 3.
- server answers: allowed by rule 1.
- client-server connection goes on: allowed by rule 1.
- client wants to initiate an active FTP connection: allowed by rule 1
	- and intercepted by the FTP helper, which creates an expectation:
	  connection initiated from the server to the client
- server sends the SYN packet of the active connection (from wan to lan): 
  allowed by rule 2.
- client answers it: allowed by rule 1.
- ...

Technically the same happens with H.323, except that that is a more 
complex protocol.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
