From: Mark Ruth <mrkrth90@gmail.com>
Subject: Trying to achieve fail over to multiple DNATed destinations
Date: Tue, 9 Aug 2011 03:36:20 +0500
Message-ID: <CADCwhZm3JXpb=YMpsjWdd+tpwDtdUzOyKSwatpEzEX681=2tWA@mail.gmail.com>
References: <CADCwhZk8VdOCKQ5QA_aEG_Z9naqfJvbjdd=MAR4Pk5R_L4-xHg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=g5pIBv/x4EK2tJnY5KaAcT4UJZORW4pzZudYMrzTo2M=;
        b=a3papXC5AjfKUstn0paxeJeDgzKdZa0+CQdGvMAcuJTKe1gNChlTfRONKHln7PJeyb
         eZwCCLooz0VdtCZxd0XDQ+LyK85iOj9o5ElRpgRW4m1MpWeDs4wrts/rDzoZzx9EwEV2
         jAWHW+bX+9cMfDfqiwAPlppQZDKXOTFqf12gw=
In-Reply-To: <CADCwhZk8VdOCKQ5QA_aEG_Z9naqfJvbjdd=MAR4Pk5R_L4-xHg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello Everyone

I have tried to search alot about my situation over the Internet and
the mailing list archive of netfilter but could not exactly find an
answer. Please accept my apologies if this has been answered before,
in that case please point me to the right direction.

The issue at hand is as follows,

I am doing DNATing on my Linux box (Centos 6 32 bit) and actually
forwarding any connection at a specific local ip on my box to specific
target IP. Its a Kind of proxy behaviour we are studying.

This is an example rule,

-A PREROUTING -d 10.10.10.20 -i eth0 -p tcp -m tcp --dport 80 -j DNAT
--to-destination 201.23.11.22
-A PREROUTING -d 10.10.10.20 -i eth0 -p tcp -m tcp --dport 443 -j DNAT
--to-destination 201.23.11.22


where 10.10.10.20 is an ip alias on my linux box i.e performing nating and,
201.23.11.22 is a destination web server, lets say www.example.com
(IPs are not real off course)

So the above two rules actually NAT any connection attempt from my
network users to my Linux box's ip address 10.10.10.20 and port 80 and
443 and forward them to destination IP of www.example.com (same ports
off course)

The problem is that the target webserver (i.e. www.example.com ) is
loadbalanced between like 10 servers having 10 public IPs (which are
NOT in series), but since IPtables can not accept domain names
(correct me if i m wrong) I have to select 1 ip address (i.e.
201.23.11.22 ) from the pool of 10 available, for my iptables rule.

For some reason if the target webserver (www.example.com) shutdown 1
of its server and lets say they shutdown the exact server IP which i
was using in my rule, my users can not connect to www.example.com any
more untill i debug this and change the destination ip address in my
iptables rules.

Now i want to handle this situation with some sort of failover rule
that can forward users to next ip in list if 1st DOES NOT RESPOND for
some reason. Another thing that I want to achieve is to distribute
load between target's multiple servers rather then just 1 IP address,
something as follows,

-A PREROUTING -d 10.10.10.20 -i eth0 -p tcp -m tcp --dport 80 -j DNAT
--to-destination 201.23.11.22 --to-destination 201.23.12.21
-to-destination 201.23.11.74 .....

where,

201.23.11.22
201.23.12.21
201.23.11.74

are all pointing to www.example.com, note that the destination IPs are
not in series, therefore IP range can not be used.

I read that multiple --to-destinations were supported in previous
versions of iptables but not anymore. Hence to summarize, I want to
achieve some sort of failover with loadbalancing in above mention
scenario. Failover is more important.

I will highly appreciate if someone can help me out resolving this issue.

Regards,
Mark
