From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: GRE protocol .
Date: Wed, 5 May 2010 23:54:22 +0530
Message-ID: <AANLkTimp13f0iEwb9QAg0CTGu5cQGMN8wsrGneEcFtD9@mail.gmail.com>
References: <1291704212-1272660052-cardhu_decombobulator_blackberry.rim.net-422468553-@bda240.bisx.produk.on.blackberry>
	 <AANLkTimBkNBrvVM7H5_W3fFy4X48sUK6aDQzY_0JyX0X@mail.gmail.com>
	 <w2tedd0054b1005010209g74470681vc4bb4895b2a60ef7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=SUDg2R/M11KXAUKnU2E5iQwwXmLpcyaMifs/ESZd2L4=;
        b=bmdMU9NGf1guJ8YTeDhl48Bo3bBIm6188KGtQK7J9JnQoKalADVXqNf2srNSAHT+cD
         CWLRldc6khIspg6qXqLa40VE8fWedZdyB9zjJGz2u4diCCUVUh04h4F205ObTMQsGdjM
         bfGKCCparqX9tjwexl5tUb+hNUTS/+m7p2/zA=
In-Reply-To: <w2tedd0054b1005010209g74470681vc4bb4895b2a60ef7@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: valerio balbi <valerio.balbi@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, May 1, 2010 at 2:39 PM, valerio balbi <valerio.balbi@gmail.com>=
 wrote:
> On Sat, May 1, 2010 at 6:54 AM, ratheesh k <ratheesh.ksz@gmail.com> w=
rote:
>> On Sat, May 1, 2010 at 2:11 AM, =A0<valerio.balbi@gmail.com> wrote:
>>> It's not clea r (sorry).
>>
>> iptable rules configured in my gateway machine ( which act as a rout=
er
>> ) =A0has no rule to allow GRE packet coming from wan side to pass th=
ru .
>> There is no ALGs loaded . Still i am able to establish a pptp
>> connection . I can see GRE packet reached client machine using a
>> wireshark .
>>
>
>
> if the problem where in my lan I will probably proceed in this way
> trying to isolate the fenomena:
>
> check the global policy of my FORWARD chain implementing DROP default
>
> creation of a new chain:
> /sbin/iptables -N pptp
> /sbin/iptables -A pptp -p tcp --destination-port 1723 --dst
> $SERVERPPTP -j ACCEPT
> /sbin/iptables -A pptp -p 47 --dst $SERVERPPTP -j ACCEPT
>
> plug of the new chain into FORWARD one like first:
> /sbin/iptables -I FORWARD 0 =A0-j pptp
>
> repeat the same for nat PREROUTING
> /sbin/iptables -t nat -N pptp
> /sbin/iptables -t na t -A pptp -p tcp --dport 1723 -j DNAT --to $SERV=
ERPPTP:1723
> /sbin/iptables -t nat -A pptp -p 47 -j DNAT --to $SERVERPPTP
> /sbin/iptables -t nat -A PREROUTING -j pptp
>
>
> this way you can control if the new rules were matched or not
> if where matched you can stop the connection
> if not I will gather more information from my network topology lookin=
g
> for an alternate router machine.
>
> I hope this will help you
> bye
>

pptp pass thru works because gre connection tracking  module was built
as part of kernel in my linux machine . I thought pptp_connection
tracking module is the ALG for pptp connection . But without
pptp_connection tracking also , pptp pass thru works fine .

Then  , why we need pptp_connection_tracking  module ?

Thanks,
Ratheesh
