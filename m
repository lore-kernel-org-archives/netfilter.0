From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Changing the incoming interface of the packet using iptables
 MARK and ip route commands
Date: Wed, 8 May 2013 13:16:45 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1305081314590.29391@nerf07.vanv.qr>
References: <CALyk9ewHd1EgDJ-LhSQsOZwasJE-CM9nuLH9djtLOMKHPnJm0A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CALyk9ewHd1EgDJ-LhSQsOZwasJE-CM9nuLH9djtLOMKHPnJm0A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ravi Kanth Vanapalli <vvnrk.vanapalli@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2013-05-01 05:06, Ravi Kanth Vanapalli wrote:

>I was trying to change the incoming interface of the packet using
>iptables MARK and ip route commands.
>
>I have tried this approach after going through the weblink
>belowhttp://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-4.html#ss4.5
>which suggests the use of iptable Mark and iproute2 utilities instead
>of ROUTE target. but could not find any success chaging the incoming
>interface of the packet in the receiving path.
>
>I have an application 'A' which binds to an interface 'intfA' in linux
>i.e the application sends and receives packets only on via intfA.

If it uses bind(2), it does not bind to an interface, but an address. 
Therefore, changing the interface is the wrong thing to do. Make your 
program listen on the particular address(es) that you intend to send to 
instead.
