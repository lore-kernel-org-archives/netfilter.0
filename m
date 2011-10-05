From: Chris Percol <chris.percol@gmail.com>
Subject: PREROUTING
Date: Wed, 5 Oct 2011 12:49:46 +0100
Message-ID: <CAGwLQT0UUvmuzuY1WkJ30KzMJhMGQggwJw6Rcqc=-O6Hcuam1g@mail.gmail.com>
References: <CAGwLQT0SRyga4go7uk2ujyPiBaD_K4jvd_XHCXG7YGi1hUxVbw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=/epC4+Fu7fNjrek+apyZE2JMozqoh3AZaxe0diMPWkk=;
        b=ZwYnq1Hl1lWo4jdbB8F+3T0j40RD3753vyNhPHn5jygMbvyoVx1rTyq5MEFNkxJEbk
         qzFWIrXMe3NkwvMXoeP2RwsEp71+t3wKEqhkrr5Fdr1uhjc3ct2y8ymtralu7v7/X5/J
         6n67WCXMuSYbXMb5xZDPCxXycNFm1ZUp41Xco=
In-Reply-To: <CAGwLQT0SRyga4go7uk2ujyPiBaD_K4jvd_XHCXG7YGi1hUxVbw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,
I am currently using the following rules on centos iptables to direct
users from a --to-destination to different samba servers.
What is the best approach to take to allow the users of 10.91.0.0 to
also access Samba Server A?

# Samba Server A
/sbin/iptables -t nat -A PREROUTING -p udp --dport 137 -j DNAT
--to-destination 192.168.1.10 --source 10.90.0.0/16
/sbin/iptables -t nat -A PREROUTING -p udp --dport 138 -j DNAT
--to-destination=A0192.168.1.10=A0--source 10.90.0.0/16
/sbin/iptables -t nat -A PREROUTING -p tcp --dport 139 -j DNAT
--to-destination=A0192.168.1.10=A0--source 10.90.0.0/16
/sbin/iptables -t nat -A PREROUTING -p tcp --dport 445 -j DNAT
--to-destination=A0192.168.1.10=A0--source 10.90.0.0/16

# Samba Server B
/sbin/iptables -t nat -A PREROUTING -p udp --dport 137 -j DNAT
--to-destination=A0192.168.2.10=A0--source 10.91.0.0/16
/sbin/iptables -t nat -A PREROUTING -p udp --dport 138 -j DNAT
--to-destination=A0192.168.2.10=A0--source 10.91.0.0/16
/sbin/iptables -t nat -A PREROUTING -p tcp --dport 139 -j DNAT
--to-destination=A0192.168.2.10=A0--source 10.91.0.0/16
/sbin/iptables -t nat -A PREROUTING -p tcp --dport 445 -j DNAT
--to-destination=A0192.168.2.10=A0--source 10.91.0.0/16

Thanks,
Chris
