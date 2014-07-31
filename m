From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: firewalld and iptables
Date: Thu, 31 Jul 2014 16:14:16 +0200
Message-ID: <53DA4F38.4030906@familie-kuntze.de>
References: <1406813861186.50144@greenberg.pro>,<53DA4AA4.8030202@conversis.de> <1406815954123.1965@greenberg.pro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1406815954123.1965@greenberg.pro>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Greenberg <paul@greenberg.pro>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

You should also disable firewalld:
systemctl disable firewalld

Regards,
Noel Kuntze

GPG Key id: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658
Am 31.07.2014 um 16:12 schrieb Paul Greenberg:
> Thank you Denis.
>
> In case someone needs this:
>   systemctl status iptables
>   systemctl stop firewalld
>   yum -y install iptables-services
>   systemctl enable iptables
>   systemctl start iptables
>
> ________________________________________
> From: netfilter-owner@vger.kernel.org <netfilter-owner@vger.kernel.org> on behalf of Dennis Jacobfeuerborn <dennisml@conversis.de>
> Sent: Thursday, July 31, 2014 9:54 AM
> To: Paul Greenberg; netfilter@vger.kernel.org
> Subject: Re: firewalld and iptables
>
> On 31.07.2014 15:37, Paul Greenberg wrote:
>> Hi,
>>
>> I installed CentOS 7 a few days ago. It seems that iptables commands are still working.  For example, I can still execute:
>> $ iptables-restore iptables.rules
>> However, I am unable to permanently store the rules.
>>
>> CentOS has a new deamon, called firewalld, with firewalld.conf file. Does any one know how how to force the rules in iptables-save to be permanently saved by firewalld daemon?
>
> You cannot use manual iptables and firewalld together. If you want to
> use naked iptables you have to disable the firewalld service completely
> and probably install the iptables-service package.
>
> Regards,
>   Dennis
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJT2k84AAoJEDg5KY9j7GZYEkUP/1uCPbY/Ax9IPJNxrqb6cjwi
LQVWdibPqO1sG6rgqpBJCggBNd05et54XgV0RTq0ZB2ToZOkm1uebrKXzyQA8Am4
f9G+lK0GOG0QuzaAQiTy2+M00Ihh8Rg3RWd7qzEGepZrx4TCQFHAtJnZ8lHrmil0
HJARcwjlYChdAk+qnIHnPsUZ+i94kyhM3Q2Okhz4T+sRlRdKtM7KV/UCpvDRmNcE
VbpD4Zmh3bgt0a48goslA4bwHdogiHzZgUaEPQws4yBGxOUAhlhWlGQb8yvONG9A
aLzxSJ565m2NpUlEsObVDI5Qr5Umk6O80v1FPpo7RSPZYPY4DHj2gzuJmYH8RsG/
L9AJDlZyj+T2f3rTW9vd4Kp3mTrzWDrsg0ZgXy59Ow1TLaibIFrH+MwqTYBKbN2b
hyt3F7qd71wW+I+UPphSnlfrEo1vD2nY4o0k4/WvPpFXzqUlxMdvqI2kdOyoN2LM
NvzBqvbb3LwTnZRCc0FBqslDKkVsxosC012TZVp2IKaKcT2KisfIfIkZ7MGT7xD5
Q2Wfz7xbmbQXf9ZURyfBmGV9O4SxZWHZBU/4GBBYdiop1yjBOG0u8gtShmm8Nwf7
PdMAqq0r4P9rHslGypqdttm5Cx2nZiXfkqKB3vlJ6FQBSw4G84dfsiN/ygdOPp1D
ZT7sNQJYqLIfE3oqobQN
=OnEs
-----END PGP SIGNATURE-----

