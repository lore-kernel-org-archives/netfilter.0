From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: sync flood and resource utilization .
Date: Sat, 27 Feb 2010 11:05:14 +0530
Message-ID: <cfeab66d1002262135x419e1009w8358c8c7f4def7cf@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=q8vg455XciPpbbFIw/Zij/6br3jvr5skOdHKQW3Z1xk=;
        b=CehUDz8TGUjdSVGj3A/1+GWFaKnKsvBlDy55nq05L3IKb1BPxy6yMCsJD/T36J6Kst
         JJ4ZMog0q2vdcznYhDaAGKvx3RhmTB8HU+00CzNvr5LsEpjkpTy95KsNOP8HIiFdF8n9
         XlWBpEELsGVZd8bYbr3lPWix61m6bAag+dtf4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

iptables -A INPUT -j  DROP .
iptables -A OUTPUT -j ACCEPT

When i syn flooded my desktop . I can see all pkts are getting
rejected by the rule . But system becomes slow beacuse of this . Is
there any way to make system fast ? will black listing will help ?


Thanks,
Ratheesh
