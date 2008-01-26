From: "Oscar N" <oscar@linnea.net>
Subject: Re: Dual Independent Networks
Date: Sat, 26 Jan 2008 23:28:23 +0100 (CET)
Message-ID: <48110.83.227.11.162.1201386503.squirrel@mh.linnea.com>
References: <47989E9D.7000003@sasktel.net>
Reply-To: oscar@linnea.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47989E9D.7000003@sasktel.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kendrick Hamilton <kendrick.hamilton@sasktel.net>
Cc: netfilter@vger.kernel.org

I'm not sure if I understand you correctly but take a look at policy based
routing and check if that can help you in any way.
http://lartc.org/howto/lartc.rpdb.html

/Regards Oscar

>    I have a question for you. I hope you are the correct or a good
> person to ask this question of. I have a linux box with two ethernet
> interfaces. I would like them to be treated as two separate interfaces
> that are not hooked to the same network. Both interfaces should run
> Zeroconf and have independent IP address. The second ehternet address is
> on a private network from the first ehternet address. Currently I am not
> using iptables but could use it to do connection tracking. What is
> currently happening is
> 1. eth0 is configured and gets a zeroconf IP address.
> 2. routing tables set to route all outbound packets for zeroconf out eth0.
> 3. eth0 is working correctly
> 4. eth1 is configured and gets a different zeroconf IP address.
> 5. An incoming packet from eth1 is received and processed, since the
> response is to go out to a zeroconf IP address, the response goes out
> eth0. The computer connected on eth1 does not see the response.
>
>
> Could this be solved with running IP tables and doing connection
> tracking? or is  more complex?
>
> Thank You for your time and any help you can give
> Kendrick Hamilton
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


