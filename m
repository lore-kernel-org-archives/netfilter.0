From: adam <adam_vs@o2.pl>
Subject: ftp tracking for outgoing connections
Date: Fri, 21 Jun 2013 03:45:32 +0200
Message-ID: <CALE+ZtAxnV4BjeiJc22-TkRjBnn=GZ62nz0TfT1F6vhnbDLBcg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:date:x-google-sender-auth:message-id:subject
         :from:to:content-type;
        bh=so35k33nhwJhzQwuO+ZtxQxwWZujcTMClgeRHMRdGa0=;
        b=zIEx7OXsY3XSjXeX5U85Hpw3Jspp4NkQqe6i6V8PRFNtyVPTB4GR/8j663sB61cMyu
         2z7LWtun8UE++CEFK/8ZJohdoTce1QVOcpw3gkJ2DMIzA4jqFp+utwkv/4RBOf4IAezP
         E1D9tqmMRsGzQCyeiHOHDZeqKW90P2MWPk6oCFKlJgK2D8S4Fmf2AZeXeYiTNtAuiLa9
         SjvfnFZpzyvaQKc+AW7fphIzIFwnaLNxx2RAeMXuMTKKU+R2VdZ8vO2EYrHm2MBVPo3I
         qjrfVAOvPTPh6ADnV6lu07Af9OoL8+hybwXp+Psan7WW1H++V1fkuCpemMtsogwdD0YN
         UkJw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I use iptables DNAT which rerouts outgoin packets from my system to
127.0.0.1:121. On that port I have redsocks program that converts this
into socks traffic and then I route this traffic through outside
servers over the internet.

simplyfying greatly:
iptables -t mangle -A OUTPUT -j MARK --set-mark 1 (some conditions
were here originaly)
iptables -t mangle -A OUTPUT -p tcp --dport 21 -j MARK --set-mark 0
#exception for ftp # does not work ok
iptables -t mangle -A OUTPUT -p tcp --dport 22 -j MARK --set-mark 0
#exception for sftp,ssh
iptables -t nat -A OUTPUT -p tcp -m mark --mark 1 -j DNAT --to 127.0.0.1:121

I don't want to DNAT outgoing sftp and ftp connections. Exceptions
work well with sftp but FTP of course not because it uses another data
chanell - in passive mode another outgoing connection from high port
to high port. I don't think conntrack can track ougoint FTP protocol
connections. Is there any solution for me
