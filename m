From: "Khoa Nguyen" <khoa.coffee@gmail.com>
Subject: libipq and destination IP address
Date: Tue, 16 Oct 2007 10:44:11 -0400
Message-ID: <3d00e6dc0710160744ia8edebbn8dafb76d709622dc@mail.gmail.com>
References: <mailman.21644.1192545951.25258.netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=OGbK9tNFwr3qAZ43XSXYKXbuYNtRA+PeiInbuB6B6tw=;
        b=OebBnS8QEgERSUkOG1hBQK/9K8J8RdfKbGjpLCmINkcSigkS4HKtWsSem1x4JImx/C9Le80ibwkL5sdqCvL8WIrffYqu5ia8WrubjwRZqsEVWJR8Ui68iK8Zdigfpu/9X69atB7W7SXDCL0KDY4jwcVcZJzlNDc3oJxQ01lf0Xc=
In-Reply-To: <mailman.21644.1192545951.25258.netfilter@lists.netfilter.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I am writing a small libipq program to extract packet info. I "queued"
all packets in the OUTPUT chain. It looks like the packet has the same
source and destination packet ( = host interface address). Why is
that? Is there a way in libipq to extract the REAL destination
address?

Thanks,
Khoa
