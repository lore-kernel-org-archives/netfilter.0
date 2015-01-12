From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Subject: Re: Stateless NAT with iptables
Date: Mon, 12 Jan 2015 20:06:31 -0200
Message-ID: <54B44567.2050707@gmail.com>
References: <alpine.LSU.2.11.1501100027160.13352@nerf60.vanv.qr> <SNT152-W95408B1CE91E099E55A7ADB8430@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=6yCRVTdijQ0wA5bmwQ50ZOiJqP1FACs4UmIgN1ofCAo=;
        b=QMnDqGr2TsiTRL/HxMwoIHWXAEp7PzvmcFXPczMug+iwxByhXDm7irsKCEhUd2m30R
         pXBir9NFV8hneyARFOCLjWkYEe4qeMwqP1jQCl7vnI2cmDHoDOYmYaUCzagWF29t+9ik
         4sW7JKVqw8omz9gKFTt66LhNpAHku2uUry7EYQBXGWJ4uE5QP14dMH3UQO55ktfs/FiP
         b8Szm1WnbOZsRRgTDcJ29LCJbRWMh498wqz5zzk/0q8AtG1q+sABoQnCv9sc7qqa45Pi
         +APi0mobuuTb8Xzn85rqqCQpy9liXXwv8iyaJXvCl8zfJR0tJTZHUE4v2VHLJjRNZr07
         LPTg==
In-Reply-To: <SNT152-W95408B1CE91E099E55A7ADB8430@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Glen Miner <shaggie76@hotmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 12-01-2015 16:49, Glen Miner wrote:
>> Rules are rather static, but your described scenario requires
>> rather dynamic changes. There is a much more targeted solution:
>>
>> Once your application decides it is time to switch, it needs to
>> change the conntrack entry for the UDP session. conntrack(8)
>> can be used, and there is also a C interface with
>> libnetfilter_conntrack.
>>
>> (With the conntrack command line utility, updating certain parameters is
>> not possible because of the program's way of option parsing. This
>> limitation may be gone in the C interface. With the command-line
>> utility, one could however recreate the entry, if the lack of atomicity
>> between the operations is bearable.)
>>
>> conntrack -D -p udp \
>> --src client_addr --dst stun_addr \
>> --sport client_port --dport stun_port
>> conntrack -I -p udp \
>> --src client_addr --dst stun_addr \
>> --sport client_port --dport stun_port \
>> --reply-src real_server_addr --reply-dst client_addr \
>> --reply-src-port real_server_port \
>> --reply-dst-port client_port
>>
>> At least, that is the general idea.. whether it works, or if it needs
>> additional commands, I have not tried.
>
> This is indeed an exciting alternative! It might make it possible to avoid connection tracking for all other regular traffic through this box too so I am quite excited!
>
> However, I've tried to get it to work and must be missing something subtle.
>
> In my test I'm hosting my clients on
>
> 10.0.1.7:5000 (Alice)
> ->
> 10.0.1.8 (Relay Server) port 5001 relayed to Bob via 5002
> ->
> 10.0.1.7:5003 (Bob)
>
> Using iptables (the old method) I create the NAT rules like this
>
> aAddr=10.0.1.7
> aPort=5000
> bAddr=10.0.1.7
> bPort=5003
> nAddr=10.0.1.8
> anPort=5002
> bnPort=5001
>
> iptables -t nat -I PREROUTING -p udp -s $aAddr --sport $aPort -d $nAddr --dport $bnPort -j DNAT --to $bAddr:$bPort
> iptables -t nat -A POSTROUTING -p udp -d $bAddr --dport $bPort -j SNAT --to $nAddr:$anPort
> iptables -t nat -I OUTPUT -p udp -s $aAddr --sport $aPort -d $nAddr --dport $bnPort -j DNAT --to $bAddr:$bPort
>
> I can see the connection with conntrack -L -p udp
>
> udp      17 24  src=10.0.1.7 dst=10.0.1.8 sport=5000 dport=5001 [UNREPLIED] src=10.0.1.7 dst=10.0.1.8 sport=5003 dport=5002           mark=0 use=1
>
> And Bob gets the packets and everything works.
>
> I tried repeating this experiment (without the complexity of the intermediate handshake, just by creating the connection manually:
>
> I cleared the nat rules from previous test with:
>
> iptables -t nat -F
>
> I flushed all udp tracked connections:
>
> conntrack -D -p udp
>
> Then I created the relay connection:
>
> conntrack -I -p udp \
> --src $aAddr --sport $aPort \
> --dst $nAddr --dport $bnPort \
> --reply-src $bAddr --reply-port-src $bPort \
> --reply-dst $nAddr --reply-port-dst $anPort \
> --timeout 600
>
> But my packets all bounce with ICMP Port Unreachable.
>
> I compared the conntrack -L -p udp output and it looked essentially the same.
>
> I also read the man page which suggested using this instead of --src/--dest
>
> --orig-src $aAddr --orig-port-src $aPort \
> --orig-dst $nAddr --orig-port-dst $bnPort \
>
> But the conntrack entry looks the same.
>
> It feels like some aspect of the firewall is not being informed of this state.
>
> I checked iptables -L, iptables -L -t nat, and -t raw and everything is empty.
>
> Can you think of something I've missed?

(be warned, I didn't read the full thread, sorry)

Having the conntrack entry is not enough to get your packets NATed and, 
AFAICT, you flushed the nat tables, so your packets are probably getting 
routed to the original destination with the original src info, despite the 
conntrack entry being there.

It's like: ok, packets like this are expected, but nothing is updating them to 
be like that..

   Marcelo

