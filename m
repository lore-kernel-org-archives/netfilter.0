From: "Mike" <mikeeo@msn.com>
Subject: different DMZs which is better?
Date: Mon, 13 Jan 2003 09:28:20 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001e01c2bb10$05d79300$9865fea9@win2k.com>
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

Hey guys Im deciding how I want to implement a DMZ for my company can anyone
tell me the pros and cons of my DMZs below? should I got with a routable
hosts in my DMZ and just filter out any port I don't want open or just port
forward over certain ports and use IP alias?

Thanks,
Mike

P.S excuse the art below I know it sucks.


                                    cisco
                                        |
                                        |
                                        |
                                     eth0
DMZ inet IPs(eth1)---Netfilter----private LAN (eth2)



                                         cisco
                                             |
                                             |
                                             |
                                          eth0
DMZ private IPs(eth1)---Netfilter----private LAN (eth2)



