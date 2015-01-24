From: Jan Niggemann <jn@hz6.de>
Subject: Re: conntrack GRE behaves differently in 3.17 / 3.18
Date: Sat, 24 Jan 2015 08:44:57 +0100
Message-ID: <20150124084457.Horde.7lzdxvLxV9PON4YIA4wqmA5@htjn.suhail.uberspace.de>
References: <f37def15eb82a2685c1041db1b37454e@d119.x-mailer.de>
 <54BF086E.5080906@ngtech.co.il>
 <20150121141907.Horde.Z6MfNa3HaQNYCcKYODI4iQ1@htjn.suhail.uberspace.de>
 <54BFB8A3.7090504@chello.at>
 <20150121200324.Horde.ukdDqFj6DTInNSIVwG4VzA1@htjn.suhail.uberspace.de>
 <54C03496.30504@plouf.fr.eu.org>
 <20150122085533.Horde.1veF0V8pZQJDW8PLl5XdsA9@htjn.suhail.uberspace.de>
 <54C0CC79.3010001@chello.at> <54C15E96.9060708@plouf.fr.eu.org>
 <54C2D74F.6040800@chello.at>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54C2D74F.6040800@chello.at>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="Yes"
Content-Transfer-Encoding: 7bit
To: Mart Frauenlob <mart.frauenlob@chello.at>
Cc: Pascal Hambourg <pascal@plouf.fr.eu.org>, netfilter@vger.kernel.org

Zitat von Mart Frauenlob <mart.frauenlob@chello.at>:
> Even if the modules are loaded, you need to allow the first gre  
> packet as you pointed out above.
At least on my system it's sufficient that I load conntrack_pptp. With  
the following rules I can then create a pptp connection:
-P INPUT DROP
-P FORWARD DROP
-P OUTPUT ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
I do not need to explicitly allow any gre traffic for the pptp vpn to work.
