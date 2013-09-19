From: binary <dreamer.binary@gmail.com>
Subject: traffic shape per ip
Date: Thu, 19 Sep 2013 21:43:54 +0300
Message-ID: <523B45EA.5090501@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=W6hQdg302Fhh8FUk4Fk+A9CbUqLF852ZauP4397qd0Q=;
        b=dSw+FF5oiBgLbGIYvWkVWe6dAn0P1QXqkbEDdEw4spPoDySmFe8c5vRZPIswRKAiFi
         yXGayW8/cvJ8QZCVIyPE/94WTme0Et0Ws+zi0HBeGz0Q8nkD260GhbF4IUeYOitkze+E
         8HWGZFajSI2DblGicW/jLEEoRuVEpsSmNo1H5XF4PK41f60BZOoKbiyTi382yilwvXFp
         XaPFwDqW1Ra/lg+F9hPB3/TT/LL879tDBK8lDD7SGIwL80ymNpdFyFKFs8Iz1x9Hhhca
         J1oeQA14QZXWC+/7VF1QNwiVQXvIDCWBdl3c5VYif8d4q1jRoSdXC3TJpFWYgozXGGBj
         7oaQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello everyone.


i am running a small server that everyone connects on it through openvpn.
once connected the server offers some services to the connected members 
(voip, php forms, company email).
i would to limit the bandwidth of some users based on IPs:
-10.10.0.10-19/24 gets only 1Mbps up/down
-10.10.0.20-29/24 gets only 2Mbps up/down
-the rest of the subnet is free of traffic shapping

the server has an ethernet (eth0) connected to the outside world by 
public IP and the VPN users connected throught the br0 (virtual interface).
i have seen the tc option on the iptables, but this is where i've lost it.

the server runs debian wheezy 7.1
