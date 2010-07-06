From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: iptables not forwarding port 443
Date: Tue, 06 Jul 2010 20:08:29 +0200
Message-ID: <4C33711D.9060307@freemail.hu>
References: <BAY145-w560F4D16A39DD1B39B1A1FF3B20@phx.gbl>,<4C336248.8060700@freemail.hu> <BAY145-w1402AA6231A6B64AC93F23F3B20@phx.gbl>,<4C336757.5080100@freemail.hu> <BAY145-w19572F836A9A64C0737FC2F3B20@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY145-w19572F836A9A64C0737FC2F3B20@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "J. Webster" <webster_jack@hotmail.com>
Cc: netfilter@vger.kernel.org


> Hi
> Thanks.
> No, there is no proxy in the middle in this testing case, I believe that's why the packets are received at port 443 on the server but then somehow dropped.
>    
Could you check it??? iptraf or tcpdump??? (Just to get sure!)
> Is there anything wrong with the iptables rules that might stop this?
>
>    

I do not understand these rules:

#filter:

-A OUTPUT -d xx.xxx.xxx.199 -p tcp -m tcp --dport 1194 -m state --state NEW -j ACCEPT
-A OUTPUT -d xx.xxx.xxx.199 -p tcp -m tcp --dport 443 -m state --state NEW -j ACCEPT

OUTPUT is generated on localhost...

Destination xx.xxx.xxx.198 and xx.xxx.xxx.199... Hmm... Do you really want to send the VPN packets back to yourself???

-A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

ACCEPT everything?


#nat

-A OUTPUT -d xx.xxx.xxx.199 -p tcp -m tcp --dport 443 -j REDIRECT --to-ports 1194
-A OUTPUT -d xx.xxx.xxx.199 -p udp -m udp --dport 443 -j REDIRECT --to-ports 1194

What do you expect from these rules?


>> It is a bit dangerous to use 443/tcp for vpn...
>>      
> It was recommended by the OpenVPN users list.
>    
Interesting... :D
>> But you can
>>      
>   set up 2 services on the same host...
> Yes, I could but that makes an administration problem to do with status logs and other stuff I think.
>    
It depends on you... I have 5 vpn services on the same host. (LDAP/PAM 
authentication integrated.)

Swifty
