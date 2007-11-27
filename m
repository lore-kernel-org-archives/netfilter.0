From: Quartexx <quartex73@gmail.com>
Subject: stateful tracking options
Date: Tue, 27 Nov 2007 22:28:25 +0100
Message-ID: <4d7bf97f0711271328r6eb542fcq284443db6bf6efa2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=BijSSLg0uxvOBdxR3Sv25NYngk+uQRkQbOFtjAq9sfc=;
        b=QNZP48XaEb0HzRgu6yJ9pCnaBhAlFFwHBxuKQAfupvFsm6Uu2am2i24etNFNOUiMceifGNObgPH4rHIvXz4hTiMkbDUOYv9ro50CoMA6vImYNsQ1357F9po3ZIRLvDNBjPX1LaDmvpw1dE2YQh1Uu3n5rjVqfV/UpLNWCbZm3u8=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

hi
is possible to use stateful tracking options?
I mean set limits related to filter rules that create state entries;
for example: limit the number of source IP addresses that can
simultaneously create state, or limit the rate of new connections to a
certain amount per time interval.

thanks
