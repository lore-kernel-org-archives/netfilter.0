From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: h323 ALG .
Date: Tue, 22 Jun 2010 18:42:43 +0530
Message-ID: <AANLkTimfiiRfsPtOO0va7Q_1xoJsfCBSCUCVCadv-myx@mail.gmail.com>
References: <AANLkTilxYbk1LBMGelD3NAzSeUXmKm_oWmepxVL8M9Hb@mail.gmail.com>
	<alpine.DEB.2.00.1006221348240.2393@blackhole.kfki.hu>
	<AANLkTikkysjYCFbZAsmnCDSX6ExiAGaQPue--XtGws4r@mail.gmail.com>
	<alpine.DEB.2.00.1006221435590.2393@blackhole.kfki.hu>
	<AANLkTimByxaiayUJc6JxD04N91-I2rU1f7p_Dko-v9QN@mail.gmail.com>
	<alpine.DEB.2.00.1006221449380.2393@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=ZK9rYU3HJZaBdWc6LTdiqfAVICnUypxutXIi3wmIMcY=;
        b=PqbTIDml+MPFk+f+nGt3EULIUviO/8CHvNnp6u3YIhXj2BJ8hu49z/+kj5BhaD4CC3
         zsI/Rqu50/IpyKK41DqIzGps/1zdCyEvV54MRuivMYJxfvnSorCairxwO/8TjWoqZ8Fw
         dWRNgC6wfZR22zF2KBnCzyujAdyaJCpZZe9rY=
In-Reply-To: <alpine.DEB.2.00.1006221449380.2393@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

On Tue, Jun 22, 2010 at 6:30 PM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
>
> Technically the same happens with H.323, except that that is a more
> complex protocol.
>

This is perfectly fine . Suppose  ftp client is  on wan side and want
to establish a connection to a server sitting on lan side . what will
happen ? . This is my question . Will this work in case of H323 ?

Thanks,
ratheesh



On Tue, Jun 22, 2010 at 6:30 PM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Tue, 22 Jun 2010, ratheesh k wrote:
>
>> >> On Tue, Jun 22, 2010 at 5:21 PM, Jozsef Kadlecsik
>> >> <kadlec@blackhole.kfki.hu> wrote:
>> > You allow clients on the LAN to connect outside and enable bidirec=
tional
>> > connections. After that any side of the connection can issue corre=
ct H.323
>> > protocol commands and trigger expectations in any direction.
>>
>> Could you please explain in detail =A0? =A0 How tcp+syn packets come=
s from
>> wan side and hit ip_conntrack_in () =A0?
>
> You have got these rules:
>
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i lan0 =A0-o wan0 =A0-j ACCEPT
> iptables -A FORWARD -j DROP
>
> which I break up into the following ones:
>
> 1. iptables -A FORWARD -m state --state ESTABLISHED -j ACCEPT
> 2. iptables -A FORWARD -m state --state RELATED -j ACCEPT
> 3. iptables -A FORWARD -i lan0 =A0-o wan0 =A0-j ACCEPT
> 4. iptables -A FORWARD -j DROP
>
> plus an application helper loaded in, in this example FTP:
>
> - your client send a SYN packet to an FTP server: allowed by rule 3.
> - server answers: allowed by rule 1.
> - client-server connection goes on: allowed by rule 1.
> - client wants to initiate an active FTP connection: allowed by rule =
1
> =A0 =A0 =A0 =A0- and intercepted by the FTP helper, which creates an =
expectation:
> =A0 =A0 =A0 =A0 =A0connection initiated from the server to the client
> - server sends the SYN packet of the active connection (from wan to l=
an):
> =A0allowed by rule 2.
> - client answers it: allowed by rule 1.
> - ...
>
> Technically the same happens with H.323, except that that is a more
> complex protocol.
>
> Best regards,
> Jozsef
> -
> E-mail =A0: kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
> =A0 =A0 =A0 =A0 =A0H-1525 Budapest 114, POB. 49, Hungary
>
