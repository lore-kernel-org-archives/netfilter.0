From: "J. Bakshi" <joydeep@infoservices.in>
Subject: confusion with  dport and sport
Date: Thu, 03 Sep 2009 11:53:42 +0530
Message-ID: <4A9F60EE.60908@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have found that TOS is helpful for traffic shaping. But some guide use
--sport where other use --dport the handle the same thing hence I am
very confusd !!
To get a good response from the ssh running on a remote server the rule
can be placed in the remote server can be

``````````````````
iptables -t mangle -A PREROUTING -p tcp --dport  $SSH_PORT -j TOS
--set-tos Minimize-Delay
`````````````````````

BUT some site do the same by replacing --dport to --sport

Which one should be the right value ? Please enlighten me.
Thanks
