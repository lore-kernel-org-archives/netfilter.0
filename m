From: Ming-Ching Tiew <mctiew@yahoo.com>
Subject: drop dhcp request from a particular mac address, after a dhcp relay
Date: Wed, 10 Mar 2010 06:30:52 -0800 (PST)
Message-ID: <418652.3218.qm@web31505.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1268231452; bh=DfCspOAAeBExaLsYJa7jG8/iKypIJvVAnkxab2YrjJM=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=Sy5yW+a5zBTpT+56MQi/IMOUCelJDuThqWgK8sQd9eQe7Ew55fhe1r01vHRs7VLcnlZhjDsWGzfuGqZOV4vHQZXLIalTdBmeBFECtovOx7Mq9SNlaH+efnM5swrh0XX1hkph2t5x16LQM1xgG9S9kLUGIQHx3zD3zcvts8OLcoU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


I would like to inhibit a dhcp request from a particular mac address, on the dhcp server.

If the client is directly LAN connected, I would suppose the following will work :-

iptables ....... -m mac --mac-source 

But to add a twist to the problem, the machine which must be blocked from obtaining a DHCP IP is connected to a DHCP relay, and therefore, the dhcp server is seeing only the mac adddress of the relay. Can this be accomplished with iptables ? 

Is there a match which works something like this :-

  iptables ..... -m bootp --mac-source 00:08:a1:ab:75:d1 -j DROP ?

Well, if 'iptables' can't serve the purpose, how about ebtables ?

Regards.




      
