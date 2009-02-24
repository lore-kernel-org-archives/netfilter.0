From: Chris Henderson <henders254@gmail.com>
Subject: Policy based routing with iptables
Date: Tue, 24 Feb 2009 16:33:35 +1100
Message-ID: <d4ee74cf0902232133q3fc24ff1s5dbddd43eae40c1e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=lcuf5Cw2UigMHiTMO1zpZwUeuOCjjybhKvr98lphlFk=;
        b=k8R74dgDY+dOFwUZKUYrw0v8V58BOtb+tdTXyxdNs3WPwxH35PlG9qhFF2QHF8i7gg
         dSn1RmW9e16kP9BhPWgELv6Gjlkk47XPTT4L98ZAamXvT0aewn0fbJ80CjsEz+h4EGBh
         +FJAJQiKWZql7FJL4U6z0ImcL3dJTeSjJ/jTg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have a physical IP address "192.168.25.2" and a virtual IP address
"192.168.25.254" on a Linux server. I would like to make the virtual
IP address a router such that anything comes to that IP from
192.168.25.0/24 and 192.168.20.0/24 will be redirected to the physical
IP address "192.168.25.2".

How do I do this with iptables? Do I need to make any changes to the
routing table as well?

Thanks.
