From: Konrad Vrba <konrad.vrba@gmail.com>
Subject: port knocking using recent module
Date: Sun, 24 Mar 2013 07:40:14 +0100
Message-ID: <CAF2Nc0y_Sc=MpZzxDyv0YFKBHf6EO1xBYV_PqFLEhLbz6AibMw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=6QMvS7Arjd8ha0MBH36oP6WCVzz14Nvb0+Wpsn3n3b8=;
        b=gra/avt1bBfYCxq6k2HcOn79rzKCdEeX585kIHRGjeZqn+gXr+ZNY3d6z7x+TFD4Ca
         +bbeT5nO+ux9liMU0nyWFez/jrdP8J3TXMbiy4Bh/ugdTHZ70BjjFh4jFDWQsD5O6sBL
         n5Ko+11yiPsBZyzfelevglmCywZ6R90MC6wsPRzbNLRxig2P3++lkAaWc0F8vLoOYnND
         CVLafarsQluBavIgr8CVr52LVEscIbOGI8uUav/L0bbitTsCJH0DjVCzkVXoqy1Wr1pH
         8O8uosDEyuqIBvSlwVMQPJyQVSHZlht4VzSjdfvi4OXr//kAjw6+j953iT9eA2eLjr4J
         gDLQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear list,

I am testing port knocking implemented with the "recent" module. All
works well, I was wondering if I could somehow modify the rules
(below), so that by knocking from host_A, the ssh port would open for
host_B. One possibility is to fake the source IP while port knocking
(hping3 -p 100 -a $HOST_2 11.22.33.44). That works, but I would prefer
to implement this using iptables.

 -A INPUT -p icmp -j ACCEPT
 -A INPUT -s 127.0.0.0/8 -i lo -j ACCEPT
 -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

 -A INPUT -m recent --rcheck --seconds 60 --hitcount 3 --name RATE_LIMIT -j DROP

 -A INPUT -m recent --rcheck --seconds 5 --name KNOCK3 --rsource -j STATE3
 -A INPUT -m recent --rcheck --seconds 5 --name KNOCK2 --rsource -j STATE2
 -A INPUT -m recent --rcheck --seconds 5 --name KNOCK1 --rsource -j STATE1

 -A INPUT -m recent --remove --name KNOCK1 --rsource
 -A INPUT -m recent --remove --name KNOCK2 --rsource
 -A INPUT -m recent --remove --name KNOCK3 --rsource
 -A INPUT -p tcp -m tcp --dport 100 -m recent --set --name KNOCK1
--rsource -j DROP
 -A INPUT -m recent --set --name RATE_LIMIT --rsource -j DROP
 -A INPUT -j DROP

 -A STATE1 -m recent --remove --name KNOCK1 --rsource
 -A STATE1 -m recent --remove --name KNOCK2 --rsource
 -A STATE1 -m recent --remove --name KNOCK3 --rsource
 -A STATE1 -p tcp -m tcp --dport 200 -m recent --set --name KNOCK2
--rsource -j DROP
 -A STATE1 -m recent --set --name RATE_LIMIT --rsource -j DROP
 -A STATE1 -j DROP

 -A STATE2 -m recent --remove --name KNOCK1 --rsource
 -A STATE2 -m recent --remove --name KNOCK2 --rsource
 -A STATE2 -m recent --remove --name KNOCK3 --rsource
 -A STATE2 -p tcp -m tcp --dport 300 -m recent --set --name KNOCK3
--rsource -j DROP
 -A STATE2 -m recent --set --name RATE_LIMIT --rsource -j DROP
 -A STATE2 -j DROP

 -A STATE3 -m recent --remove --name KNOCK1 --rsource
 -A STATE3 -m recent --remove --name KNOCK2 --rsource
 -A STATE3 -m recent --remove --name KNOCK3 --rsource
 -A STATE3 -p tcp -m tcp --dport 22 -j ACCEPT
 -A STATE3 -m recent --set --name RATE_LIMIT --rsource -j DROP
 -A STATE3 -j DROP
