From: Husnu Demir <hdemir@metu.edu.tr>
Subject: Re: conntrack not working in raw table
Date: Mon, 11 Nov 2013 09:32:39 +0200
Message-ID: <52808817.6010104@metu.edu.tr>
References: <52808545.7070804@metu.edu.tr>
Reply-To: hdemir@metu.edu.tr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <52808545.7070804@metu.edu.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Sorry I forgot to add;

uname -a
Linux neml 3.8.7 #2 SMP Mon Apr 15 14:09:02 EEST 2013 x86_64 GNU/Linux


Thanks.

hdemir.


On 11-11-2013 09:20, Husnu Demir wrote:
> Hi,
> 
> 
> I tried to wrote a conntrack rule for raw table.
> 
> ------------------------------------------------ .. .. 
> DNSTOP='10.10.1.1 10.11.1.1 10.199.10.1'
> 
> $IPSET create DNSTOP hash:net,iface family inet hashsize 1024
> maxelem 65536
> 
> $IPSET add DNSTOP 10.0.0.0/8,vlan1 $IPSET add DNSTOP
> 10.0.0.0/8,vlan2
> 
> for i in $DNSTOP do $IPSET add DNSTOP $i,vlan1 nomatch $IPSET add
> DNSTOP $i,vlan2 nomatch done
> 
> $IPTABLES -t raw -A PREROUTING  -m set --match-set DNSTOP dst,src
> -p udp -m udp --dport 53 -m conntrack --ctstate NEW -j STOPDNS .. 
> ..
> 
> num   pkts bytes target     prot opt in     out     source 
> destination 1        0     0            udp  --  *      *
> 0.0.0.0/0 0.0.0.0/0            match-set DNSTOP dst,src udp dpt:53
> ctstate NEW
> 
> ----------------------------------------------------
> 
> Simply, this will stop all NEW DNS querry coming from vlan1 and
> vlan2 except added IPs to $DNSTOP.
> 
> But, raw table cannot see the conntrack. I think it should be 
> understand from the conntrack table but I could not find any
> reference in MAN of iptables(-extentions) about conntrack and raw
> table and it gave no error. Simply not worked. It would be better
> to give an error or put a reminder on MAN pages.
> 
> 
> Best regards,
> 
> Husnu Demir. -- To unsubscribe from this list: send the line
> "unsubscribe netfilter" in the body of a message to
> majordomo@vger.kernel.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html
> 
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJSgIgWAAoJEISpBAM51qlEOXgIANeZAsSxkECha//cTDDxqIjX
vXy12dW110Ditcz9ibXDkhirRijk1blzYgOSfzh5fqEoJ4WP6YNv6kPrmAxW0QGO
P1ipfed4l6xx5f7RG9I8RymyQpItArdX8E3AavQgLH/ubGapRzDLwqUxEawboAXt
9D4RQEqQA6+bI8UPWpZE+6YKTKw2fpL9SdToaF+XRem6B5LZqVhlXFInaraEgvBC
DEy+ohJrsBdtICUKjlyFloqLQcRJduEqPU+00uPRxy3/y1/7yZ0LXU1oqwOSMHCP
L0Q1yu5i5frgRD/R62yKPwWATrHoEAVgNLufRrikTLv8cPtd/OsjnHK8x5++v1A=
=b8ZZ
-----END PGP SIGNATURE-----
