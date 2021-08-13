From: <alexandre.ferrieux@orange.com>
Subject: nfnetlink_queue -- why linear lookup ?
Date: Fri, 13 Aug 2021 12:58:17 +0200
Message-ID: <31544_1628852264_61165028_31544_19_1_cad3915d-c09c-92ce-825e-8bf1dbb43483@orange.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
        s=ORANGE001; t=1628852264;
        bh=r5eC+0cVAPjZXzXG0BUhgzHuku5yk94qi6VYdGa4hIs=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:
         Content-Transfer-Encoding;
        b=Z8k63HbhbZiJi4zkDAzSkv8aZCIZzgWxkbqk+lJatALCXNhsy0qgkfMmyxBz83n00
         M4mQcDpf1FfvJRCUUQ0d96zLnGh945mDjhv8xhz3PdKaRqzH59v7v0ObbAxbAUtgNk
         +dqrrpYNVjuI7U8FE/T4raE3MI0lcuiVmAUQ2kfOtrsCv9G56l5DKyIjHqQ4xWHgF7
         pMabuULvfkhy8d4g6TVgTe3yxFPkPN4+x1VieVH0vqrA4sBJxggsGxjDeJwppWRI+l
         ajbwdVKejSGf+S0kmK5zli0IrMnlpURjK7OsxLizIr3rPreFNWvPqDXoszUKyafvk3
         J1PQIl1de6QqQ==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

In nfnetlink_queue.c, when receiving a verdict for a packet, its entry in the 
queue is looked up linearly:

   find_dequeue_entry(struct nfqnl_instance *queue, unsigned int id)
   {
     ...
     list_for_each_entry(i, &queue->queue_list, list) {
       if (i->id == id) {
         entry = i;
         break;
       }
     }
     ...
   }

As a result, in a situation of "highly asynchronous" verdicts, i.e. when we want 
some packets to linger in the queue for some time before reinjection, the mere 
existence of a large number of such "old packets" may incur a nonnegligible cost 
to the system.

So I'm wondering: why is the list implemented as a simple linked list instead of 
an array directly indexed by the id (like file descriptors) ?

Indeed, the list has a configured max size, the passed id can be bound-checked, 
discarded entries can simply hold a NULL, and id reuse is userspace's 
responsibility. So it looks like the array would yield constant-time lookup with 
no extra risk.

What am I missing ?

Thans in advance,

-Alex

_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

