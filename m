From: brian demsky <bdemsky2@gmail.com>
Subject: Filtering traffic between machines on same wireless access point
Date: Thu, 4 Feb 2016 22:38:57 -0800
Message-ID: <CAD_1dL0rtBzrUc-VGpyCxGNb+b=XwNywLHy1N2Lv_1ZEKjhpYA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=Vi0EZqIFqLk9KMPed4ytU6vBq9vyEpnOsO5ls4Pjybg=;
        b=mTCesrnMdV6CtuBumvzXjBKPo1fMPgZ63PzfkUMhQpR7FXk0kwzkinukGn/NBexVda
         UK75LGnpj4neG27DNXHf3wRKVtp6xcyo29dh6OAfDB1R6PRbh/F/WyNWINZ0cAzu03lF
         VgPytjJ7dsxxpJM68FA1PGBe7H6VSO535b9UKrsVMU6iyFsSZE6kXTr2AshY6sRJFHG+
         UgEMYmB8epQ/fhOyn8vY3+KA8UpD91+D3QtZAF9JXwFwxF9E1jVQhwX55FiCCVeEJzCj
         T/ilFxPQZSCv5bDWLr9Tcf/juvJYxInto2NzXo/QZVpQox67IugGRp6E1kzhytAvX1yi
         zZCQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Is there a way to use netfilter rules on an wireless access point to
filter traffic between machines on the same access point.  For
example, blocking traffic to specific ports or blocking traffic
between specific pairs of machines?

I'm aware of the ap_isolate driver option, but that is too coarse
grained for what we need to do.

Thanks,
Brian
