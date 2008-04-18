From: Fabio De Paolis <fabiodepaolis@naxe.it>
Subject: Re: NAT Port Forward problem in a not so simple network
Date: Fri, 18 Apr 2008 15:43:03 +0200
Message-ID: <4808A567.5090507@naxe.it>
References: <480479E8.3040904@naxe.it> <4804C25C.7020608@riverviewtech.net> <4804D643.2090101@naxe.it> <4804DBB9.7030307@riverviewtech.net> <4806052A.6020301@naxe.it> <48060E8C.5010804@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48060E8C.5010804@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Grant Taylor ha scritto:
>
>> Yes on my knowledge I know that it can't be done without doubling the 
>> traffic on the net. I was wondering if at yuor knowledge the was 
>> another way. Of course if I could nat a port from A to B it would be 
>> easy and the traffic will me at minimum, but it cant be done. I was 
>> wondering if there was a way to use C only for initial handshake and 
>> not for all packets, but it seems no.
>
> Strictly speaking, on layer 3, no there is not any thing (that I am 
> aware of) that can be done.  However if you are willing to go down to 
> in between layers 2 and 3 or even down to layer 2 there might be 
> something that can be done.
>
>          +---+
>          | Z |
>          +-+-+
>            |
>            :       (INet)
>            |
>          +-+-+
> =========| A |============
>          +-+-+
>            |
>    +---+---+---+   (DMZ)
>    |   |       |
>    | +-+-+   +-+-+
> ===|=| B |===| C |========
>    | +-+-+   +---+
>    |   |           (LAN)
>    | +-+-+
>    +-+ D |
>      +---+
>
> I'm guessing that there are other services on C that prevent you from 
> moving it's IP to B.  Correct?
>
> I'm not sure how well this will work out (read:  I don't know how well 
> the Cisco will play in this game...) but you might be able to 
> establish some sort of tunnel based forwarding from C to D so that 
> inbound requests pass through the tunnel and replies go directly from 
> D back out via A to the client.
>
> Let's say for the sake of discussion that you add a connection from D 
> back in to the DMZ (as above) and have this interface configured to 
> *NOT* respond to ARP requests.  If you do this, you could have the 
> same IP bound to C as well as the new DMZ facing interface on D.  With 
> this type of set up, you could tunnel traffic from C to D via B and 
> have D reply directly back with out passing through B or C.
>
> In short, this is using the IP Tunnel mode of Linux Virtual Server to 
> turn C in to a director for the single node back end.  As such, your 
> client Z would connect to Ae which is port forwarded to Ce which is 
> tunnel to D which processes and replies to the client from the same IP 
> as Ce.  This means that A will send traffic to the IP that is bound to 
> Ce and get replies from the same IP only bound to D's DMZ interface. 
> The only difference that A should see is a different MAC address as 
> the source for the reply traffic.  However, if you spoof the MAC 
> address, this will not be a problem.  If you do spoof the MAC address 
> you will need to do something like GARP to make sure the DMZ switch 
> does not ""learn that the location of the shared MAC address is where 
> D's DMZ interface is connected.
>
Thank you for the lesson.

D is too far from C's switch *sad*
and I think I can't add another cable
