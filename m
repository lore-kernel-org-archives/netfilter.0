From: John Donnelly <john_donnelly@persistentsys.com>
Subject: RE: libnfnetlink error:   ./nfqnl_test usage ? FAILS ON
  2.6.32-279.el6.i686
Date: Wed, 28 Aug 2013 15:52:35 +0000
Message-ID: <2E13285DED113046A773BD29BABDCC2032B987C3@US-MBX1.persistent.co.in>
References: <2E13285DED113046A773BD29BABDCC2032B984FE@US-MBX1.persistent.co.in>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2E13285DED113046A773BD29BABDCC2032B984FE@US-MBX1.persistent.co.in>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I tracked the  EINVALID error down to nf_unregister_queue_handler() in net/netfilter/nf_queue.c 





________________________________________
From: netfilter-owner@vger.kernel.org [netfilter-owner@vger.kernel.org] on behalf of John Donnelly [john_donnelly@persistentsys.com]
Sent: Thursday, August 22, 2013 10:10 AM
To: netfilter@vger.kernel.org
Subject: RE: libnfnetlink error:   ./nfqnl_test usage ? FAILS ON  2.6.32-279.el6.i686

NOTE: this appears to work on 3.10 kernels, but not 2.6.32 . I wonder why ?

I have debugged the test down to the library libnfnetlink and the recvfrom() message is returning
a EINVALID

[root@RH63-x86 utils]# ./nfqnl_test
opening library handle
unbinding existing nf_queue handler for AF_INET (if any)
errno sent 22
error from nfnl_step
error -1 during nfq_unbind_pf()


file:

libnfnetlink/src/libnfnetlink.c

static int nfnl_is_error(struct nfnl_handle *h, struct nlmsghdr *nlh)
{
        /* This message is an ACK or a DONE */
        if (nlh->nlmsg_type == NLMSG_ERROR ||
            (nlh->nlmsg_type == NLMSG_DONE &&
             nlh->nlmsg_flags & NLM_F_MULTI)) {
                if (nlh->nlmsg_len < NLMSG_ALIGN(sizeof(struct nlmsgerr))) {
                        errno = EBADMSG;
                fprintf(stderr,"EBADMSG \n");
                        return 1;
                }
                errno = -(*((int *)NLMSG_DATA(nlh)));
                fprintf(stderr,"errno sent %d\n",errno);
                return 1;
        }
        return 0;
}


________________________________________
From: netfilter-owner@vger.kernel.org [netfilter-owner@vger.kernel.org] on behalf of John Donnelly [john_donnelly@persistentsys.com]
Sent: Tuesday, August 20, 2013 10:40 AM
To: netfilter@vger.kernel.org
Subject: RE: libnetfilter_queue:   ./nfqnl_test usage ? FAILS ON  2.6.32-279.el6.i686

FYI - I got a solution:

You have to point a port to the QUEUE using iptables:

iptables -I INPUT -p tcp --dport 5001 -j QUEUE

This sets the port used by iperf to be monitored.

nfqnl_test  program works on Fedora 19 with a  3.10.7 kernel

It fails with a 2.6.32 :

[root@RH63-x86 utils]# ./nfqnl_test
opening library handle
unbinding existing nf_queue handler for AF_INET (if any)
error during nfq_unbind_pf()


Is this feature not available on 2.6.32 ?


________________________________________
From: netfilter-owner@vger.kernel.org [netfilter-owner@vger.kernel.org] on behalf of John Donnelly [john_donnelly@persistentsys.com]
Sent: Monday, August 19, 2013 5:39 PM
To: netfilter@vger.kernel.org
Subject: libnetfilter_queue:   ./nfqnl_test usage ? no activity shown

Hi,





Hi,
 I am trying to get   libnetfilter_queue  usermode  example working on 3.10.3 kernel , and I
don't see any activity reported:


info:

[root@rh62-x86 utils]# cat /usr/share/pkgconfig/lib* | egrep "Ver|Name"
Name: libmnl
Version: 1.0.3
Name: libnetfilter_queue
Version: 1.0.2
Name: libnfnetlink
Version: 1.0.1
Name: libnftables
Version: 1.0.0

[root@rh62-x86 utils]# pwd
/root/ntest/libnetfilter_queue/utils

insmod  /lib/modules/`uname -r`/kernel/net/netfilter/nfnetlink_queue.ko

[root@rh62-x86 utils]# lsmod
Module                  Size  Used by
nfnetlink_queue         7851  0

installed

Running  nfqnl_test yields no captures:

[root@rh62-x86 utils]# ./nfqnl_test
opening library handle
unbinding existing nf_queue handler for AF_INET (if any)
binding nfnetlink_queue as nf_queue handler for AF_INET
binding this socket to queue '0'
setting copy_packet mode


< nothing >

Should I  see activity if I  ssh to the machine ?

Suggestions welcome .
DISCLAIMER
==========
This e-mail may contain privileged and confidential information which is the property of Persistent Systems Ltd. It is intended only for the use of the individual or entity to which it is addressed. If you are not the intended recipient, you are not authorized to read, retain, copy, print, distribute or use this message. If you have received this communication in error, please notify the sender and delete all copies of this message. Persistent Systems Ltd. does not accept any liability for virus infected mails.
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

DISCLAIMER
==========
This e-mail may contain privileged and confidential information which is the property of Persistent Systems Ltd. It is intended only for the use of the individual or entity to which it is addressed. If you are not the intended recipient, you are not authorized to read, retain, copy, print, distribute or use this message. If you have received this communication in error, please notify the sender and delete all copies of this message. Persistent Systems Ltd. does not accept any liability for virus infected mails.
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

DISCLAIMER
==========
This e-mail may contain privileged and confidential information which is the property of Persistent Systems Ltd. It is intended only for the use of the individual or entity to which it is addressed. If you are not the intended recipient, you are not authorized to read, retain, copy, print, distribute or use this message. If you have received this communication in error, please notify the sender and delete all copies of this message. Persistent Systems Ltd. does not accept any liability for virus infected mails.
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

DISCLAIMER
==========
This e-mail may contain privileged and confidential information which is the property of Persistent Systems Ltd. It is intended only for the use of the individual or entity to which it is addressed. If you are not the intended recipient, you are not authorized to read, retain, copy, print, distribute or use this message. If you have received this communication in error, please notify the sender and delete all copies of this message. Persistent Systems Ltd. does not accept any liability for virus infected mails.

