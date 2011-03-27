From: crocket <crockabiscuit@yahoo.com>
Subject: How can I make iptables accept SMB UDP packets from/to UDP ports 137 and 138?
Date: Sun, 27 Mar 2011 08:05:23 -0700 (PDT)
Message-ID: <63109.45424.qm@web120317.mail.ne1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1301238324; bh=81fD4zL7ZOuEhH9kiRlYU1hrpMCfGQRt69FMr2jHoRw=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=Qz/btn/JHOfiuik1XQBZ5MzMcZ3vlTqS+cbF2aj82/WjyTXXRZ8UsM9wXXFnVwKW/Wh4db6SkfEubnvNn7S/uCwEhpXSUH6GMRLMGduJLn3CNhjJ1rQBberNTvSJSOgXZAycr7bMhd8m4Jd2DPcRn2soM262CPh0t0ATqCWAcM8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

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



      
