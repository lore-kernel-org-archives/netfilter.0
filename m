From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: ip forwarding issue with dual gateway
Date: Mon, 09 Nov 2009 08:40:38 +0530
Message-ID: <4AF7882E.5090307@infoservices.in>
References: <4AF4008C.8070204@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AF4008C.8070204@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

J. Bakshi wrote:
> Hello,
>
> First of all I request you to bear with me as I am not a network guru.
>
> I have two lan cards in my server which is used to share internet
> connection with the help of iptables. The config is as below
>
> ``````````````````````````````````
> echo 1 >  /proc/sys/net/ipv4/ip_forward
>
> iptables -A FORWARD -i ${WAN_IFACE} -o ${LAN_IFACE} -s 192.168.0.0/24 -m
> conntrack --ctstate NEW -j ACCEPT
> iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
> iptables -A POSTROUTING -t nat -j MASQUERADE
> ~~~~~~~~~~~~~~~~~~~~~~~~
>
> The setup is working well.  I have one more internet connection which is
> cable based so no modem. Hence I again need 2 cards one to connect with
> the ISP and forward it to another card which will act as gateway ; just
> like above config. The question is shall I follow the above
> configuration for the second internet connection ? Is there any
> possibility of conflict between the two connection then ? I don't need
> any load balancing setup but a setup where I can get the two internet
> connections separately.  Please enlighten me. Thanks
> --
>   

any suggestion please ?


