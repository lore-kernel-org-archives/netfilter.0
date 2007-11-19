From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Kernel memory consumption
Date: Mon, 19 Nov 2007 14:39:22 -0800
Message-ID: <d95317090711191439i5fbf1b7aycde76a2b1d2fa897@mail.gmail.com>
References: <d95317090711191437v7b24d0fdi5e1af93096677db8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=9TtQsW31c5q7ir8KOmGFYjCVKAqEwVWZzBRCWWeHjQ8=;
        b=Inew5NaMJLZdJ9HjmVJ14hUBvpvd3nmvxyoRXBLZMFAh4AUmZH76GXNFf5bw+3/Dm4ikIACkPFXbkVPxcda3+te2YBx+lHxukuMBZihCa9lUdd34X67YEeC2vioUTcQ9249V684AjvJbF63lhiN3zNMu7dFuzUXDIPuIzdwuTE8=
In-Reply-To: <d95317090711191437v7b24d0fdi5e1af93096677db8@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

How much kernel memory is consumed as a result of a new iptables rule ?
A new chain ?
Any pointers would be appreciated.
