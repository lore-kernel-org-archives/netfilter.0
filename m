From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Using source nat to discriminate traffic
Date: Tue, 26 Apr 2011 11:15:54 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104261115080.20267@obet.zrqbmnf.qr>
References: <4DB68B40.2030806@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DB68B40.2030806@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: carlopmart <carlopmart@gmail.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2011-04-26 11:07, carlopmart wrote:

> Hi all,
>
> I have a problem using source nat rules to discriminate traffic on one host.
> This host has several ip aliases assigned to provide several services. Problem
> starts with mysql client. This host needs to access to another host that acts
> as MySQL server. This MySQL server has some acls configured to access
> databases, in this manner:
>
> - BBDD_1 can only be accessed by ip address 172.21.2.2.
> - BBDD_2 can only be accessed by ip address 172.21.2.3
>
> Both ip address, 172.21.2.2 and 172.21.2.3, are assigned to the first host
> that acts as a mysql client. Latest release of mysql client contains an option
> to pass --bind-ip-address, but my mysql client version not (and I can't do an
> upgrade due to a tecnical specifications).
>
> Then, I need to discrimanate traffic on mysql host client when it tries to
> access to mysql server. I have found a partial solution putting this iptables
> rule:
>
> iptables -t nat -A POSTROUTING -o eth1 -d 172.17.3.3 -p tcp --dport 3306 -j
> SNAT --to-source 172.21.2.2
>
> This rule works ok when mysql client tries to access to BBDD_1

Assuming BBDD_1 is 172.17.3.2, this rule won't be considered at all. Of 
course stuff works because some address is the client's default.
