From: Nick Carter <ncarter100@gmail.com>
Subject: Use ebtables to forward 802.1x frames ?
Date: Fri, 17 Jun 2011 22:01:24 +0100
Message-ID: <BANLkTi=eN=K9RMbBh4QQpZD4CO6uWBNBWg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=bhbqIKMiM29S8qPKCliTgfFQjRjJSK8RS6WqpoCj0/U=;
        b=kdJA63Fe0oWZIX+m8hpawNJIey4AvSXyKWERG02RdVB0j9ma8sPxz2rY4JLwUdu38O
         JWk6o9DQ+L/DLEgoJERLAfuR19nxbOLGi9f+FWJC/8kgUgG76kZV8g8BLJII8ZUiejx9
         5+fM/AwDJuH+axGvRKh16b6pdX2qzLYOaAegQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Its been suggested to me that ebtables can be used to forward 802.1x
frames.  I need to do this to bridge a virtual machine supplicant to
an external authenticator switch.  As far as I can see ebtables acts
as a frame filter.  With this rule:
sudo ebtables -t filter -A INPUT -p 0x888E -i vnet0 -j ACCEPT --log
I get a match
Jun 17 19:48:47 mill kernel: [ 1271.665003]  IN=vnet0 OUT= MAC source
= 52:54:00:e3:ec:01 MAC dest = 01:80:c2:00:00:03 proto = 0x888e
But the frame (skb) continues in the default manner and is returned
back from the bridge code, rather than being forwarded.
br_handle_frame()
...
               if (NF_HOOK(NFPROTO_BRIDGE, NF_BR_LOCAL_IN, skb, skb->dev,
                           NULL, br_handle_local_finish))
                       return NULL;    /* frame consumed by filter */
               else {
                 return skb;   /* continue processing */
               }
       }
forward:

Is it possible to use ebtables and override the kernels default
bridging behaviour and forward frames that would normally be dropped ?
Maybe grabbing the frame and reinjecting it elsewhere....

Thanks for any insight,
Nick
