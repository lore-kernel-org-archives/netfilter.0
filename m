From: Anil kumar <anilkumar508@gmail.com>
Subject: Connection tracking notification events
Date: Tue, 8 Mar 2016 17:58:28 +0530
Message-ID: <CAD54ZaUgBnhPObX7PkJ6+pJin5ynZQwuKvVyRWSY7TdC1z9KyA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=PdAC23M4D2f8BSDe3GRwiBIPX6oA2PfHvrfkQm8wQv4=;
        b=0EVxKVOWeMK1YSPFx/am+a17kvA8LlePA0mB0zwuIhnDHpwvUA+1b+kBKt33ILouc0
         uhOZ027GYvxJekdKmosa1JGZ59lCRFwnny8QRPjDS1ysTlEuk5XH+wFtLedXD0RdUVic
         aecMlqBBIuiMDPNpJ8awq+jDXVfQxNuhV6O1FuccSJJrNChS/BpEr5B2Hxthgf2WdZRq
         CiHjshnPYE+hRD2daiED1bgmOvJrZOLa9mudd3gAqMLyE9JYhsr8qWqDyzh2c7uKhcjP
         fFlDvfP9teuSpXCGwoC9gRDdrwxtP7wkDinBwAzE5NQqC8VMora4VEpfd4YkFoscEeKE
         2v/Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

I am trying to test the connection tracking notification events.  For
this i have enabled the config "CONFIG_NF_CONNTRACK_EVENTS" and trying
to register for the notifications using nf_conntrack_register_notifier
function.

static struct nf_ct_event_notifier fp_conntrack_event_nb = {
        .fcn = fp_conntrack_event,
};

ret = nf_conntrack_register_notifier(&init_net, &fp_conntrack_event_nb);


This registration function is failing (return value is less than 0).
Also tried in older kernel (in 3.1 kernel, the function takes single
argument) the function is failing.
Do we need enable any other configs ?


Thanks,
Anil
