From: Peter Renzland <peter@dancing.org>
Subject: Re: (Ab)using iptables to record byte count per IP?
Date: Fri, 9 Jan 2009 11:36:05 -0500
Message-ID: <99A3E82B-E585-44D2-963F-FBD0A7CE6947@dancing.org>
References: <2d460de70901090327y625afd60g792467e843d3f1d@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2d460de70901090327y625afd60g792467e843d3f1d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

I do this to set up:

for SD in s d; do
iptables -N traffic_$SD
iptables -I FORWARD -j traffic_$SD
for IP in 100 103 105 108 120 122 124 126 130 132; do # adjust?
  iptables -A traffic_$SD -$SD 192.168.0.$IP # adjust?
done
done

And to collect:

# Traffic Accounting to be run Hourly at HH:59 -- Planiwa 2009.01.06
# Appends to file /var/traffic/CCYYMM a line: CCYYMMDD.HH [IP-suffix  
dst-MB src-MB] ...

[ -d /var/traffic ] || mkdir /var/traffic; cd /var/traffic
set -- $(date '+%Y%m %d.%H'); CCYYMM=$1; DDHH=$2
sleep 59

for SD in s d;do iptables -L -Z traffic_$SD -vnx;done | awk '
BEGIN {MB=2^20;KB=2^10; PRECISION=MB; SUBNET="192.168."} # adjust?
$8 ~ SUBNET {if ($1!=0) D[substr($8,11)]=$2; next}
$7 ~ SUBNET {if ($1!=0) S[substr($7,11)]=$2; next}
END {
printf "%s%s ", "'$CCYYMM'", "'$DDHH'"
for (IP in D)if((D[IP]>=PRECISION/2)||(S[IP]>=PRECISION/2))
  printf("%s %d %d ",IP,D[IP]/PRECISION+.5,S[IP]/PRECISION+.5);print  
"" # MB
}' >>$CCYYMM

Adjust as needed.

tail -20 /var/traffic/200901
20090108.10 100 49 5 122 50 3 124 18 1 126 36 1
20090108.11 100 3 0 122 156 46 124 247 6 108 20 3 126 6 0
20090108.12 122 372 155 124 282 6 108 5 1
20090108.13 100 0 6 122 318 176 124 56 2 126 1 0
20090108.14 122 324 210 124 34 2 126 28 1
20090108.15 122 171 252 124 35 2 108 11 3 126 26 1
20090108.16 100 0 1 122 8 249 124 74 3 108 19 4 126 13 1
20090108.17 122 6 224 124 114 4 108 33 3 126 72 2
20090108.18 122 5 151 124 36 1 126 1 0
20090108.19 100 1 11 122 18 72 126 28 0
20090108.20 100 0 1 122 5 1 108 8 2
20090108.21 100 1 1 122 98 3 108 16 2
20090108.22 120 133 3 108 10 2
20090108.23 100 1 8 122 144 5 108 60 2
20090109.00 100 0 3 122 21 2 108 49 3
20090109.01 100 0 3 122 1 1 124 11 1 108 23 3 126 14 1
20090109.02 124 21 1 108 26 4 126 5 1
20090109.03 100 5 73 108 4 1
20090109.04 100 0 5
20090109.05


I understand that current iptables has -m account, with separate  
counters by protocol, long and short stats.

But I only have v1.3.7 on 2.4.20 -- Tomato on a WRT54GL router.

Peter Renzland





On 09  Jan 9, at 06:27 , Richard Hartmann wrote:

> Hi all,
>
> I need to log the traffic each local IP in a NAT'ed network generates
> per day.
>
> Unfortunately, the environment is rather restricted and compiling new
> software is not an option. Thus, I am wondering if I can abuse  
> iptables,
> which is in use anyway, to log for me, as well.
>
> The end result should be a log which contains IP, date and traffic
> generated. I don't really care about the output format as I will  
> perl it
> into the format I need, anyway.
>
>
> Thanks for all input,
> Richard
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter"  
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

