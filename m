From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: multiport needs `-p tcp', `-p udp' - Why?
Date: Sat, 27 Feb 2010 20:36:42 +0530
Message-ID: <cfeab66d1002270706m6228860en5d28a2d60a9b311c@mail.gmail.com>
References: <4B893433.7020401@gatworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=T/lAYYUGvii+v6eJyMn6W5LWo99JFUq0yYWWORt8+nY=;
        b=XXpUuW7VDj2xsiJ1Ye/VtMX30mwtvpkkG0XideYF9dqHbyCSDn5uYRf/PVv2yDEFXB
         /HReO3HD/nQWj4KuzicsMDwSWlysH+GWVk/0Hc3qhAY1Auvm3ioed6wFnHe7++xAAYO+
         CXc32RqZCHWaf1GkycIZoP/SamDbNEG0pTjF4=
In-Reply-To: <4B893433.7020401@gatworks.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "U. George" <netbeans@gatworks.com>
Cc: netfilter@vger.kernel.org

Port is in Layer 4 of protocol stack .


On Sat, Feb 27, 2010 at 8:33 PM, U. George <netbeans@gatworks.com> wrot=
e:
> In order to get to the chain, the protocol, as well as the interface =
must
> match. PRE_UDP if already filtered for "-p udp" . So why does multipo=
rt
> require another check for -p udp? Does it really need to have that op=
tion in
> order for it to work?
>
>> + /sbin/iptables -t filter -N PRE_UDP
>> + /sbin/iptables -t filter -A INPUT -i eth1 -p udp -j PRE_UDP
>> + /sbin/iptables -t filter -A PRE_UDP -m multiport --dport
>> 137,138,139,512,514,515,1433,1434 -j DROP
>> iptables v1.4.5: multiport needs `-p tcp', `-p udp', `-p udplite', `=
-p
>> sctp' or `-p dccp'
>> Try `iptables -h' or 'iptables --help' for more information.
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
