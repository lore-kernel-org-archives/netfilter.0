From: Kfir Lavi <lavi.kfir@gmail.com>
Subject: Verdict with ebtables?
Date: Tue, 9 Nov 2010 20:30:10 +0200
Message-ID: <AANLkTikpfZCpcTqWAo5ONO6dJvFfruEJXCbam4EbPVdT@mail.gmail.com>
References: <AANLkTinCazaFKSXnfGe2e0nnfeRorV7AHcadQaxGvWg+@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type;
        bh=yGvAbBmr6xQKSleQ2tAhSKzMXqfZ+kkWfI+icnpmFiw=;
        b=OpfBvN+7kF2Jt5kzzL9qGFa4GXI+yh4JbYAhSaG6uNtV8OWaDKEcxu6NTbGgc69EVW
         E63Em63sWFo+PAJSDjBxj0t/XrLhs1KrQepVtB1FGTzLDO7kNYXo9hc/iJE/12elLecp
         NEy6/UtwBRNe2bHGIpuxl5XA1HWPZ+O+O8McE=
In-Reply-To: <AANLkTinCazaFKSXnfGe2e0nnfeRorV7AHcadQaxGvWg+@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
It seems to me that its not possible to do a verdict in userspace of
Ethernet packets, like it is done with nfqueue.
Why it is not implemented? Or, is there a way to do the same for
packets that are not arp or ip?

Thanks,
Kfir
