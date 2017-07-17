From: Adel Belhouane <bugs.a.b@free.fr>
Subject: Re: FTP NAT fails after kernel upgrade
Date: Tue, 18 Jul 2017 01:04:11 +0200
Message-ID: <6dd149d1-69ca-7f60-7d95-8951f9dfa5b7@free.fr>
References: <26299185-e18e-bf19-f52e-969c0744594c@riosoft.com.br>
 <c1b4d15d-1049-42fd-4a6b-d5f48a32392d@riosoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c1b4d15d-1049-42fd-4a6b-d5f48a32392d@riosoft.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bruno de Paula Larini <bruno.larini@riosoft.com.br>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Le 17/07/2017 à 23:47, Bruno de Paula Larini a écrit :
> Ok, external clients can now connect with the previous rules. I thought nf_nat_ftp was loaded but it wasn't.
> Now I'm stuck at the same part I was when using nf_conntrack_helper = 1 (now it's 0).
> Not even the control connection completes (port 21 itself). Once more the connection goes all the way to the POSTROUTING chain but it doesn't even reach the destination.
> The following rule was appended to try to make internal clients go back to LAN and reach the FTP. For the moment I'm using port 21 to make testing easier.
> 
> iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -d 192.168.0.10 -p tcp --dport 21 -j SNAT --to-source 192.168.0.1
> 
> (192.168.0.1 would be my internal firewall IP)
> 
> Any clues?
> Thanks!
> 

Seems I missed an email too. To keep things very simple:
I'd say revert to the pre-kernel 4.7 way (see why it didn't work in
my other email) and keep all the rules, or switch to
nf_conntrack_helper=0, still keep all the rules, and just add these two
rules to mimic the former behaviour:
iptables -t raw -A PREROUTING -p tcp --dport 21 -j CT --helper ftp
iptables -t raw -A PREROUTING -p tcp --dport 2121 -j CT --helper ftp

Copy a working configuration, like the configuration used in
production. Try to not change it beside the minimum (to prevent new
problems like missing nf_nat_ftp) and forget about "securing" the rules
for now until it works (like before).

regards,
