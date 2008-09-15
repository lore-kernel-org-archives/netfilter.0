From: "Xu, Qiang (FXSGSC)" <Qiang.Xu@fujixerox.com>
Subject: iptables not prevent access
Date: Mon, 15 Sep 2008 15:02:13 +0800
Message-ID: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A3FD3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi, all:

I am running the command "iptables -p tcp -j REJECT -A INPUT -i eth0 -s 13.121.8.119/32 --dport 80", to reject http access from the host "13.121.8.119". The command returns without any error message. However, I still can acess the linux server from "13.121.8.119".

Anything goes wrong here? Any method to debug?

Hope someone helps,
Xu Qiang
