From: Richard Horton <arimus.uk@gmail.com>
Subject: Re: iptables rule for ovh
Date: Thu, 29 Jul 2010 10:30:50 +0100
Message-ID: <AANLkTimj+TLgiE7GEhAnDRLoqZHzkq7Nuk8aC=+nxg8K@mail.gmail.com>
References: <4C51450F.7070906@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=dqEh8UNjwSWk4W16k54jI5YLu51MNJUG3/JJ9Hn40EE=;
        b=fCYLL2Ejg9744zEmHnvx1d+o39W+dGUIvZXUL1++m4+J2N38NwsMXtIJbBpA1/ESf1
         XKtwVEGA4ANXdthms2CXEk2oNFyQRoA8AR8oE9dq+UV7lwwD0CLho1OOg01Wqcg6SGyP
         1wC0KEvSvIzJ6W5MmTra0MLtpFrecDD0uAnxo=
In-Reply-To: <4C51450F.7070906@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Portedaix <portedaix@gmail.com>
Cc: netfilter@vger.kernel.org

On 29 July 2010 10:08, Portedaix <portedaix@gmail.com> wrote:
>
> Hello,
>
> QUESTION - SHORT VERSION :
> Is there a way to have a rule equivalent to the one below which is fo=
r kernel 2.6.14 and above, =A0with a linux kernel 2.6.9 ?
> '#iptables -A INPUT -p udp -m udp --dport 5060 -m string --string "Ci=
rpack KeepAlive Packet" --algo bm --to 65535 --source sip.ovh.net -j DR=
OP'

Looking on the various asterisk/digium mailing lists etc there are a
number of discussions regarding cirpack - including a number of patchs
for chan_sip.

You might be better off patching chan_sip to handle them rather than di=
scarding.

The other option would be, depending on the headers etc, use something
like the u32 match to discard them.



--
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.pbase.com/arimus - My online photogallery
http://uk.linkedin.com/in/richardhorton1972 - My linkedin profile
http://www.solstans.co.uk/richard - Online CV
