From: "Amine KERKENI" <amine.kerkeni@gmail.com>
Subject: filtering packet within a L2 brige
Date: Thu, 6 Nov 2008 23:04:09 +0100
Message-ID: <e07111640811061404n7393b58o5a1fa0459e26a142@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=mcw6wDySFZeTbULplDVtMK7PM895fKXw9khD5zXtf2s=;
        b=ID7gLYN9mpk6NK80QjgqGBedRzz4ErhbKlos9j9VXXScpSjx4D7/cEzZ8NYLlVfqpo
         OIqXGtbQE+5/7va4rMu2Y0FbXpbxa7SE7t6pYanIUlf2VmYlbCbaOpmlr9PzPq0YNfSy
         gbSZEramJGcVeNmyMz3jCxkCid/9PVF0lc/ig=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I want to write some code to simulate network disturbance ( some weired
failure law ) with a Linux box playing the role of a network L2 bridge.
However, I don't know if this job can be done using netfilter.

Thank you for your help,
Amine
--
if the only tool you have is a hammer, every problem looks like a nail
