From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: multiport needs `-p tcp', `-p udp' - Why?
Date: Sat, 27 Feb 2010 22:16:55 +0530
Message-ID: <cfeab66d1002270846q65493ac2y57ef59ca1eb2c650@mail.gmail.com>
References: <4B893433.7020401@gatworks.com>
	 <cfeab66d1002270706m6228860en5d28a2d60a9b311c@mail.gmail.com>
	 <4B894581.10700@gatworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=gXGwrb5oEKOxOkq3MPPw0GgbR/j6+GAN+S13Q7uGfms=;
        b=VBEh6L9bL5VGnQwHaxlvPPkPACj3aqJSrlqXOSK8NafPQqvUM/5JQQRVavYKxs8/58
         sebdMNq3Jy0PPkS8Gi9sY+EXoReLsOKGI1CqBONqjH51xu2MJcgSN8Vf3MDoYmge3Gl/
         BP0tiIOD9MhsLyi3RFH8/w1ENzvwSBlkUVQ4s=
In-Reply-To: <4B894581.10700@gatworks.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "U. George" <netbeans@gatworks.com>
Cc: netfilter@vger.kernel.org

port offset may be differ  based on which layer 4 protocol , you are
using . If u dont specify protocol ( layer 4 ) , netfilter dont know
this .


Please find below some code sinppet from  xt_multiport.c .


113  pptr =3D skb_header_pointer(skb, protoff, sizeof(_ports), _ports);
114         if (pptr =3D=3D NULL) {
115                 /* We've been asked to examine this packet, and we
116                  * can't.  Hence, no choice but to drop.
117                  */
118                 duprintf("xt_multiport: Dropping evil offset=3D0
tinygram.\n");
119                 *hotdrop =3D 1;
120                 return 0;
121         }
122
123         return ports_match(multiinfo->ports,
124                            multiinfo->flags, multiinfo->count,
125                            ntohs(pptr[0]), ntohs(pptr[1]));

thanks,
Ratheesh



On Sat, Feb 27, 2010 at 9:47 PM, U. George <netbeans@gatworks.com> wrot=
e:
> U'll have to let me know why "-p udp" is needed when the chain can on=
ly have
> udp packets, and therefor can only process udp packets.
>
> I dont want to test over (( and over ) and over ) again when I know t=
hat the
> packet is already KNOWN to be from eth1 and of protocol UDP.
>
> adding "-p UDP" to multiport does make iptables happy, but appears to=
 be a
> useless test.
>
> On 02/27/2010 10:06 AM, ratheesh k wrote:
>>
>> Port is in Layer 4 of protocol stack .
>>
>>
>> On Sat, Feb 27, 2010 at 8:33 PM, U. George<netbeans@gatworks.com> =A0=
wrote:
>>>
>>> In order to get to the chain, the protocol, as well as the interfac=
e must
>>> match. PRE_UDP if already filtered for "-p udp" . So why does multi=
port
>>> require another check for -p udp? Does it really need to have that =
option
>>> in
>>> order for it to work?
>>>
>>>> + /sbin/iptables -t filter -N PRE_UDP
>>>> + /sbin/iptables -t filter -A INPUT -i eth1 -p udp -j PRE_UDP
>>>> + /sbin/iptables -t filter -A PRE_UDP -m multiport --dport
>>>> 137,138,139,512,514,515,1433,1434 -j DROP
>>>> iptables v1.4.5: multiport needs `-p tcp', `-p udp', `-p udplite',=
 `-p
>>>> sctp' or `-p dccp'
>>>> Try `iptables -h' or 'iptables --help' for more information.
>>>
>>>
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
