From: Fatih USTA <fatihusta86@gmail.com>
Subject: Re: per source bandwidth limit with hashlimit
Date: Thu, 9 Mar 2017 08:21:17 +0300
Message-ID: <3901f2d5-c76f-5dc2-7589-a50cd86543ae@gmail.com>
References: <15d4f6da-0004-e2d3-5380-11fb2131ba48@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=/DCmiHmJZ28eD0Upu0isqXqJz5ZDTf1Uk4eBk96m3Pk=;
        b=gsMziw6Xpe4NESnLAS19YjqfvPJQdoAgdT5mSesokjHbKlRymufDcgie6FcgVzNL5v
         uE6Zu+GKkHQ47dVW3C6iPkxUbtlpkMkj38LqOYH56ygdjVAzHEWw7P9BBiCkRc/NSLZT
         3iSMjGTdomE8Zdrw2DombcN3jWJihFMxiRGgcUIvJ4yCX9K55+g0LxmWHVBqe72P3dYT
         gvKDonUi59IOYN9S8u2UQ8bNK6O0jgzACLaL5IL7SDYC0SE4B5kI9rKVgfFq4gGR9i1z
         0stFZ8DiHyY+AoGN3KhgqbLGONsspNTH2uPG9ix7iMP9+209xw3zdnsR9Td1f1JG4RJI
         KQEg==
In-Reply-To: <15d4f6da-0004-e2d3-5380-11fb2131ba48@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I Found my mistake.

I thought it was connection-based. I was wrong
The hashlimit is working towards the package direction.
I fixed this problem (-d 192.168.59.0/24 and --haslimit-mode dstip)

Thanks.

Fatih USTA

On 07-03-2017 15:47, Fatih USTA wrote:
> Hi
>
> I tried to use hashlimit to limit the bandwidth, for each ip address 
> on the 192.168.59.0/24 network. But did not work specified network 
> address or protocol.
>
> [~]# uname -r
> 4.4.0-64-generic
>
> [~]# iptables -V
> iptables v1.6.0
>
> [~]# lsmod | grep -i hashlimit
> xt_hashlimit           20480  2
> x_tables               36864  6 
> ip_tables,xt_tcpudp,xt_nat,xt_hashlimit,iptable_filter,iptable_mangle
>
>
>
> This command working. With tcp protocol
>
> iptables -t mangle -I PREROUTING -m tcp -p tcp -m hashlimit 
> --hashlimit-above 50kb/sec --hashlimit-burst 50kb --hashlimit-mode 
> srcip --hashlimit-name persource -j DROP
> iptables -t mangle -A PREROUTING -j RETURN
>
>
> This commands not working.
>
> without tcp protocol
>
> iptables -t mangle -I PREROUTING -m hashlimit --hashlimit-above 
> 50kb/sec --hashlimit-burst 50kb --hashlimit-mode srcip 
> --hashlimit-name persource -j DROP
> iptables -t mangle -A PREROUTING -j RETURN
>
> or with udp protocol
>
> iptables -t mangle -I PREROUTING -m udp -p udp  -m hashlimit 
> --hashlimit-above 50kb/sec --hashlimit-burst 50kb --hashlimit-mode 
> srcip --hashlimit-name persource -j DROP
> iptables -t mangle -A PREROUTING -j RETURN
>
> or not working with source network
>
> iptables -t mangle -I PREROUTING -s 192.168.59.0/24 -p tcp -m tcp -m 
> hashlimit --hashlimit-above 50kb/sec --hashlimit-burst 50kb 
> --hashlimit-mode srcip --hashlimit-name persource -j DROP
> iptables -t mangle -A PREROUTING -j RETURN
>
> and with hashlimit-srcmask
>
> iptables -t mangle -I PREROUTING -s 192.168.59.0/24 -p tcp -m tcp -m 
> hashlimit --hashlimit-srcmask 32 --hashlimit-above 50kb/sec 
> --hashlimit-burst 50kb --hashlimit-mode srcip --hashlimit-name 
> persource -j DROP
> iptables -t mangle -A PREROUTING -j RETURN
>
>
> Do you have any idea this case?
>
> Thanks.
>
>

