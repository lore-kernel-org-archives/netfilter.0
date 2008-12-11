From: "=?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?=" 
	<javier.galvez.guerrero@gmail.com>
Subject: Using MARK and TOS to route traffic through different interfaces to the same destination
Date: Thu, 11 Dec 2008 13:18:08 +0100
Message-ID: <145d4e1a0812110418l3a867cb6pe6d45e9fd1007a75@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=yed+0PvypnootFNTupiSVRNzmqYAE7JVs7zDzT8F8Tg=;
        b=ut8Gya0zLZ58wBpJr60qgKgjo+EPNFdOriOlDmvHFvmGsctm3edfz6zj1WSXk7TPQw
         sn5TvThWGxAPryk/ArD7UjWK50ziSYIzhaq12H35nAoZMu+hDutQrBH4WH6U8Zh74pZ+
         Km2d/blH5nhku/qyiUhSHIOQ2ut5A52KRounU=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I need to route packets through different interfaces (let them be ath0
and eth0) depending on the application source port, so I thought using
TOS or MARK targets of iptables would be helpful.

Anyway, as I try configure it to mark the traffic and updating the
routing tables through many different ways, I can't get it working so
the packets are always sent through the "default" interface in the
main routing table.

For example, if I use MARK I configure it this way:

sudo iptables -A OUTPUT -t mangle -p tcp --dport 60301 -j MARK --set-mark 1
sudo iptables -A OUTPUT -t mangle -p tcp --dport 60302 -j MARK --set-mark 2

sudo ip rule add fwmark 1 table 1 prio 1
sudo ip rule add fwmark 2 table 2 prio 2

sudo ip route add table 1 nexthop via 192.168.0.1 dev ath0
sudo ip route add table 2 nexthop via 192.168.0.1 dev eth0


The routing tables and the iptables rules are properly updated but
packets I sent with these source ports are always sent through the
default interface in the main routing table (if I change this default
entry then the packets are sent through this again).


Any idea about what I am missing? Any help would be much appreciated.


Thank you,
Javi
