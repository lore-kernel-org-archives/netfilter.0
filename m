From: Ralph Blach <rcblach@gmail.com>
Subject: correct net fitler rule
Date: Wed, 28 Oct 2009 00:00:15 -0400
Message-ID: <4AE7C1CF.2070807@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=ZSAznDAkH1gfQfz2+if40Pd+t69h3PxubHvRwnPuEKU=;
        b=YwfiJUlrJHIcPhxyRTUwQEIapnbowA93DGJPKsfgy2bfRmzsGONranjZAhJ40QLdce
         U4w8xjU5KEppWRpmywqVeRhn0dGuUicQAico2Qapsv+Qk9ICvbm6j8bPw/V7Lh3itA1h
         ym4olEKb3F3HKX4jE7W8Ui3k9iKb7Beez7nMU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I want to log all drop packets but just pass some packets

I wrote these rules.
'
Will these test of rules allow all packets on the input of wlan allow 
packets with source address in the 10.0.0.0/255.255.255.0
and drop/log the selected networks>

Thanks
Chip

/sbin/iptables -F
/sbin/iptables -N LOGDROP
/sbin/iptables -A LOGDROP    -i wlan0  -j LOG --log-level 7
/sbin/iptables -A LOGDROP -j DROP
/sbin/iptables -A INPUT  -i wlan -s     10.0.0.0/255.255.255.0 -j 
RETURN  #return
/sbin/iptables -A INPUT  -i wlan -s      24.25.5.148 -j RETURN  
/sbin/iptables -A INPUT  -i wlan -s      24.25.5.147 -j RETURN  
/sbin/iptables -A INPUT -i wlan0 -s    58.102.198.29/255.255.255.0 -j 
LOGDROP  # log and drop

