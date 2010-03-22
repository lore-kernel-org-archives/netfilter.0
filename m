From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: Nat and firewall holes
Date: Mon, 22 Mar 2010 23:13:37 +0530
Message-ID: <cfeab66d1003221043g2057a7d3n4a6affac6429a323@mail.gmail.com>
References: <cfeab66d1003220846h20c255d4u280ada41d2df1a2b@mail.gmail.com>
	 <4BA7A4F9.6020001@plouf.fr.eu.org>
	 <cfeab66d1003221027v65611783vf342e3038744a0f6@mail.gmail.com>
	 <4BA7AB63.6090908@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=fRehdhFDmGHTl0mcI38oHh+tE88CYu0GSUBIInjV2c4=;
        b=BoKkb4Y8inMVLhKHO31pbAj4r/srmmxImXSdbhmIi9OFbtAKirQ+EOheINoTLH/cGn
         PGauxeElXJ3fJM5ORoYsmJ4clzsStJLo+uCt57f6ABmEhaql7UXLzHzvWQNdl9PlYxzf
         Gz42+X6amRtFtYKkmjDxfO5MLmqHyCxOzaVio=
In-Reply-To: <4BA7AB63.6090908@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

>>> On Mon, Mar 22, 2010 at 10:42 PM, Pascal Hambourg <pascal.mail@plou=
f.fr.eu.org> wrote
> Window and sequence number tracking has been included in TCP connecti=
on
> tracking since kernel 2.6.9, making out-of-window segments INVALID.

Beautiful ...
So this packet will be rejected by
iptables -A FORWARD -m state --state INVALID -j DROP  rule ??



Thanks,
RAtheesh

On Mon, Mar 22, 2010 at 11:09 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> ratheesh k a =E9crit :
>>> On Mon, Mar 22, 2010 at 10:42 PM, Pascal Hambourg <pascal.mail@plou=
f.fr.eu.org> wrote:
>>> If a crafted packet matches all the characteristics of the conntrac=
k
>>> entry for that connection (including reply source port 80, TCP sequ=
ence
>>> number), then it will be considered belonging to the reply directio=
n of
>>> that connection and the NAT will process it accordingly.
>>
>> i thought , =A0only a tuple of ip and port is kept for connection
>> tracking ( not tcp sequence ) =A0.
>
> Window and sequence number tracking has been included in TCP connecti=
on
> tracking since kernel 2.6.9, making out-of-window segments INVALID.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
