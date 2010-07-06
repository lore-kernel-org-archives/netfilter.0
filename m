From: "J. Webster" <webster_jack@hotmail.com>
Subject: RE: iptables not forwarding port 443
Date: Tue, 6 Jul 2010 19:23:30 +0100
Message-ID: <BAY145-w64EEAA753CC10B4382C06BF3B20@phx.gbl>
References: <BAY145-w560F4D16A39DD1B39B1A1FF3B20@phx.gbl>,<4C336248.8060700@freemail.hu>
 <BAY145-w1402AA6231A6B64AC93F23F3B20@phx.gbl>,<4C336757.5080100@freemail.hu>
 <BAY145-w19572F836A9A64C0737FC2F3B20@phx.gbl>,<4C33711D.9060307@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C33711D.9060307@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: swifty@freemail.hu
Cc: netfilter@vger.kernel.org


[root ~]# tcpdump -i eth0 -p tcp and port 443

tcpdump: verbose output suppressed, use -v or -vv for full protocol 
decode

listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes

03:30:59.514704 IP modemcable1xx.xxx-81-70.mc.videotron.ca.24682> 
serverxx-xxx-xxx-199.live-servers.net.https: S 204510893:204510893(0) 
win 65535 <mss 1460,nop,nop,sackOK>

03:31:02.556916 IP modemcable1xx.xxx-81-70.mc.videotron.ca.24682> 
serverxx-xxx-xxx-199.live-servers.net.https: S 204510893:204510893(0) 
win 65535 <mss 1460,nop,nop,sackOK>

03:31:08.566818 IP modemcable1xx.xxx-81-70.mc.videotron.ca.24682> 
serverxx-xxx-xxx-199.live-servers.net.https: S 204510893:204510893(0) 
win 65535 <mss 1460,nop,nop,sackOK>

03:31:25.538953 IP modemcable1xx.xxx-81-70.mc.videotron.ca.24683> 
serverxx-xxx-xxx-199.live-servers.net.https: S 1489105891:1489105891(0) 
win 65535 <mss 1460,nop,nop,sackOK>

03:31:28.383241 IP modemcable1xx.xxx-81-70.mc.videotron.ca.24683> 
serverxx-xxx-xxx-199.live-servers.net.https: S 1489105891:1489105891(0) 
win 65535 <mss 1460,nop,nop,sackOK>

The OUTPUT are to allow traffic to go out from the server on certain ports.
I guess it should be source not -d?

-A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
ACCEPT everything?
Isn't it blocked in the rules above? I think I have a drop all packets apart from those in the list.
>
>
> -A 
OUTPUT -d xx.xxx.xxx.199 -p tcp -m tcp --dport 443 -j REDIRECT 
--to-ports 1194
> -A OUTPUT -d xx.xxx.xxx.199 -p udp -m udp 
--dport 443 -j REDIRECT --to-ports 1194
> What do you 
expect from these rules?
To allow out tcp or udp traffic from the VPN server. I guess it's not needed.


----------------------------------------
> Date: Tue, 6 Jul 2010 20:08:29 +0200
> From: swifty@freemail.hu
> To: webster_jack@hotmail.com
> CC: netfilter@vger.kernel.org
> Subject: Re: iptables not forwarding port 443
>
>
>> Hi
>> Thanks.
>> No, there is no proxy in the middle in this testing case, I believe that's why the packets are received at port 443 on the server but then somehow dropped.
>>
> Could you check it??? iptraf or tcpdump??? (Just to get sure!)
>> Is there anything wrong with the iptables rules that might stop this?
>>
>>
>
> I do not understand these rules:
>
> #filter:
>
> -A OUTPUT -d xx.xxx.xxx.199 -p tcp -m tcp --dport 1194 -m state --state NEW -j ACCEPT
> -A OUTPUT -d xx.xxx.xxx.199 -p tcp -m tcp --dport 443 -m state --state NEW -j ACCEPT
>
> OUTPUT is generated on localhost...
>
> Destination xx.xxx.xxx.198 and xx.xxx.xxx.199... Hmm... Do you really want to send the VPN packets back to yourself???
>
> -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
>
> ACCEPT everything?
>
>
> #nat
>
> -A OUTPUT -d xx.xxx.xxx.199 -p tcp -m tcp --dport 443 -j REDIRECT --to-ports 1194
> -A OUTPUT -d xx.xxx.xxx.199 -p udp -m udp --dport 443 -j REDIRECT --to-ports 1194
>
> What do you expect from these rules?
>
>
>>> It is a bit dangerous to use 443/tcp for vpn...
>>>
>> It was recommended by the OpenVPN users list.
>>
> Interesting... :D
>>> But you can
>>>
>> set up 2 services on the same host...
>> Yes, I could but that makes an administration problem to do with status logs and other stuff I think.
>>
> It depends on you... I have 5 vpn services on the same host. (LDAP/PAM
> authentication integrated.)
>
> Swifty
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
 		 	   		  
_________________________________________________________________
http://clk.atdmt.com/UKM/go/197222280/direct/01/
Do you have a story that started on Hotmail? Tell us now