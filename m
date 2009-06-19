From: carrug <carrug@gmail.com>
Subject: [Libipq] packet_id what does it means?
Date: Fri, 19 Jun 2009 21:31:09 +0200
Message-ID: <op.uvsdt7b3po25i8@posillipo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:to:subject:from
         :content-type:mime-version:content-transfer-encoding:message-id
         :user-agent;
        bh=T5tSLKss0ibjLOLO8PcQwA1lo0jfTXzdI3pxaYAiSAs=;
        b=D6zUdZnCGpVUrk6AL25wPee8uAX/W6PUuOLfsNFuwAEEd907vXNLqHbVxmRjGGxU5A
         KACAQytgKgHnQAROtYVM0M/B5TpnvCxSfvfZbSy+LRP1aLwrSb3xlBqmI7HIyX4EbGP4
         LH81XDhNc25rn/yaOAmqCpOpSN7dA0V9vGiiA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi to everybody,
I'm new to the mailinglist and I have a little question.
I have an application that take packet from the QUEUE target by libipq API.
This application take this packets and send them in a specific order  
selected by me.
when I send this packets I print its packet_id with this line of code:

ipq_set_verdict(h, queue[elem]->packet_id,NF_ACCEPT, 0, NULL);
fprintf(stderr,"I'm sending packet number: %d with packet_id:  
%lu\n",elem+1,queue[elem]->packet_id);

note that queue is a standard vector where i copy packet got from QUEUE  
for my elaboration.

I'm wondering that some of this packet_id have the same id!
for example, this is my output:

I'm sending packet number: 1 -> packet_id: 4154682432
count_tot_pkt: 1
/proc/net/ip_queue: 2
I'm sending packet number: 1 -> packet_id: 4019277504
I'm sending packet number: 2 -> packet_id: 4148198144
I'm sending packet number: 3 -> packet_id: 4154682432
count_tot_pkt: 4
/proc/net/ip_queue: 4
I'm sending packet number: 1 -> packet_id: 4154682432
I'm sending packet number: 2 -> packet_id: 4148198144
I'm sending packet number: 3 -> packet_id: 4020406400
I'm sending packet number: 4 -> packet_id: 4021517504
...
and so on

as you can see some of this packet have the same packet_id,but i'm sure  
that this packet (send from another application) are not equal (for  
example have different payload) now my question is:
what dose esactly means packet_id?
why some of this are the same?

I try to find out some documentation about packet_id, but I'm not lucky :(
tnx in advance

ps.sorry for my bad english
