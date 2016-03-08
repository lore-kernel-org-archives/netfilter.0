From: Alex Barylo <abarylo@gmail.com>
Subject: Re: Rewriting target IP and port on Linux with iptables or firewall-cmd
Date: Mon, 7 Mar 2016 16:25:45 -0800
Message-ID: <CAG8kwsp8Yr8=ThohNe50r1z5UgdrUU+nQ_4sTHvCE85q7BxqGg@mail.gmail.com>
References: <CAG8kwsqB_MPq5JX_yyw6+s4hZd5p=tfg=cN_MQ=fejD-7rQKoA@mail.gmail.com>
	<alpine.DEB.2.20.1603050130390.24095@aurora.sdinet.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc;
        bh=yTDuAS34zYLfQNB/6pNDWJXRib4AK6eTO2JT7nMtx1E=;
        b=cRzWbwXgHYxP3b02UsTVCtLn6M/D+1muQr9uKMbHODrgZ6UJy9JsvM4L54CCBlRvB5
         0AEwcP74Er4c2qpvE4ubmSeWwl+duIHAohLnrnml7wZxHuG7eWRTpehUIFecxzX5Jk7a
         CwadDP55HuKhecHRQfLTBYO4oPXC7sj9u0GAx4Lln7ZbQB2Y5hpYDxo/ir3a9W9PXXY9
         5YsWGoWVxiXBDyVWNlEao+t5AnvP1HE3Dtch8WyIsdXElOvnYx6N+XStBfMySm58cFTK
         S2jKxYx4aeU2guwKwZN9Kh/XtaqZliq/18ePw+6ikc65BQ3MYV/tCJYDKZNBtlXtsbo4
         DOpw==
In-Reply-To: <alpine.DEB.2.20.1603050130390.24095@aurora.sdinet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sven-Haegar Koch <haegar@sdinet.de>
Cc: netfilter@vger.kernel.org

On Fri, Mar 4, 2016 at 4:32 PM, Sven-Haegar Koch <haegar@sdinet.de> wrote:
> On Fri, 4 Mar 2016, Alex Barylo wrote:
>
>> I have a server in a DC1 with a private IP, of say 10.10.10.10. This
>> IP is NAT'd to a public IP, say 216.58.219.10 in this way:
>>
>> 216.58.219.10:8090 -> 10.10.10.10:8089
>>
>> I have a server in DC2 which knows about (and wants to connect to)
>> 10.10.10.10:8089 but doesn't know about 216.58.219.10:8090 (long
>> story).
>>
>> So I want to rewrite dest IP/port from 10.10.10.10:8089 to 216.58.219.10:8090.
>>
>> This is what I tried:
>>
>> # sysctl net.ipv4.ip_forward=1
>> # iptables -t nat -A PREROUTING -p tcp --dest 10.10.10.10 --dport 8089
>> -j DNAT --to 216.58.219.10:8090
>
>> Any pointers are greatly appreciated.
>
> Try adding the same rule also to the nat OUTPUT chain.
>
> iptables -t nat -A OUTPUT -p tcp --dest 10.10.10.10 --dport 8089 -j
> DNAT --to 216.58.219.10:8090
>

Excellent (winning!) idea, Sven-Haegar - thank you! I did try adding
to OUTPUT instead of PREROUTING before I posted here and it didn't
work. But when I added to both - voila!

Here is the script, in case you need to add more than one port and you
hate repeating (almost) the same line.

#!/bin/bash

PATH=/bin:/usr/bin:/user/local/bin:/sbin:/usr/sbin:/usr/local/sbin

REMOTE_PUB_IP=<your_public_ip_here>
REMOTE_PUB_PORT=(8089 8090 8091)

REMOTE_PRV_IP=(your_private_ips_here, separated by space)
REMOTE_PRV_PORT=(8089 8089 8089)


run_cmd () {
    if [[ -z "$DEBUG" ]]; then
        $*
    else
        echo $*
    fi
}


# Enable IP forwarding
sysctl net.ipv4.ip_forward=1

# Flush all NAT rules
iptables -t nat -F

(( max_index = ${#REMOTE_PUB_PORT[*]} - 1 ))
for i in $( seq 0 $max_index ); do
    run_cmd "iptables -t nat -A PREROUTING -p tcp --dest
${REMOTE_PRV_IP[i]} --dport ${REMOTE_PRV_PORT[i]} -j DNAT --to
${REMOTE_PUB_IP}:${REMOTE_PUB_PORT[i]}"
    run_cmd "iptables -t nat -A OUTPUT     -p tcp --dest
${REMOTE_PRV_IP[i]} --dport ${REMOTE_PRV_PORT[i]} -j DNAT --to
${REMOTE_PUB_IP}:${REMOTE_PUB_PORT[i]}"
done
