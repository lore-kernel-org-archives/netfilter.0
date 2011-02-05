From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: shaping vlans - revisited
Date: Sat, 5 Feb 2011 12:42:35 -0200
Message-ID: <20110205124235.31bcd26e@babalu.inexo.com.br>
References: <20110203152944.635b42e8@pulsar.inexo.com.br>
	<1296759048.7587.3.camel@andybev>
	<20110203180118.62970fb1@pulsar.inexo.com.br>
	<1296788356.7587.70.camel@andybev>
	<20110204120533.7f470bab@pulsar.inexo.com.br>
	<1296829445.1634.1.camel@andybev>
	<20110204142417.30dbe5fa@pulsar.inexo.com.br>
	<20110205134621.44b63335@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110205134621.44b63335@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

On Sat, 5 Feb 2011 13:46:21 +0100
Marek Kierdelewicz <marek@piasta.pl> wrote:

Hi Marek

I thing we will only change the place of the problem. It will move from
eth to ifb.

As stated by Grant Taylor in another post, the problem is my filters are
not redirecting packet to the flowids because "protocol ip" leads to
false. This should be someting like "protocol ieee802.1q".

I could not find such protocol parameter (or something that replaces it)
and tc filter demands a "protocol foo" I think due to my u32 classifiers.

Regards

Ethy




> Hi,
> 
> >IFB?? 
> >
> >it may be a good way out.
> >Do you know any discussion list or forum for it? 
> >I just read a few sites and have some questions.
> 
> You could do it this way:
> 
> 1) make sure ifb is modprobed and interface ifb0 is up
> 
> 2) redirect outgoing traffic on each vlan interface to ifb0
> 
> tc qdisc add dev $DEV root handle 1: htb default 1
> tc class add dev $DEV parent 1: classid 1:1 htb rate 100mbit
> rc filter add dev $DEV protocol ip parent 1: prio 4 u32 \
>   match ip dst 0.0.0.0/0 flowid :1 \
>   action mirred egress redirect dev ifb0
> 
> ... where $DEV is vlanX, vlanY ...
> 
> 3) Add shaping on ifb0 just like you did earlier on eth1.
> 
> Best regards,
> Marek Kierdelewicz


-- 

Ethy H. Brito         /"\
InterNexo Ltda.       \ /  CAMPANHA DA FITA ASCII - CONTRA MAIL HTML
+55 (12) 3797-6860     X   ASCII RIBBON CAMPAIGN - AGAINST HTML MAIL
S.J.Campos - Brasil   / \
 
PGP key: http://www.inexo.com.br/~ethy/0xC3F222A0.asc
