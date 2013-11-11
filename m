From: Husnu Demir <hdemir@metu.edu.tr>
Subject: conntrack not working in raw table
Date: Mon, 11 Nov 2013 09:20:37 +0200
Message-ID: <52808545.7070804@metu.edu.tr>
Reply-To: hdemir@metu.edu.tr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,


I tried to wrote a conntrack rule for raw table.

- ------------------------------------------------
..
..
DNSTOP='10.10.1.1 10.11.1.1 10.199.10.1'

$IPSET create DNSTOP hash:net,iface family inet hashsize 1024 maxelem
65536

$IPSET add DNSTOP 10.0.0.0/8,vlan1
$IPSET add DNSTOP 10.0.0.0/8,vlan2

for i in $DNSTOP
do
	$IPSET add DNSTOP $i,vlan1 nomatch
	$IPSET add DNSTOP $i,vlan2 nomatch
done

$IPTABLES -t raw -A PREROUTING  -m set --match-set DNSTOP dst,src -p
udp -m udp --dport 53 -m conntrack --ctstate NEW -j STOPDNS
..
..

num   pkts bytes target     prot opt in     out     source
   destination
1        0     0            udp  --  *      *       0.0.0.0/0
   0.0.0.0/0            match-set DNSTOP dst,src udp dpt:53 ctstate NEW

- ----------------------------------------------------

Simply, this will stop all NEW DNS querry coming from vlan1 and vlan2
except added IPs to $DNSTOP.

But, raw table cannot see the conntrack. I think it should be
understand from the conntrack table but I could not find any reference
in MAN of iptables(-extentions) about conntrack and raw table and it
gave no error. Simply not worked. It would be better to give an error
or put a reminder on MAN pages.


Best regards,

Husnu Demir.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJSgIVFAAoJEISpBAM51qlER0sIAJC/jvVVQDlnQdYOkVp8oJqd
sPA74Giq4QDy+5kt5MmfnMF95364vICgSpbG5XGTJNJlK+OWqayt3DEosIuqrZUp
i+FlnZlVQohFX9fZ6Ik2Hv2xAAYSTuarfqlFmGTj1c+IFymmbfLt87AX31mI0Emn
Jc5vfEpx6BGk2vpZg+uUTVhXCAkrJ583BogwdDg8B4pycxEeSIA+VECAfmQ4vLoQ
VJLXrlhQI+5+/onQrRtYYzdjynT6HyoctKNYXKAvZj5zBth6YoOSSI7ZIgciOZz4
8MmNKq+r2LcSAWH/zgUtDjJUZhj3TrMqB/e0TuKdDJq7zEb4+DahskGMIGUUqxY=
=zJc5
-----END PGP SIGNATURE-----
