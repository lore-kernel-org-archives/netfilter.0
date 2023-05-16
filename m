From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: How to configure "full cone" NAT using iptables
Date: Tue, 16 May 2023 12:15:23 +0200
Message-ID: <81765c91-cfc1-cf1a-8d34-c69dea29e2af@thelounge.net>
References: <CAF_hPjN0pV9w+RmO8rkSnNwd-2+ep6vmy-7JaREvUFSyNzuGhg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <CAF_hPjN0pV9w+RmO8rkSnNwd-2+ep6vmy-7JaREvUFSyNzuGhg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Shane Wang <xwang4396@gmail.com>, netfilter@vger.kernel.org



Am 16.05.23 um 11:58 schrieb Shane Wang:
> Hi folks,
> 
> I have found a solution on
> https://www.joewein.net/info/sw-iptables-full-cone-nat.htm, which
> works fine for a single internal IP address. However, I am struggling
> to configure "full cone" NAT for multiple internal IP addresses using
> iptables.
> 
> I have tried the following rules, but they do not seem to work:
> 
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.2.170
> iptables -t nat -A PREROUTING -i eth0 -j DNAT --to-destination 10.0.0.1
> iptables -t nat -A PREROUTING -i eth0 -j DNAT --to-destination 10.0.0.2

how do you imagine two contradicting rules to work?
roll a dice between 10.0.0.1 and 10.0.0.2?
