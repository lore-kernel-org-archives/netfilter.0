From: J Webster <webster_jack@hotmail.com>
Subject: Re: good tutorial
Date: Sat, 5 Feb 2011 20:33:10 +0100
Message-ID: <BLU0-SMTP140C2CE9F593F7CCFDC80F0F3E90@phx.gbl>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>	 <20110203120131.38cd818d@catus> <4D4C0B8F.10005@unipex.it>	 <20110205155829.3a5ebc7b@catus> <1296923860.1695.20.camel@andybev>	 <BLU0-SMTP7495DFC8C5F2213D76D1D2F3E90@phx.gbl> <1296933724.1617.10.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1296933724.1617.10.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

Thanks.
Out of interest will this only limit connects incoming to the server and 
not outgoing?
For example, a user connects via VPN to the server, their connection 
should be limited to 2Mbps (3in the example below) but they are 
connecting to say www.youtube.com. I do not want the connection to 
youtube.com to be restricted as maybe 10 users might be accessing 
youtube at the same time.
So the server can have an unlimited outgoing connection to youtube but 
when it passes on the connection to the client (much like a proxy server 
might do), they should only have 2Mbps.

Now the reason I asked for a tutorial somewhere is I went through the 
LARTC tutorial (which just looks like a blank white document) and my 
understanding of leaf, HTB, U32, qdisc, etc is kind of lacking :)

On 05/02/11 20:22, Andrew Beverley wrote:
> On Sat, 2011-02-05 at 17:48 +0100, J Webster wrote:
>> Does anyone have a tutorial recommendation for tc?
>> I tried the existing tutorials on LARTC and they were all lacking
>> examples - also the pages look like they were written 10 years ago.
>> I want to limit bandwidth per ip address on my server.
> If you check the archives there's a discussion going on right now about
> this...
>
> You can use a classful qdisc such as HTB, create a leaf for each IP
> address, then filter into that leaf using the U32 filters.
>
> Something like this (untested - I've only copied from the list
> archives):
>
>
> tc qdisc add dev eth0 root handle 1: htb r2q 1
> tc class add dev eth0 parent 1:0  classid 1:1 htb \
> 	rate 3000kbit ceil 3000kbit
>
> tc class add dev eth0 parent 1:1 classid 1:100 htb \
> 	rate 1500kbit ceil 1500kbit prio 3
> tc filter add dev eth0 parent 1: protocol ip u32 \
> 	match ip dst 172.16.254.1/32 classid 1:100
> tc qdisc add dev eth0 parent 1:100 handle 100: sfq perturb 2
>
> tc class add dev eth0 parent 1:1 classid 1:101 htb \
> 	rate 1500kbit ceil 1500kbit prio 3
> tc filter add dev eth0 parent 1: protocol ip u32 \
> 	match ip dst 172.16.254.2/32 classid 1:101
> tc qdisc add dev eth0 parent 1:101 handle 101: sfq perturb 2
>
> ...
>
>
> You'll need a leaf class for each IP address, and all the leaf classes
> should add up to the parent.
>
> By the way - please start a new email when starting a new thread. If you
> reply to a previous email and change the subject then your email will
> still appear in the original thread in the message archives.
>
> Andy
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>

