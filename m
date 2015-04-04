From: "otik@e-posta.sk" <otik@e-posta.sk>
Subject: ebtables fix changing source MAC
Date: Sat, 04 Apr 2015 09:26:44 +0200
Message-ID: <551F9234.2040308@e-posta.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

I need to connect LINUX to ethernet device. Everything would work except 
that device after SYN packet starts to send packet with 
changing/random/mascilious MAC. It seems linux would drop such(mac and 
IP not match records) packet. This is expected to reduce 
Inject/Man-On-Side attack.

Device computer is too expensive to be replaced. Also original box can 
comunicate with it with no problem making change with no point. Original 
solution runs on Windows which seems to be more permissive on this 
issue. I can confirm this. I ran simple SW to resend stream on Windows 
and all communications was ok. However i can not use this solution in 
production.

The things are even more complicated as my Linux box is located 12 hour 
fly and another 4 driving, with no internet access. I got last shot to 
try it, so I'm waiting even your brain storm ideas.

My basic idea was to have ebtables SNAT rule, but I need it to run 
before routing decision to work. As I understand SNAT works on 
postrouting - too late. Im running bridge on my box to remove need have 
external switch.

Oto

