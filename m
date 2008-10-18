From: "Timothy Toole" <ttoole@toole.net>
Subject: Re: MAC Address masking/NAT
Date: Fri, 17 Oct 2008 20:52:28 -0600
Message-ID: <1460c7de0810171952naa78102l79536b3089035944@mail.gmail.com>
References: <1460c7de0810162313t28b5cd7ete6dda27e534ae55d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender
         :to:subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references
         :x-google-sender-auth;
        bh=ML32huWRUkSPj6HwDmFEUuJ+3Ae8az10Jrtgcu2J1TA=;
        b=ckK9m2x+ELX7xiZZ4E2sT4Vg54o9CXlTPRm384ESPGKooD/VjF1DDk1NS/QjSDZQiH
         WxXstQnBzo64M9ZHbZW3J6akP8skGy7OHGFHjdk5SCzIM3OoijxhDRVaaxRqLFtg1gC3
         +JhIzje3W+NYzaHUjnupy2GiaKWvmtF70xSFw=
In-Reply-To: <1460c7de0810162313t28b5cd7ete6dda27e534ae55d@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> You can easily use EBTables to (S)NAT the frames ethernet MAC address.

I've tried the following two rules (independently):
# ebtables -t nat -A POSTROUTING -j snat --to-src 11:11:11:22:22:22 --snat-arp
and
# ebtables -t nat -A POSTROUTING -j snat --to-src 11:11:11:22:22:22
--snat-arp -s 55:44:33:22:11:00

The result is that the traffic destined to Host A has the "new/faked"
MAC address, but the return traffic back to Host B still has the faked
address (and thus is ignored by the host).

Does a corresponding DNAT rule need to be made in the  PREROUTING nat chain?

> If you need more help, just ask.  Though the EBTables mailing list might
> be a more appropriate and better place to get more help.

Whoops. The ebtables project page states to post questions to the
netfilter list (http://ebtables.sourceforge.net/contact.html)

Thanks again.

-tim
