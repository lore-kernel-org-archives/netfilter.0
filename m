From: David J Craigon <david@craigon.co.uk>
Subject: Re: Conntrack not recording packets going through a firewall
Date: Wed, 21 Jan 2009 22:23:29 +0000
Message-ID: <c1ace6860901211423u718fe3f5xb459b07c7c9b5fd@mail.gmail.com>
References: <c1ace6860901210632m6d9e5b12g71010545a57be1b5@mail.gmail.com>
	 <4977522B.5030007@mailinator.com>
	 <c1ace6860901210920l1922c626x124b83e7f02d0844@mail.gmail.com>
	 <c1ace6860901210937m375a8f38g87a86e6264ff6023@mail.gmail.com>
	 <49776B2A.4070005@mailinator.com>
	 <c1ace6860901211233h7a978638g86e891e25991b4d4@mail.gmail.com>
	 <497791FC.5040301@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=joCmA31hbpMNU0JCNEv4f8Xh95z4DNdE4wR60o7hHEQ=;
        b=YmqlJkeGCX13KmpDSH5WwAq7vlOoGl4ND9+x5T9LNSKXLzK5J1HxwbXBBwogxbf6Y5
         9p8lpziuhy55QQK3bPtZK5IT61XsdKO7hFDnmCu5Y+p+q0rmDdNOJbRtrxXC17qG6H2B
         RKhj9QK0JBHZL14AK9xelhwDcug4HE8VpGyHo=
In-Reply-To: <497791FC.5040301@mailinator.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I seem to have ended up arguing on the internet, which wasn't really
my idea :-(.

Right, let's go through this again.

Internet--------Firewall------Server 1
                          |
                          ----------Server 5

I'm working on the firewall, a linux box. The firewall has addresses
10.72.2.1, 10.72.3.1 and 10.69.2.3, which goes off to the internet.
Server 1 has IP 10.72.2.3 and default gateway 10.72.2.1. Server 5 has
IP 10.72.3.3 and default gateway 10.72.3.1.

Server 1 can see server 5. Server 1 can see the internet. Server 5 can
see server 1. Server 5 can see the internet.. There are absolutely no
routing problems whatsoever: Look! Here they are pinging each other!

[root@server5 ~]# ping 10.72.2.3
PING 10.72.2.3 (10.72.2.3) 56(84) bytes of data.
64 bytes from 10.72.2.3: icmp_seq=1 ttl=63 time=2.83 ms
64 bytes from 10.72.2.3: icmp_seq=2 ttl=63 time=1.14 ms
64 bytes from 10.72.2.3: icmp_seq=3 ttl=63 time=1.48 ms

--- 10.72.2.3 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2002ms
rtt min/avg/max/mdev = 1.144/1.818/2.830/0.729 ms
[root@server5 ~]# traceroute 10.72.2.3
traceroute to 10.72.2.3 (10.72.2.3), 30 hops max, 40 byte packets
 1  10.72.3.1 (10.72.3.1)  4.367 ms  1.212 ms  5.749 ms
 2  10.72.2.3 (10.72.2.3)  5.196 ms  4.715 ms  5.163 ms
[root@server5 ~]#

The reason I'm on the netfilter list, is because I'm trying to use the
firewall linux box as a firewall. Like I say, with my rule sets,
connections don't work from one server to the other for http traffic.
See my original email.
