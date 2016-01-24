From: Kevin Wilson <wkevils@gmail.com>
Subject: Netfilter matching modules and revisions
Date: Sun, 24 Jan 2016 15:51:59 +0200
Message-ID: <CAGXs5wWDu-kjHvBhf5kwEaspi8ppoDuganG+Ue4ou2jxo46g2A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=16234Fpbdl/THjT7UWygZW05l/m273NH8FUi+ke3xHw=;
        b=QaDbIT8ez/m/v8kwlPcEjVWyZoBJ4/w+xAEqiBXsLTTDme8sHJSRu1gKKrbl7tK+qf
         hUEr0NJ9M2GxPoWYNQGtkgt5K6oVNCdyL5gV04lEiHXAQHrvS6CYJQAfgRjJzE4voQNH
         NdD0P3viflIzAATNo+w2rxPrV89GCEr6k5+6nrH4wC5wEeIZmGVUF0BSjEXqMcjR5r5L
         EWHU7iClRYq8GldiSIJg3VBjOb/QYzYdoJv5LaMh714GuF6YtNIb1dHvECPML5W4zBbk
         MHq5LkuF9Spm2TmInTjRzt4VdGXBssn+cs6M67FjVdJ+5mRIOCitR9nxB8+kp0jepNI8
         FMXw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello all,

I have a question about revision of a match netfilter module.

There are sevral match netfilter modules which have revisions in the
sense that there
are multiple xt_match objects in that module, with different values
.revision   = 1, .revision   = 2, .revision   = 3 and so on.

In most cases diffrent revisions of the same xt_match object
have different handler, for match or checking match or both, and for
other handlers.

What triggers using a revision (when there is more than one xt_match
object in a given module) when running a module ?

To be more specific:
For testing I am using recent net-next kernel (4.4), and I am setting
the following simple
iptables rule:

iptables -A INPUT -m conntrack --ctstate RELATED -j ACCEPT

Now I added printk messages in the contrack matching module,
net/netfilter/xt_conntrack.c, in the matching methods for revisions 1,
2, and 3 respectively;
namely, in conntrack_mt_v1(),  conntrack_mt_v2() and conntrack_mt_v3(), but
I get messages only from conntrack_mt_v3().

Any idea what can determine which revision is chosen for a match
handler ? is it the highest possible ? Suppose I want to use revision
2
or revision 1 for the conntrack matching module: is it doable ? could
I set it somehow ? should I revert to older kernels which did not have
revision 3 for
using revision 2, (and older kernels without revision 2 to use revision 1)?


Regards,
Kevin
