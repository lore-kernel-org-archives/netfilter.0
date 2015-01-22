From: Jan Niggemann <jn@hz6.de>
Subject: Re: conntrack GRE behaves differently in 3.17 / 3.18
Date: Thu, 22 Jan 2015 22:51:38 +0100
Message-ID: <20150122225138.Horde.IXk-nfaQwvQnI1tCRBV7DA3@htjn.suhail.uberspace.de>
References: <f37def15eb82a2685c1041db1b37454e@d119.x-mailer.de>
 <54BF086E.5080906@ngtech.co.il>
 <20150121141907.Horde.Z6MfNa3HaQNYCcKYODI4iQ1@htjn.suhail.uberspace.de>
 <54BFB8A3.7090504@chello.at>
 <20150121200324.Horde.ukdDqFj6DTInNSIVwG4VzA1@htjn.suhail.uberspace.de>
 <54C03496.30504@plouf.fr.eu.org>
 <20150122085533.Horde.1veF0V8pZQJDW8PLl5XdsA9@htjn.suhail.uberspace.de>
 <54C0CC79.3010001@chello.at> <54C15E96.9060708@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54C15E96.9060708@plouf.fr.eu.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="Yes"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: mart.frauenlob@chello.at, netfilter@vger.kernel.org

Zitat von Pascal Hambourg <pascal@plouf.fr.eu.org>:
> The bottom line is : if you use PPTP and conntrack with any kernel
> version, load nf_conntrack_pptp (it will load nf_conntrack_proto_gre
> automatically) and accept GRE packets in the ESTABLISHED,RELATED states.
Thank you for testing this.
I still have tons to learn, but I realized that I can use the pptp  
connection without any helper modules by explicitly ACCEPTing gre  
packets from the VPN server:
#iptables -S
-P INPUT DROP
-P FORWARD DROP
-P OUTPUT ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -s XX.XX.XX.XX/32 -p gre -j ACCEPT
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT

So now I know 2 possibilities that work, either loading  
nf_conntrack_pptp or the aforementioned rule to accept gre packets.
Which of both is a "better" approach with regards to security,  
performance, ...?

jan
