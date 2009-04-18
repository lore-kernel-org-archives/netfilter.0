From: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Subject: Re: Learning iptables
Date: Sat, 18 Apr 2009 22:48:42 +1000
Message-ID: <49E9CC2A.3040506@standarduniversal.com.au>
References: <49E9C87A.1030509@veltrac.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49E9C87A.1030509@veltrac.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Leonardo Carneiro <lscarneiro@veltrac.com.br>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

the only reason I would think is to allow packets through for the 
milliseconds it takes the script to run.

regards

Brian


Leonardo Carneiro wrote:
> Hi everyone,
>
> I'm have a avarage-to-good linux knowlegde, but i'm quite noob when it 
> comes about iptables, so i decided to study about.
> I'm reading a lot of articles and blogs, and testing some rules, so 
> far it's all going well.
> Right now i'm running a server with tons of rules written by the admin 
> that worked here before me, and in the policies session of the script 
> i've found theses rules:
>
>    $IPTABLES -P INPUT ACCEPT
>    $IPTABLES -P OUTPUT ACCEPT
>    $IPTABLES -P FORWARD ACCEPT
>    $IPTABLES -F
>    $IPTABLES -t nat -F
>    $IPTABLES -t mangle -F
>    $IPTABLES -X
>
>    $IPTABLES -A INPUT -s $LO_IP -j ACCEPT
>    $IPTABLES -A OUTPUT -d $LO_IP -j ACCEPT
>    $IPTABLES -A INPUT -s $LAN_IP -j ACCEPT
>    $IPTABLES -A OUTPUT -d $LAN_IP -j ACCEPT
>    $IPTABLES -A INPUT -s $INET_IP_DIN -j ACCEPT
>    $IPTABLES -A OUTPUT -d $INET_IP_DIN -j ACCEPT
>
>    $IPTABLES -P INPUT DROP
>    $IPTABLES -P OUTPUT ACCEPT
>    $IPTABLES -P FORWARD DROP
>
> Is there any good reason why someone would set an ACCEPT policy for 
> all chains first to withdraw some later? What the benefit of doing this?
>
> Sorry about my poor english.
>
> Tks in advance
