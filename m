From: "J. Bakshi" <joydeep@infoservices.in>
Subject: try to change os fingerprint
Date: Fri, 21 Aug 2009 14:03:26 +0530
Message-ID: <4A8E5BD6.5040904@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I am trying to change the OS fingerprint with iptables. Here are two
rule set which I have constructed to do the same

````````
iptables -t mangle -A PREROUTING - -j PERS --tweak dst --local --conf
example/win9x.conf
iptables -t mangle -A OUTPUT -j PERS --tweak src --local --conf
example/win9x.conf
````````````

But it throws an error like

``````````
iptables v1.4.2-rc1: Unknown arg `--tweak'
Try `iptables -h' or 'iptables --help' for more information.
```````````````

What might be the problem here ?
Thanks
