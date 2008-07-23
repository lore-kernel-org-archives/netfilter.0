From: "Curtis Wyatt" <zhackwyatt@gmail.com>
Subject: ip_queue, libnetfilter_queue, and packet alteration
Date: Tue, 22 Jul 2008 17:02:14 -0700
Message-ID: <7915e7b50807221702m752d5b74y9283a28f4b9b1689@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=EO1ybGkCgAW9VdG7dBX54zYcVAwZ/y/5yEpIzvSGego=;
        b=ouqXgKd6Pk/YwyN7D0lS+x2gkP1p9adtPWMiDZJNXdxoTR1LfN+2Wa5hdAZlnIZJV1
         cxjCrsdUKT0ep2SOM/NC1+uJZkLZZZtCdNtu9TfOhBQNMyE5K1m+8Hi0/OfGCLP6nYqb
         8an6PdY7OPfEBaN3EbFrVSxv1fTHK+ZDHey7U=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am using ip_queue.  I understand that is depreciated.

I want to intercept a packet, alter it (change payload and source ip
address and destination ip address) and then do an NF_ACCEPT on it, to
have it continue on its way to another machine.  However it never
shows up at that other machine.  Is there anyway to do this without
doing an NF_DROP and then sending a new packet through?

Will libnetfilter_queue do this for me?  I don't want to move to
libnetfilter_queue because I can't find a redhat rpm and I can't find
hardly any documentation on it.

Thank you for any help.
-----------------------------
Curtis
http://gocalipso.com
