From: zrm <zrm@trustiosity.com>
Subject: Re: Differences in FTP-Handling (Client-Sender) between
 iptables/nftables?
Date: Tue, 23 Jan 2018 11:27:06 -0500
Message-ID: <c8909477-a31e-8c8e-fa55-ad0076da2f36@trustiosity.com>
References: <39761b3a-f5d8-0924-bd97-4208a24e257c@raspi1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
        s=mx; t=1516724831; bh=CiZhNv3OY4YW3owafXsALnWfRJ9gwFN5z0HfLqGVRlk=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=GquuvFdxMdNnOL/igxwXZOnTa+4KKP8JKz5+gDxQIX9bJpHJ24T8qsA/IzjhJt3ji
         AQdI4EtrNzgrVCFBHuzvD/fxbghpzFEUrTH6HoVfG17EwiRH0UU1lstkNoi4yc02S+
         gT1u4PhJLpbNkjzk+nEWeP2OWBodZLYzN7dvEsX0=
In-Reply-To: <39761b3a-f5d8-0924-bd97-4208a24e257c@raspi1>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "toml@thlu.de" <toml@thlu.de>, netfilter@vger.kernel.org

On 01/23/2018 09:45 AM, toml@thlu.de wrote:
> Hello @ all
> 
> A week ago I changed my iptables to nftabls for testing purposes.  Yeah, 
> nftables
> have really gotten better, i like it. My rules follow the premise, 
> everything is
> forbidden, which is not expressly allowed. But now I have an unsolvable 
> problem
> with understanding some of the interrelationships. This is a question 
> for which
> there seems to be no answer on the web: Is there a difference in the 
> handling of
> FTP-Ports between iptables and nftables...  from the perspective of a 
> sending client?
> 
> This is my old basic-schema for iptables:
> Chain INPUT (policy DROP 2391 packets, 301K bytes)
> num target   prot opt in   out  source      destination
> 1   ACCEPT   all  --  *    *    0.0.0.0/0   0.0.0.0/0   ctstate 
> RELATED,ESTABLISHED
> 
>      <some exclusive NEW accepts>
>      <some exclusive NEW accepts saadr-binded to lan>
> 
> 19  ACCEPT   icmp --  *    *    0.0.0.0/0   0.0.0.0/0   icmptype 8
> 
> 
> Chain OUTPUT (policy DROP 101 packets, 12798 bytes)
> num   target prot opt in   out  source      destination
> 1   ACCEPT   all  --  *    *    0.0.0.0/0   0.0.0.0/0   ctstate 
> RELATED,ESTABLISHED
> 
> 2   ACCEPT   tcp  --  *    *    0.0.0.0/0   0.0.0.0/0   tcp dpt:21 
> ctstate NEW
> 3   ACCEPT   tcp  --  *    *    0.0.0.0/0   0.0.0.0/0   tcp 
> spts:1024:65535 dpts:1024:65535 ctstate NEW
>      <some further exclusive NEW accepts>
> 
> 13  ACCEPT   icmp --  *    *    0.0.0.0/0   0.0.0.0/0
> 
> 
> And this is my new basic-schema for nftables, which is basically the 
> same as the previous schema:
> table ip filter {
>      chain INPUT {
>          type filter hook input priority 0; policy drop;
>          ct state established,related accept
> 
>          <some exclusive NEW accepts>
>          <some exclusive NEW accepts saadr-binded to lan>
> 
>          icmp type echo-request limit rate 1/second accept
>      }
>      chain OUTPUT {
>          type filter hook input priority 0; policy drop;
>          ct state established,related accept
> 
>          tcp dport ftp ct state new accept
>          <some further exclusive NEW accepts>
> 
>          ip protocol icmp counter accept
>      }
> }
> 
> 
> The peculiarity is, in the iptables-rules, FTP-Send only works with this 
> Statement:
> 3   ACCEPT   tcp  --  *    *    0.0.0.0/0   0.0.0.0/0   tcp 
> spts:1024:65535 dpts:1024:65535 ctstate NEW
> 
> In the nftables rule it works also without this (translated) rule, see 
> above. Is there an
> explanation for this? Thank you for your Help.
> 
> Best Regards from Germany
> Thomas Luening
> 
> 
> ps
> I'm sorry, but I needed for this Mail the help from 
> https://www.deepl.com/translator


FTP works like this. There is a control connection, which is typically 
an outgoing connection from the client on a random port to the FTP 
server on port 21. That connection is used for FTP commands like 
requesting a file transfer or directory listing or setting file 
timestamps etc.

When you actually go to do a file transfer, FTP uses a separate 
connection called an FTP data connection. This can use any ports, it can 
even use any IP address (FXP), it's whatever the client and server agree 
on via the control connection. Note that your iptables rule gets this 
wrong, because it specifies only ports 1024:65535, but the standard port 
for FTP data is port 20. This is frequently ignored in favor of 
unprivileged ports, but that doesn't mean _nobody_ uses the standard port.

The solution to this without requiring a rule that allows any:any is 
called an Application-Level Gateway, which for FTP has the router snoop 
the FTP control connection to see what ports the data connection will 
use and then expect the data connection and allow it through, even 
though an unexpected new connection using the same ports would otherwise 
be blocked.

But the FTP ALG helper isn't always enabled by default. The relevant 
kernel module(s) must to be loaded (nf_nat_ftp or nf_conntrack_ftp). The 
modules also have options, like allowing FXP. See also the iptables 
--helper option and "ct helper" for nft.
