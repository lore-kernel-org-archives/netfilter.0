From: Mike Williams <dmikewilliams@gmail.com>
Subject: Re: Forwarding packets over the same LAN
Date: Wed, 15 Jul 2009 16:12:49 -0400
Message-ID: <cfb4555b0907151312w371c0aa3j7fc5db21d301a38a@mail.gmail.com>
References: <1247493655.2316.104.camel@TestField.intranet.bem.md>
	 <1247494451.25529.52.camel@enterprise.ims-firmen.de>
	 <1247558286.7214.16.camel@TestField.intranet.bem.md>
	 <1247585686.1173.7.camel@enterprise.ims-firmen.de>
	 <e1ba8dde0907141201i5647546r78c2a66e24cad18f@mail.gmail.com>
	 <4A5D8626.6060002@plouf.fr.eu.org>
	 <1247643654.11785.6.camel@TestField.intranet.bem.md>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=87K9C18a7gzuoQ1C0aUMhcr3Jnca/3PQnvwnt7Z2MLA=;
        b=aArZwbPu6TteHEx6gD91icQd0BfBsFic6cGBxlmScwcQ2v1hkKY5GhClXGmLKQONm4
         ZfGwHdzKUgY9g4r8CZfl0qzWFm2zV8r/fUr5S+nAzTjjnixpXQTfBa7V+m1NS2VRUnvU
         02imyBmZLgknxUvIhx9KlIMm8ZxVclBdMeGR4=
In-Reply-To: <1247643654.11785.6.camel@TestField.intranet.bem.md>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wed, Jul 15, 2009 at 3:40 AM, Simion Onea<simionea@gmail.com> wrote:
> I finally managed to set it up correctly. The problem was with another
> rule blocking traffic to port 25.
>

Simon,

Hi there.  Would you mind posting the output of iptables-save?  After
reading about your battle with this it would be nice to see the
complete set of working rules.  Also, having the final solution in the
archives may help someone else.

Thanks,

Mike
