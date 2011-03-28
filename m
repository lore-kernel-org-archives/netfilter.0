From: crocket <crockabiscuit@yahoo.com>
Subject: Re: How can I make iptables accept SMB UDP packets from/to UDP ports 137 and 138?
Date: Sun, 27 Mar 2011 21:27:01 -0700 (PDT)
Message-ID: <63967.71596.qm@web120301.mail.ne1.yahoo.com>
References: <63109.45424.qm@web120317.mail.ne1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1301286422; bh=9VaXagi03dQrpRHML/7OqYbipnKznerRRtuuzcha3Sc=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type; b=yZTh67uG1+C/gBFsS8QbXYegqIrs5r4SYdYtuZcV1G3aqAY4ja+vBbtlZ08yUXsnVvJzIZRHuT9Kx6tZWZOCBEFjNnhdtbArRv2/ECbrlY7KDv8S6LywjWoQnkiP1v6F8SOmSnGp58Bb8ksQcutoHO0BqUcs+INo0a3zY8LMf8U=
In-Reply-To: <63109.45424.qm@web120317.mail.ne1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

linux 2.6.38 already has nf_conntrack_netbios_ns which is the NetBIOS helper 
module.
If I modprobe nf_conntrack_netbios_ns, broadcast name query reply packets are 
recognized as RELATED packets.
It seems the module was already existent in 2006.



----- Original Message ----
From: crocket <crockabiscuit@yahoo.com>
To: netfilter@vger.kernel.org
Sent: Mon, March 28, 2011 12:05:23 AM
Subject: How can I make iptables accept SMB UDP packets from/to UDP ports 137 
and 138?

I want iptables accept SMB UDP packets in a subnet.
When samba uses SMB protocol,
it sends out name queries as broadcast packets from high number random UDP 
source ports to 137 or 138 UDP port on remote hosts on the same subnet.
Since reply packets to the broadcast packets don't come from the broadcast 
address for the subnet,
iptables can't categorize reply packets as ESTABLISHED,RELATED with state match 
module.
I need some helper module to make iptables recognize them as RELATED.
Does anybody know where to find SMB Helper module?



      
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html



      
