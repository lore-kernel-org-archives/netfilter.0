From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: Bridged interfaces are not accepting arp replay packages
Date: Tue, 25 Aug 2015 10:00:53 +0300
Message-ID: <CAEzD07+RTrG0DHQL4OT1ywa1whYax0N0=ikVB0hVqaEjhFbDWA@mail.gmail.com>
References: <CA+whn7TW=E=+ozNN_-3Y-gRordrhRw0+69qvXr-LKc_=+Wpogw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=HWFNp0gq5UEY1+NdijGTvX2mgt/53e3085/XZdesFyo=;
        b=jMbQMxA0CpF/kKPHIw8/pgFlauu3uQ+PpJsES5v9tapL3Lc9ucNkkEYuETl6rQDGTm
         0gMpPhHOKt2qQtRH87eB///vNqk+bb/NX7RePohn9+cSuowyvtUTqKxF4nZIkRQn7ycB
         HRhQk5Ggxrd18g/6cV3I3eBs77gcwfAwAHCN6ixDmHP1FA4zCORLH+QL8v1fYVaFf8Gi
         Aq8g1SehBxmjlbrTQzjj2aALGfaM79n3Crq0zBrTtjjrn/ewu1uxLWUGIPg225XKnPUn
         oI7rcI97bl/s9qIGoW8e7uAZNfSqttrjN6m0X5bG2EjWc80mvf8JYzM1+AYBSuAvGYlh
         CaKA==
In-Reply-To: <CA+whn7TW=E=+ozNN_-3Y-gRordrhRw0+69qvXr-LKc_=+Wpogw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tugrul Erdogan <h.tugrul.erdogan@gmail.com>
Cc: netfilter@vger.kernel.org

Hello.
Seems like you should load br_netfilter module.
Without it switching in the bridge works with some stranges.
After loading this module check the sysctl variables
bridge.netfilter.bridge-nf-* and set it to corresponded values.

2015-08-23 10:22 GMT+03:00 Tugrul Erdogan <h.tugrul.erdogan@gmail.com>:
> Hi all;
>
> I have a problem on bridged interface's arp replay management. My
> bridged interface which name is br0 and its physical NICs has no ip
> assigned them. I added the routing rule as follow "ip ro add A dev
> br0" . When I try to use synproxy rule on iptables my device send an
> arp request to A to determine the mac address of the A to create the
> SYN+ACK package which will be sent to A. Then the arp replay of A came
> back to my device, I can see the arp replay packets of A by tcpdump on
> br0 interface.  But the arp table is not including this arp replay.
>
> When I write some rules on arptables to analyze the arp request and
> replay packages, I see that the arp request leaves from physical NIC
> and but the replay of that arp request comes from br0 interface. So I
> think that for this reason the arp replay is not taken on by arp table
> as the mac address of A on my device (maybe as a arp spoofing
> prevention method).
>
> I want to take your helps. What can be the reason of this arp request
> rejection. Is there any sysctl setting that I have not known yet or
> how can I solve this problem?
>
> Thanks for your helps.
> Best regards,
> Tugrul
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Anton.
