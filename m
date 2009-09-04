From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: is there any module to track total connection ?
Date: Fri, 04 Sep 2009 13:12:14 +0530
Message-ID: <4AA0C4D6.1010207@infoservices.in>
References: <4A9E4E46.9000008@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A9E4E46.9000008@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

J. Bakshi wrote:
> Hello list,
>
> I am searching for a module which can track the total connection at any
> time and block  more incoming packets. Say dropping the new ssh
> connection if the total ssh connection is already 4. any such module in
> iptable ?
>   

I am answering my own question. the module is connlimit.  but it is not
working here properly. I have done as

`````````````
# default policy drop for in/out/forward#
###############################

iptables -A INPUT -p tcp --syn -i $IFACE --dport $SSH_PORT -m connlimit
! --connlimit-above 2 -j ACCEPT
``````````````

It should block ssh connection from same source IP if already 2
connections are active from that source. But it is not working as
expected. I can log in even 10 ssh with out any problem. Don't know what
might be wron. iptables version is v1.4.2-rc1 in suse 11 box. Any clue ?

Thanks
