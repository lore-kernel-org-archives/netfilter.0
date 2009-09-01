From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: Hot to design syn-flood protection based on ip ?
Date: Tue, 01 Sep 2009 11:58:55 +0530
Message-ID: <4A9CBF27.1070600@infoservices.in>
References: <4A967DE2.2060601@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A967DE2.2060601@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

J. Bakshi wrote:

Any clue ?


> Hello list,
>
> I have finally  come to know the bad effect of syn-flood protection.
>
> ``````````````````````
> iptables -N syn-flood
> iptables -A INPUT -i $IFACE -p tcp --syn -j syn-flood
> iptables -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
> iptables -A syn-flood -j DROP
> ```````````````````````````
>
> The codes above drops the packets blindly if a single host initiate a
> syn-flood and as a result other hosts can't get the ports.  Is there a
> way to modify the rules so it drop the packets from the host which is
> sending the syn-flood packets ?
>
> eagerly waiting for a response.
> Thanks
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

