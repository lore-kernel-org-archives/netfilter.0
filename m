From: dhottinger@harrisonburg.k12.va.us
Subject: redirect
Date: Tue, 06 Mar 2007 09:42:08 -0500
Message-ID: <20070306094208.csonro2nwc8kogso@webmail.harrisonburg.k12.va.us>
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

I currently redirect all traffic on port 80 to my proxy server with
$IPC -t nat -A PREROUTING -p tcp -i ! $IF --dport 80    -s !  
204.111.40.0/24 -d ! 204.111.40.0/24 -j DNAT --to-destination  
$PROXY_IP:8080

I would like to have any traffic destined for apple.com excluded from  
this redirect.  I cant seem to get the syntax right.  Anyone got any  
ideas?

thanks,

ddh

-- 
Dwayne Hottinger
Network Administrator
Harrisonburg City Public Schools


