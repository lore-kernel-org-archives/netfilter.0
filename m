From: "Leonid Zeitlin" <lz@csltd.com.ua>
Subject: Re: IPTables : How to force data coming from ethX being output by the same device
Date: Wed, 23 Apr 2008 17:49:47 +0300
Message-ID: <funiac$l5i$1@ger.gmane.org>
References: <c4ecb9830804230703q3f3cc02doc03c34a293d6014c@mail.gmail.com>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi Yves,
I'm not sure I understand your problem completely, but sounds like your 
situation is similar to the one described in Linux Advanced Routing and 
Traffic Control HOWTO section 4.2 here: 
http://lartc.org/howto/lartc.rpdb.multiple-links.html. Try to follow the 
instructions in section 4.2.1 "Split access", this might be what you need.

Thanks,
  Leonid


"Yves DUF" <yves.duf@gmail.com> ???????/???????? ? ???????? ?????????: 
news:c4ecb9830804230703q3f3cc02doc03c34a293d6014c@mail.gmail.com...
> Hello World.
>
> Not totally dumb with iptables (I know how to build a simple
> firewall), I'm far from being an expert. I got a quite simple need,
> but the more I try to build it, the less I understand how to do it :={
>
> ==============================
> Let me explain my configuration :
> ==============================
> I got a GNU/Linux server, with two Ethernet boards, for hosting on FTP 
> server.
> Here is a simplified diagram of my network :
>
>    FTP Server     <=>                Netasq FireWall Router
>    <=>       FTP client
>   _________                ________________________________
>  | eth0/ IP1a | _______ |  Dev 1
>       |                   _________
>  |                 |              |  + IP1b
>                 |                  |   Client    |
>  |                 |              |
>     Dev 3       |  ________  |  + IP3a    |
>  | eth1/ IP2a |________|  Dev 2                              + IP3b
>   |                  |_________|
>  | _________|              |  + IP2b
>          |
>                                  |________________________________|
>
> The 3 sub-networks IP1 IP2 and IP3 are different. All the routing are
> direct (no NAT/DNAT).
>
> Some others constraints:
> - I can not use two hosts for FTP server, neither another hardware
> - I can not use NAT/DNAT inside the Netasq Firewall.
>
> ==============================
> The issue :
> ==============================
> The FTP client from IP3a arrives to router IP3b. It redirect the
> packet to the good aimed wire (IP1a or IP1b). So the FTP server
> receive the connection from the good link.
> When the FTP server wants to answer, it aims IP3a. But it doesn't know
> which device to use (eth0 or eth1). So it use the default gateway (if
> that case let say eth0).
> The whole stuff works if I do ftp to IP1a. But when I do ftp IP2a, the
> answer comes back through IP1b. And the firewall blocks it because
> it's not an authorized transfer.
>
> ==============================
> The mighty solution :
> ==============================
> I think that iptables on the GNU/Linux FTP server would be a good
> solution, to do a sort of "ftp contracking". But I don't manage to
> write a simple rule as "All traffic that comes from ethX will output
> by ethX"
> Does somebody got ideas on this subject (iptables or whatever else)?
>
> Regards.
> Yves
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 



