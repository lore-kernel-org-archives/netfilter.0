From: Ming-Ching Tiew <mctiew@yahoo.com>
Subject: connection tracking for sip calls
Date: Wed, 9 Sep 2009 02:47:00 -0700 (PDT)
Message-ID: <578790.35225.qm@web31508.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1252489620; bh=ZGcNmoOs+PZ7EIQvhEK5qAJQlLgUk7rTuA5qtkTqnRE=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=tQ4l7ZQ/QHvhS6ZzJ5oUZWKv3Pvu5F8S5ZrXLv+230HjAlcQujZue5RDzMX1g37Sw07qH3MVpstLcXV9qYVDJKESp9k6OigyQ5plgE9d7XSLejE15QgQEl2MhhvrehzKuH+6dOh1Z3wT7HPzr91ZRXoonggKp/e66dx2L8Sfi7g=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


I wonder if this is at all possible :-

I am trying to set up a SIP load balancer. With the help of CONNMARK and other relasted modules, I have done to a point where I could see that from my single PC doing http request/reply will use different path for new connections. However, as for SIP calls from the same device, it is stuck to the same path, no matter how many calls I made.

By the way, I have enabled  nf_nat_sip and nf_conntrack_sip for a kernel version 2.6.25.

I wonder if there is a notion of "NEW" sip calls in the conntrack modules where it will be able to classify NEW calls ( based on the SIP messages), and hence when use of iptables CONNMARK and other related modules, it could be "routed" to a different path ?

Appreciate your comments.
Thank you very much.


      
