From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Fri, 16 Jan 2015 03:53:42 +0100
Message-ID: <m99ufm$p8k$1@ger.gmane.org>
References: <CAJb3rWB-MCW_U3NMNNo-yUnRH1LWCFxs_aeT-oAP=JvVWBpfRw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJb3rWB-MCW_U3NMNNo-yUnRH1LWCFxs_aeT-oAP=JvVWBpfRw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

The Media Server wrote, On 01/16/2015 03:45 AM:
> Yes sorry for my english.
>
> I will do more experiment and I understand it is pretty complicated indeed.
>
> Just to clarify.. when I type my public ip address on a browser. I get
> a time out error.
> But I can see my packets marked, and my tcp connection trying to acces
> in tcpdump port 80 like so:
> 21:35:32.336899 IP xxx.xxx.xxx.xxx.com.54727 > 192.168.2.20.http:
> Flags [S], seq 1143628041, win 8192, options [mss 1352,nop,wscale
> 8,nop,nop,sackOK], length 0
>
> but when i add this rule ( to go straight in my table ht (2) for
> incoming connections)
> ip rule add from 192.168.2.0/24 table ht
> I mean when, in a web browser I type my public ip, it works, no time
> out error and i see my html content. The connection work.
>
> thks!
>
>
>> Does ssh login to your host from another host work? Ie.:
>> ssh -p22 username@hostname_or_ip
>> (change 22 if your ssh-server on your host is operating at an other port)
>
> it works on my network 192.168.2.20 from another computer
> but not if I try to connect with my public ip address from another computer
>
> but it works with public ip with this rule:
> ip rule add from 192.168.2.0/24 table ht
>
>
> ** my gateway address is my router

Then maybe you forgot to open and forward the port on the router?
Try it with ssh. If that works then the rest is analogous, ie. it should then 
work too.


