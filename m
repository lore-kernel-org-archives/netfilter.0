From: Al Grant <bigal.nz@gmail.com>
Subject: SNAT (again)
Date: Tue, 30 Jul 2013 06:02:50 +1200
Message-ID: <CAODtcdcOmJ8UYxGetn7M=JEQ1pwgz-104LbBFnJ+OKnDiqeW2g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=lO7/v+7dUc8o6DNWjenpJBPAE8U2MeEeUMqj6a+o3vo=;
        b=ZYwEQ0AfFemA4ThNXsr7qSNScC0eTiIEmec8K7wDNq4GnMPPM4lmiva+FgSgOYPQP2
         BVNHW6E7UpTNOR0MCxHOwYGv6wWsxHVPzAmzAyjBhnpidcn5QlbAi69XoS+Gk1Qit3AU
         IIzuGSukzaTn9TZFjXG+GHBUjWHLuTKL7+vqepweanNMwxtRDj57OU4WazbP+ym5b9BG
         tkhUXN90WCP2UmdsBhunkxnoxAahkElsUC7jlMlZ88VcvyxUbgwXCrH9ID5dovgKOr3h
         0ROz4J7/JPg1RBNyjhCgspkUkFLgRMsnn49NCxN6HGKxFT/FQtQPum4mtyc4jusE+FMl
         EknQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

 Hi Folks,

I have a network that is setup in the following way:

www.dropbox.com/s/dt7q9owe5y997ug/Drawing1%20%282%29.jpg

As you can see in the drawing I am trying to access a SMB share over a
port forward (DNAT). The issue is that the source address does not get
changed on the packet and when 192.168.150.100 goes to reply to
192.168.0.101 it drops the packet as it does not know where to send
it.

I need to add a SNAT rule to iptables in the Air Router.

I am not good with iptables but think it would be something like:

iptables -t NAT -A POSTROUTING -o Br0 -J SNAT --to-source 192.168.150.243

This should change the source of the packet to 192.168.150.243. Any
advances on that? At the moment it does not seem to be changing the
src.

I KNOW there are better ways to do it with new hardware etc, but there
constraints on solving this problem such that I need to NAT/SNAT.

Cheers

-Al

-- 
"Beat it punk!"
- Clint Eastwood
