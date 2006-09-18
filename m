From: Snehasis Sinha <ssinha@connectivasystems.com>
Subject: iptables - port forwarding in LAN
Date: Mon, 18 Sep 2006 17:41:59 +0530
Message-ID: <450E8D0F.2070909@connectivasystems.com>
References: <4504CC74.3040607@mailinator.com>	<Pine.LNX.4.58.0609140855340.18386@blackhole.kfki.hu>	<450AD4EE.3050205@mailinator.com>	<450AD69F.9000506@candlefire.org>
	<450AD8D4.7040008@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <450AD8D4.7040008@mailinator.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I am trying to port forward in a closed (not connected to real internet or outside network) network (LAN) to a machine; but could not do it successfully. the senerio is:

I have a host_a (10.5.1.100), host_b (10.5.1.200) and host_c (10.5.1.150) connected among themselves. from host_c i am accessing http service at host_a using http://10.5.1.100:80. I can access tomcat server using http://10.5.1.200:8080, from host_c. now I want to use http://10.5.1.100:80 to access 10.5.1.200:8080 from the same host (host_c), ie. all http requests targetted to 10.5.1.100:80 should be redirected to 10.5.1.200:8080, so that pages from host_b:8080 comes to host_c but appear to come from host_a:80

how to do that using iptables. please advise.
thanks in advance

-snehasis

