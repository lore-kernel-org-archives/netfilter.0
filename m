From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: h323 ALG .
Date: Tue, 22 Jun 2010 18:04:44 +0530
Message-ID: <AANLkTikkysjYCFbZAsmnCDSX6ExiAGaQPue--XtGws4r@mail.gmail.com>
References: <AANLkTilxYbk1LBMGelD3NAzSeUXmKm_oWmepxVL8M9Hb@mail.gmail.com>
	<alpine.DEB.2.00.1006221348240.2393@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=/N1nDuqkcAlzwj289ly3SThItNrIglDBQSYJKDtBpN4=;
        b=M9Uo8CnAKYMQz1f+b6bPbTD5+wgpufsojsEgOAKCoFu1uJvcAFle49paiT4FA0mLYO
         CDg1lOWUgstOYGVyUCefWFqF8ll6S62Nlf29UuUjHOwuZmF9cF6Ie9PpfTsG2flJCy+H
         Vk+QFhz5EJi8KpYmQuddt2lN5ilOGHtueGsbE=
In-Reply-To: <alpine.DEB.2.00.1006221348240.2393@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

On Tue, Jun 22, 2010 at 5:21 PM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
>> 1.  ALG will allow wan to lan calls ? No need for specific iptables
>> forwarding rule if alg is needed ?
>
> Yes. That's the point for a helper.

I thought , ALG  will install related connection tuple , if a
connection is thru .
what i meant is : suppose a  ftp connection ( active ) is tried to
make from lan-to-wan side ( it will go thru as per iptables ) . When
this hit ip_conntrack_confirm at POSTROTUING chain will install the
tuple for expected connection .  Once pkt comes from wan side , it
will be a related connection and accepted .

Since  here  the  pkt is  from wan-to-lan   and is  blocked by
iptables  . How ALG got triggered without any pkt flow ?


Thanks,
Ratheesh


On Tue, Jun 22, 2010 at 5:21 PM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Tue, 22 Jun 2010, ratheesh k wrote:
>
>> I have following RULES .
>>
>> iptables =A0-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>> iptables =A0-A INPUT -i lan0 =A0-j ACCEPT
>> iptables =A0-A INPUT -j DROP
>>
>> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>> iptables -A FORWARD -i lan0 =A0-o wan0 =A0-j ACCEPT
>> iptabkes -A FORWARD -j DROP
>>
>> iptables -A OUTPUT -j ACCEPT
>>
>> But I am able to make H323 calls from lan to wan =A0& =A0wan =A0to l=
an =A0.
>>
>> 1. =A0ALG will allow wan to lan calls ? No need for specific iptable=
s
>> forwarding rule if alg is needed ?
>
> Yes. That's the point for a helper.
>
>> 2. =A0Is there any way in H323 to have calls without support of ALG =
(
>> like passive ftp ? )
>
> No.
>
> But you can setup a H.323 gatekeeper in proxy mode and then configure
> it to force the clients into given port ranges.
>
> Best regards,
> Jozsef
> -
> E-mail =A0: kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
> =A0 =A0 =A0 =A0 =A0H-1525 Budapest 114, POB. 49, Hungary
>
