From: "Payam Chychi" <pchychi@gmail.com>
Subject: iptables limit --limit limitations
Date: Sat, 17 May 2008 00:20:43 -0700
Message-ID: <f08c15d10805170020i2ac5a207g969c0ed5bf10867c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=zdDBUxkcCtIEXKh5xsbFX7gSY4q4jrDeRj27VEqWH2I=;
        b=fOL0Tz/0xarnIJC5+lxie3rLSJZ7K791Aamu8EjEBBWgfL82BHYDfXJJOPq6vWBqWALOPqPKHsObLKeo7G32kl2CSyTDZ0QgnYAhITr83AgcS2R/aRedBuSt+1uOc3GCVn8Zky8J2T1/R9I/7y+M44h/nXKB6pA9hhdDqLcBZCE=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

Has anyone experienced any limitations when implementing the "limit
--limit $value/sec"  ? I can only get 1000 packets/sec with a value of
1000 or 10000  with a burst of 5. Ive been able to increase the
packets to almost 7500 packers/sec when using a value of 10000 with a
burst of 20.

Ive also tried increasing the HZ for High res timer on the kernel to
1000 and enabled dynamic ticks (thanks to kuzin)
any thoughts or ideas on this? I would greatly appreciate any feedback...

Thanks,
Payam
