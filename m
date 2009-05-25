From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Firewall in Load Balance - Active/Active
Date: Mon, 25 May 2009 14:13:21 +0200
Message-ID: <20090525141321.0b41719e@catlap>
References: <3e7107590905250446g2f3aa95dua9691dc63cc3dfec@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3e7107590905250446g2f3aa95dua9691dc63cc3dfec@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eduardo Sachs <edu.sachs@gmail.com>
Cc: netfilter@vger.kernel.org

> 
>Hi Friends!

Hi Bro,

>I'm looking for firewall solution for active/active, the clients use
>the firewalls randomly.

Interesting. How does client choose firewall? Where the randomization
occurs?

>The conntrackd help me to replicate the state of the connection.
>What help to "load balance" the firewalls?

You can use keepalived [1] to have two virtual gateway IP addresses on
the network - GW1 and GW2. Assign half of the clients staticly to GW1,
another half to GW2. If one of the boxes fails, keepalived brings up
missing GWX address on another box. This way you are provided with
redundancy and load balancing.

[1] http://www.keepalived.org/
