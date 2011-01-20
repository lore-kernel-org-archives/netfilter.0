From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iptables/ipset syntax
Date: Thu, 20 Jan 2011 23:20:16 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1101202314330.2080@blackhole.kfki.hu>
References: <a1bd277586d221277f8a4566fc37355c@psw.ro>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a1bd277586d221277f8a4566fc37355c@psw.ro>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arthur Titeica <arthur@psw.ro>
Cc: netfilter@vger.kernel.org

On Thu, 20 Jan 2011, Arthur Titeica wrote:

> I'm having some trouble understanding the correct syntax for an iptables rule
> involving ipset.
> 
> I need to forward between IPs within the same ipset. So I've tried using
> something like this:
> 
> iptables -A FORWARD -i eth0 -o eth0 -m set --match-set testset src,dst -p tcp
> --dport 9000:9020 -j ACCEPT

It'd be good to know the type of "testset". Anyway, if you want to match 
the same IPs in both the source and destination directions by a set, then
you should use a rule like this

iptables -A FORWARD -i eth0 -o eth0 \
	-m set --match-set testset src \
	-m set --match-set testset dst \
	-p tcp -dport 9000:9020 -j ACCEPT

The keywords "src" and "dst" instructs the set match which parameter to 
grab from the packet ("source IP" or "destination IP") and try to match it
with the elements in the set. If it's a multidimensional set, then 
multiple "src", "dst" parameters can be used.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
