From: Jon Schipp <jonschipp@gmail.com>
Subject: iptables copy rule similar to PF's dup-to
Date: Fri, 14 Oct 2011 21:46:17 -0400
Message-ID: <20111015014616.GA17750@WordOfMouf>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=date:from:to:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=hQlqD3AFtJeyny1FAGEkIjrdDFtMrSIKzfqTcoiCEp8=;
        b=I8NYeK/ARKToltTNTQRP+sFef7FxqLEhkdTrxnbP+3RbY0O2EXQOUyVsaHEfarRjGh
         e6mxo2IBEgCqiyKjUwdxWJ8g7zh1OZv4uFsGl4uPSNJjkcIXLjQ2/OWs32rusds5dQ1b
         FHoDcgUpw07kHPVBU3lcOtS7W0uGggVTjCJR4=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I was wondering if there's an iptables action/feature to copy traffic and forward it to a network monitoring system. 
Similar to PF's dup-to which duplicates the traffic to a specified machine.

Thanks

Jon
