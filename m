From: "Yakov Lerner" <iler.ml@gmail.com>
Subject: allowing packets from dynamic-dns IP
Date: Sat, 26 Apr 2008 19:34:53 +0300
Message-ID: <f36b08ee0804260934r3dc8be71hbd453dfc11e377f9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=K5f1bxQS+E0MoMUhGu3O7QG9dLCK4f82JIcmamye9dQ=;
        b=jiiMjks5T/Ft1HRVl61FbJp+ZUSnSfAXBepnSG0g2Lwpq7lpd3a5zgmYg7lj2ChT2UiEVD/atZJAkHZvxgtahp6fQsq91qwiYEW1MvcNpuDjPy1XFim3Q8z3bhOrm9SuRQ1JdetkHKgsx/8y18usVDwg0z/ohyuXVdOUTvmpTzU=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

How can I have a rule that's bound to a semi-dynamic external IP (IP changes
several times a week) that's bound to known fixed domain name (dynamic-dns) ?

Is there better solution than crontab-script, that every 10 minutes
resolves this domain and reinstalls iptables rule if IP changed ?

Thanks
Y.L.
