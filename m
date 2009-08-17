From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: qos and iptables
Date: Mon, 17 Aug 2009 18:21:54 +0100
Message-ID: <56378e320908171021n7e6cf97g5db5d4ba41a7b11a@mail.gmail.com>
References: <cfeab66d0908170909s7e223506g891bb405dd313343@mail.gmail.com>
	 <cfeab66d0908170945p66fdd4a1x3c959b81b67027a8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=HGul4SsAxn7GxLBWSGBLu9jyQ1Z9A3YrT3hc7PO8mn0=;
        b=O0Ppx+6DEBW+UuCdpNPIMWYKAnIREYt9SUjVt2qGkSJCKbrxTGcKukmM71dJYII2Ug
         s1oUhOBQN81HiD8oj0Al6GqJsTbU67bzXcLYo7qJmQ6yU8x7iiEhmNLTTQO1gtj9qcIK
         3d3Qvvh1xde50BnsnfeV2YSx6cKzYxukU/sN4=
In-Reply-To: <cfeab66d0908170945p66fdd4a1x3c959b81b67027a8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

As far as I know it depends.

If you use the ingress filter to apply QoS then it will be applied on
eth0 before the prerouting chain on that interface (I think, this is
good for me though ... hopefully someone will confirm whether I'm
right or talking out my backside ;) )

If you apply the QoS policy on the output side of eth1 then it will be
applied last of all immediately prior to packets being dequeued to the
device for transmission.


-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
