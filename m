From: "Mike" <mikeeo@msn.com>
Subject: Re: different DMZs which is better?
Date: Mon, 13 Jan 2003 14:15:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001201c2bb38$25e45980$1e01a8c0@win2k.com>
References: <001e01c2bb10$05d79300$9865fea9@win2k.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I talked with my ISP and they will route me a /30 for my firewall and a /28
for the DMZ segment. The DMZ will be hosting a webfarm does anyone have a
list of things I should to the box besides filtering rules? like how I can
stop directed broadcasts etc... I am going to accept Established and New
connections in the forward chain going to the webservers and drop invalid.
Is that ok for webservers or should I also accept related? Im only going to
open up port 80 to the webservers and drop everything else.

Thanks,

Mike
----- Original Message -----
From: "Mike" <mikeeo@msn.com>
To: <netfilter@lists.netfilter.org>
Sent: Monday, January 13, 2003 9:28 AM
Subject: different DMZs which is better?


> Hey guys Im deciding how I want to implement a DMZ for my company can
anyone
> tell me the pros and cons of my DMZs below? should I got with a routable
> hosts in my DMZ and just filter out any port I don't want open or just
port
> forward over certain ports and use IP alias?
>
> Thanks,
> Mike
>
> P.S excuse the art below I know it sucks.
>
>
>                                     cisco
>                                         |
>                                         |
>                                         |
>                                      eth0
> DMZ inet IPs(eth1)---Netfilter----private LAN (eth2)
>
>
>
>                                          cisco
>                                              |
>                                              |
>                                              |
>                                           eth0
> DMZ private IPs(eth1)---Netfilter----private LAN (eth2)
>
>
>
>


