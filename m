From: nima chavooshi <nima0102@gmail.com>
Subject: Iptables NAT POOL
Date: Thu, 23 Jun 2011 23:31:39 +0430
Message-ID: <BANLkTi=Mrtp_T27jqMyu3CTp3ohzaiaiCA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=Nit1tH6eTAMCapIO+LwHw6Uj90pVeNZM4kNpLFgssSc=;
        b=D2Prbb296CQuYVc2ujda28E7J4fhxzrI3k8EO7q7gbG8+JGMWvJEkApJoZTeBU1orJ
         pyKf+Vb1QPMvRhHRtilh62UAYVfWvSHQ3avWPkqNaEfLqY8I5hY4LU3/73pDL+5o4iDf
         dAMpeQCcOkqU/G4PnWxnKvXIrRX+Fs7Eota74=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi
In our company, we have got one range IP public from our Internet
provider. so I want to assign this range to our users.this range is
128 bit.
Bu my concern is:
1- Do I have to set all IP public on output interfaces? Or iptables
automatically adds all IP's on output interface?
2- Or maybe it is not necessary to add all IP's on related
interface,if so , How does iptables do nat pool without adding IP's to
related interface?

Thanks for any help or guidance


-- 
N.Chavoshi
