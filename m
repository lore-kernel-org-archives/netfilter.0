From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Subject: Re: Problem with IPv6 tunnel
Date: Thu, 9 Jul 2009 15:06:52 +0200
Message-ID: <9948385e0907090606x1d33d7abw64c38e7ac6238cc3@mail.gmail.com>
References: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com>
	 <9948385e0907090448j566df6cdv961973e398b8b73b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=JiI87I7vzzsFCqrVCP/RLCrVIkIeGKLXtebTxEq2H40=;
        b=hIpIypBXR9xvPZa1EgGw3FXIXFp+JLxPTUu3tpog3ici3DduKskpalqkPPDKySjvq/
         cbQSUbT9lN6FK8OpfBoavXBVFSn/HoeUAQ0YIXFJgNyXCepDwE2KXsjvmG2JHNX1ZRmn
         oA2WNJMliIkQ1kTQkloQHHdzhEAxFZv10dqDo=
In-Reply-To: <9948385e0907090448j566df6cdv961973e398b8b73b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

2009/7/9 David Bala=C5=BEic <xerces9@gmail.com>:
> Hmm, I replaced the rule as suggested, but something still does not
> work correctly.
>
> Any idea ?
> ...
> Maybe add a ACCEPT rule for proto 41 in rule "input_wan" ?

I did exactly that:

iptables -A input_wan --proto 41 -s 3.4.5.6 -j ACCEPT

# 3.4.5.6 is the address of the remote tunnel endpoint host

And now it appears to work.
I reduced the timeout in
/proc/sys/net/ipv4/netfilter/ip_conntrack_generic_timeout to 10 for
testing.
I also removed the "MASQUERADE !ipv6 --  anywhere
anywhere" line and left the original
MASQUERADE rule.

Thus far, it works.

Regards,
David
