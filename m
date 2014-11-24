From: Vijay Kumar K <kvijay@gmail.com>
Subject: Issue with specifying interface/NIC name with drop packets rule
Date: Mon, 24 Nov 2014 19:42:30 +0530
Message-ID: <CAHRwiV37vEOmsFThw+Hhfjqb1SA05aZEUGBm1JQEB+-2WfnWWQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=0xzYhilHg07tiM7UaC2J2CdgdUHa+4hS3b25YgfZrkY=;
        b=OgwEHypDKZyN0eWq0wo9QCmuJDdiEc5FJnYVivHtLY+sG8IsG+nG+1+zJmXfSh8z/u
         iVbwVQd6pOX6j/lu/Bbz06OMVrhfnArkqTVFQQtgGFhm6lkC8vhpOn9eqjz1lleqW7cB
         9qhNqDLD9P4Ypmo+DVJl3LhRWhisIdHxBS5QZ1+eVoIn6gOTG50lntlA8TuHQykRXCRW
         X6vYvirb06Bn7UPK99s1bB1pQRnHkcKGQ9WNqBVnmh9ImXVqzajVChjM+uJPOvhj4gK7
         Sz89O6f/9dfAno1JdcckBXFx0EzXft0jOi2f3mjZoJYa9wxmOJlhV3S8ChVjw6KLCKfO
         jv5Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi ,
 I am using iptables library 1.4.15 on my linux machine and building
it to define and add the iptables rules. And I have multiple NIC
cards("eth0" and "eth1") on my machine and i need to add the rules
specific to some of these NICs. Allow and drop rules are working fine
as long as the NIC is not specified, but when I add rule with the
specific NIC name like "eth0" to drop packets,
i see it is droping packets for all the interfaces. Is there any known
issue with specifying NIC name.

the invocation path is like this:
   addMyRule(srcIp, srcIpNetmask, destIp, destIpNetmask,nicName,
proto, sport_min,sport_max, dport_min, dport_max,precedence, action,
0) -> iptc_insert_entry
   Invocation with the values:  addMyRule(inaddr_any, 0, inaddr_any,
0,"eth0", 0, 0, 65535,80,80,2,0,0)
In the implementation of addMyRule, ipt_entry is instantiated and NIC
name is copied to "iniface" attribute of the "ipt_ip" in "ipt_entry"
e = (struct ipt_entry *)malloc(total_length);
    if (nicName)
    {
        strcpy(e->ip.iniface, nicName)
     }

 I searched in the net for the known issues, but I could not find any
related. Any help in this regard would be highly appreciated.

Thanks&Regards
Vijay
