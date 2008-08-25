From: "Jose Ildefonso Camargo Tolosa" <ildefonso.camargo@gmail.com>
Subject: Question about packet flow picture.
Date: Tue, 26 Aug 2008 19:11:50 +1930
Message-ID: <4c4b58e80808251641ge01d7e4pca4fff19e8621d8a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=kRPAmqyfKaX2gyqYd3ZPRUco7oFjv5r9RRlYEFN0yNs=;
        b=NHZFzVyelCS95g+qgT4ijkc7OORMQv7WMu1eDAdh1SsNNBrnzU5u/PNaGcTYAu8x9T
         x099ZfvtvFaTTJzyiJkba6AHp1htSY9Wlumi/3pngJ9v6QnPGNtua6wwQbuC9iJNzjf1
         gL9x7mZ1INVsmbvW1P6SgiSgU5fFnKugwxbX0=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi everybody!

I have been using for quite a while this picture (
http://ebtables.sourceforge.net/br_fw_ia/PacketFlow.png ) as a
reference for understanding/teaching iptables packet flow, I know it
is still valid, but I don't know how accurate is it, I mean, there has
been changes to the netfilter code since the time that picture was
made, the first thing you can see is that, there is no raw table
there.

Yes, I know, that's from ebtables site, but It also includes netfilter tables.

Can anybody take a look at it and evaluate whether or not it is still accurate?

Thanks in advance,

Ildefonso Camargo
