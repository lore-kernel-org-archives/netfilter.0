From: Peter Kaagman <prjv.kaagman@gmail.com>
Subject: Re: Ipsec and masquerading
Date: Wed, 31 Mar 2010 11:43:43 +0200
Message-ID: <c59a952f1003310243i1e55eb42ka43447a75db3994c@mail.gmail.com>
References: <c59a952f1003301201o1da401ffsc515d797fe56d3ff@mail.gmail.com>
	 <d7a0cc977a439b55159cb29454ea1c4d@thom.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=y8SBFMfSSK79+SVCEfwFurwzyNkkBGmuMdzHqyD/dkQ=;
        b=otqXc2AUwTXHa5br1BwRSy7yZTvlW/5mj+JVd0QxG7a3IlNSUzIRpgKRy8x3qCGdE5
         CSUmnbDmxOZ4fCg25TEIHTGeqGCAnU8n3tjhyWIyUHlBP2P3tUHoXpMoBXbHAkISMP1t
         0QMuAVPDiLos0aAL0uUyvKZR3D/WqlfsA3MLs=
In-Reply-To: <d7a0cc977a439b55159cb29454ea1c4d@thom.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Fran=E7ois_Legal?= <devel@thom.fr.eu.org>
Cc: netfilter@vger.kernel.org

On Wed, Mar 31, 2010 at 9:29 AM, Fran=E7ois Legal <devel@thom.fr.eu.org=
> wrote:
> That would be in your case something like
> iptables -t nat -A POSTROUTING -d 10.3.0.0/16 -o $ext_if -j ACCEPT

Wow.... virtual kiss for you ;)
Was a bit sceptical to be honest, did test simular rules with no
effect. But it did the trick :D I'm on the road again.

Peter
