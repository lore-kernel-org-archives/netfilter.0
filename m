From: italia azzura <italiazzura@gmail.com>
Subject: Question about ulogd2 and hostname
Date: Sun, 15 Jan 2023 14:49:08 +0100
Message-ID: <CABR3fBYi34AXzP6O=AMXoRDjk4CKBAxA8EJhv8ywXABoAQgSVA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AOtNh34Y+HqFgqpscTx81L77Yn+UyYdf04oojBJL9LI=;
        b=ct10dFQ5oJY6VzgVnm0f7lXWoppcfYj8/Sx1FhxxyKGv//OghVXuype3KP/N+yhA/4
         9/hdXmuxKobJVfyKlueL5k6UTNwoDm7LA4l8hf80qaPxk4EkmQqapmrMMBMtsvXNEVvb
         /XcVHSILJ4Bafrmp/eW8Luf7MqOAuxONJ9di1141PmmSgFko6aIU6mg/E7ShaHYuX4Vw
         5gDCUgYqwifnMln1MVZnrGeZ9pAUPp31J6WsiDuseE2jYeMpTH54Jsx30qqzY6eeIbk9
         xwMNyls+L6pQE6G2ySCg67m81MOLP3PkZsyw8Htd7YdL+NzYksgg47ktPW85WvhS6I4r
         9n/w==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I currently use ulogd2 to get nftables logs (from different linux
servers) to a mysql database.
It is currently working fine, I get all the information needed
regarding packets.
But I can't manage to get the hostname (which is in the local file).
As I can read in the ulogd2.x documentation, I can't find the
ulogd_LOCAL.so virtual interpreter to get information about the local
system (particularly the hostname).
My servers (debian 11 and ubuntu 22.04) are currently running ulogd 2.0.7.

Could you please provide some information / help about that ?

Many thanks for your help and next feedback.
