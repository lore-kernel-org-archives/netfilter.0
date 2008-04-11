From: "Marc McNeil" <mawcmcneil@gmail.com>
Subject: Using netfilter to write an intermediate network driver
Date: Fri, 11 Apr 2008 11:01:49 -0400
Message-ID: <c27af5010804110801s1bace53dta839da389e074506@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=Ovh6z5MUtqUz2F4+BsJYf5ju31N6Jl9pyGQH4+nlLu4=;
        b=POuCrQWhTU0eezIEfyjUOgkOgxut4CAxsClmfxm7MtOPOeYcgswIAZrzjf+IiKpw/vDU67CGzlo6asyWB/m6HI7nNo6l1b86WNSpYIZcv5qyG3MmAQVGO3Fdw7Nip3DNMwVmxckyeKQPyGsisA3xLv8VCjxj2E8jtzDziVh+wK8=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am new to this listserver and netfilter so my apologies for stupid questions.

I am porting a driver from Windows to Linux. The driver adds a
security layer just above the adapter driver and below all other
layers such as TCP/IP etc. The driver has the need intercept packets,
create new packets, and forward those new packets to the layer above
and back down through another adapter (acting as a bridge). From what
I have been reading, netfilter supplies hooks that look promising.
Does anyone know if netfilter supplies enough functionality for this
scenario?
