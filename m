From: David Boulding <davidboulding@gmail.com>
Subject: (unknown)
Date: Sat, 26 Jul 2008 21:11:08 -0400
Message-ID: <009301c8ef85$a7389050$f5a9b0f0$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:to:subject:date:message-id
         :mime-version:content-type:content-transfer-encoding:x-mailer
         :thread-index:content-language:from;
        bh=7sbgkEqEZGqiGNROMBdylp4JakAtFpt7uwSV1hfyeow=;
        b=XNhHpoK+NIBnmyyr9uKjTYfx80D30QTWMLsEo5EtuwxSN7VPb+78VjZ+sJgAf4uc0Q
         PHadUqv16lRCaxUuB9948g6oofOIVo7W07JxzIUQQIcNZk9QVDOtnOWLnkMNWfHAYpa1
         4XuIajMEuDyicsnlp6reUNxnN+CW4lbN+5fDc=
Subject: 
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hey all,

I'm developing with libnetfilter_queue, using "iptables -A FORWARD ." to
capture packets of interest on a bridge for analysis (firewall). 
I use nfq_get_payload() to grab everything from the IP layer and on, but I
was wondering if there was any way to get the raw MAC layer. 
Is there any command like nfq_get_payload() that will return everything
similar to what you would get using wireshark or ethereal?

Thanks,

Dave

