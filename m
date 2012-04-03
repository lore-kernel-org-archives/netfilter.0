From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ip a a /32 or used netmask
Date: Tue, 3 Apr 2012 14:22:49 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1204031421590.15235@frira.zrqbmnf.qr>
References: <20120402230510.8b17b5dbc6d1f421fe9476aa@lucassen.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120402230510.8b17b5dbc6d1f421fe9476aa@lucassen.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


On Monday 2012-04-02 23:05, richard lucassen wrote:
>
>Just a question:
>
>I have a NIC eth0 with address 10.0.0.1/24
>
>I want to add an ip address to that NIC. Both ways work:
>
>ip a a 10.0.0.2/32 dev eth0
>
>ip a a 10.0.0.2/24 dev eth0
>
>Is there anyhow some or other difference between the two? And is one of
>the two ways preferred?

The difference lies in the route that is implicitly added.
