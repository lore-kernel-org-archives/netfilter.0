From: dhottinger@harrisonburg.k12.va.us
Subject: redirect to proxy servere
Date: Thu, 01 Mar 2007 07:19:27 -0500
Message-ID: <20070301071927.klbsuhgk2sscscs8@mail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

I currently redirect all port 80 traffic to my squid proxy server with  
following:

$IPC -A TOSERVERS -p tcp --dport 8080 -d 204.111.40.10 -i $L3 -j LACCEPT
$IPC -A TOSERVERS -p tcp --dport 8080 -d 204.111.40.10 -i $L3 -j LACCEPT
$IPC -A TOSERVERS -p tcp --dport 9011:9015 -d 204.111.40.10 -i $L3 -j LACCEPT
$IPC -A TOSERVERS -p tcp --dport 10000 -d 204.111.40.10 -i $L3 -j LACCEPT

Works great, except all of a sudden my apple computers wont do  
software updates.  So, I would like to not redirect traffic that is  
destined for apple.com or swscan.apple.com's website.  Im not quite  
sure of the syntax for my rule, or if this is even possible.  Any ideas?

thanks,

ddh


-- 
Dwayne Hottinger
Network Administrator
Harrisonburg City Public Schools


