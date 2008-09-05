From: "Cam Bazz" <cambazz@gmail.com>
Subject: iptables problem
Date: Fri, 5 Sep 2008 14:12:12 +0300
Message-ID: <1bcb7c7f0809050412g67724c2dl3dfcfb2eb59749b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=WXhnK121vxlsCAYgvJpRV9/5z5FT6595naFhXD8VGU8=;
        b=mDUIccXEIqY9Z7EMZnEkWlnUX5/vB+nwEuZ0HuEJNp0Xt4hTB5aWaGmOHP70dJUAMh
         nG+1Ar5hMJxB+MSvMlfje4PtB7TkvApM+k3PLbI3t+WTPR61zz8STfhQej3nVeD6Xidi
         f3T1HtKMWjSVqTW9lu9uYEJx1Ky3/VFVxzuIU=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Hello

I am running a glassfish server and I need the basic requirement of
forwarding port 80 to port 8080. Here is what I have done: (I put
1.1.1.1 instead of my real ip adress.)

#
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT;
iptables -A INPUT --destination 1.1.1.1/32 -p tcp --dport 8080 -m
conntrack --ctstate DNAT -j ACCEPT;
iptables -t nat -A PREROUTING -d 1.1.1.1/32 -p tcp --dport 80 -j
REDIRECT --to-port 8080;
iptables -A INPUT -j DROP;
iptables -I INPUT 1 -i lo -j ACCEPT;
#


it works fine. but here is the problem. I added another ip address
with ip aliasing and now I got eth0:1.

I want to run apache on port 80 on this ip.

but no matter what I tried, I could not modify the rules so packets
coming to eth0:1 port80 do not go to port 8080 on eth0. currently all
packets routed to eth0:1 port80 goes to eth0 port 8080.

any ideas/recomendations/help greatly appreciated.

Best regards,
-C.B.
