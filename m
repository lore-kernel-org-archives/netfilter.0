From: Christopher Abrahamsson <toffe@dev.null.se>
Subject: Reaching internal computers through the external ipaddress inside
 private network
Date: Tue, 20 Apr 2004 13:50:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40850EA0.7090206@dev.null.se>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi

I've been trying to solve this problem for quite some time now, but i 
can't really figure out how...
Here's my current setup:
                               _ my computer (10.0.0.3)
                              |
internet - iptables gateway -|- my server(web, mail etc) (10.0.0.2)
             (212.181.43.20)  |
                              |_ a bunch of other computers (10.0.0.x)


Basicly, what i want to do is to allow 10.0.0.3 to access my external ip 
through the internal network, so i can reach, say, the webserver at 
10.0.0.2 through 212.181.43.20:80.
I've tried some different iptablesconfigurations around, but it hasn't 
been leading anywhere near success.

Any ideas?

Thanks,
Christopher



