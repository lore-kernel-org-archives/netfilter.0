From: "Art History" <foobear.cf@gmail.com>
Subject: sar interface stats
Date: Fri, 12 Sep 2008 12:56:05 -0600
Message-ID: <14ab6e880809121156pc96d230p38a620590241e22a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=17SFMk3XA9FbyHPZ+29OREcWgQbDatpKlUBiu1tTiFE=;
        b=eoV1tb4+gt3TBdgk3cg/+MItvQlIC8pai8RrDF46YsDYcsn/mTRtLymZ0PcZHp6Mau
         CJNMlochu3ZxEc26SUfOuQtZPxnfRgBOWU4+eZc1ESzrVOSxrlEOrad+5RWdRkRTlKNz
         giKgX0XKbZ2mK/sV0dukoo1eFBnMUc/xasBUE=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On a RHEL5.x86_64 firewall system (one interface internet-exposed, the
other on intranet), totals for received bytes/sec and transmitted
bytes/sec, as reported by 'sar -n DEV', are always nearly equal for
both interfaces.  This despite the fact that for sure the external
interface is kept very busy dropping the usual internet cruft.  Do
interface 'received' statistics as maintained by the kernel NOT
reflect traffic that is DENYed/DROPed/REJECTed by netfilter (iptables)
rules, and why not?    Or if it's not the case that the dropped
traffic isn't counted, why the near equality for total traffic on both
interfaces? If traffic that is REJECTed is not counted in the received
counts, are the resets or icmp unreachables also not counted in the
transmitted counts?

thanks.
