From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How can I make iptables accept SMB UDP packets from/to UDP ports
 137 and 138?
Date: Sun, 27 Mar 2011 18:03:03 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1103271802330.29428@obet.zrqbmnf.qr>
References: <63109.45424.qm@web120317.mail.ne1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <63109.45424.qm@web120317.mail.ne1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: crocket <crockabiscuit@yahoo.com>
Cc: netfilter@vger.kernel.org

On Sunday 2011-03-27 17:05, crocket wrote:

>I want iptables accept SMB UDP packets in a subnet.
>When samba uses SMB protocol,
>it sends out name queries as broadcast packets from high number random UDP 
>source ports to 137 or 138 UDP port on remote hosts on the same subnet.
>Since reply packets to the broadcast packets don't come from the broadcast 
>address for the subnet,
>iptables can't categorize reply packets as ESTABLISHED,RELATED with state match 
>module.

So use -m conntrack --ctstate NEW.
