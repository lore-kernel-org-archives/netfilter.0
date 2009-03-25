From: "Robert M. Albrecht" <linux@romal.de>
Subject: User specific ip addresses
Date: Wed, 25 Mar 2009 07:19:40 +0100
Message-ID: <17E09B19-465C-4861-BE9B-551377A2ECD2@romal.de>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

Hi,

I have a tricky problem. I need a dual-homed linux box, one nic is  
connected to our network, the other nic is connected to the customer  
network.

Several users from us are logging in via our interface and are leaving  
the system on the customers interface. BUT I need them to leave with  
different IP-addresses (al in the same subnet).

Is there some netfilter or virtual ip addresses magic to do this ?

cu romal

