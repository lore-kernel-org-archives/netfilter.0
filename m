From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: MASQUERADE and ACCEPT targets
Date: Wed, 24 Feb 2010 20:15:00 +0530
Message-ID: <cfeab66d1002240645i632227ccpbe8f3e55cebaf947@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=tSIrOebrHMjVXVWHtYFhL8vfxMrvrdZ+KZ7jvUBhjQE=;
        b=RtUyOBNsJ/jcTp0LgP7TOVQ4PautDafDAye9dUfQFUvPuq6jmwzFBpA3lV+VFK4CWL
         cFnCM0F2qSsZ9IbuRYzyPaLfPMRmAEIl9o8aOge8EQCcYZau2cxyd+cN9kHEa+BPQN4Q
         mwJdl449hLcyUjlDeO37uaGPsDo0Ux3GjLDkE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

All ,

     R1)   iptables -t nat -I POSTROUTING -o eth0 -m state --state
ESTABLISHED,RELATED -j ACCEPT
     R2)   iptables -t nat -A POSTROUTING   -o eth0 -j MASQERADE


                                        machine "B"
                                     ------------------------------------------
                                     |                                        |
                                     |                                        |
machine "A"   ------> eth0 |
|eth1----------------------------------------> internet
                                     |                                        |
                                     |                                        |
                                     ------------------------------------------

 I applied rules R2 and i am able to browse internet from machine A .

 1. Is there any problem if i apply R1 ?
 2. if packet state become ESTABLISHED ( not a new packet ) , do we
need MASQERADE target for remaing packets ???

Thanks,
Ratheesh
