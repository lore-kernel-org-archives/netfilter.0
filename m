From: =?iso-8859-1?Q?Cilli=E8_Burger?= <security@sadomain.co.za>
Subject: RE:Is "no route to host" fake possible?
Date: Fri, 25 Jun 2004 12:44:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00c601c45aa1$74751080$3b7819c4@PHAKE>
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

yes, it is 

observe 

# man route

reject      install a blocking route, which will force a  route
              lookup  to  fail.  This is for example used to mask
              out networks before using the default route.   This
              is NOT for firewalling.

route add -host 192.168.1.2 reject 

# ping 192.168.1.2
connect: Network is unreachable

for more info check the route man page 



>Date: Fri, 25 Jun 2004 10:53:36 +0200
>Subject: Is "no route to host" fake possible?
>From: iptables-ml@xy1.org

>Hello,

>I know the rules REJECT, DENY or DROP, but is it possible to return to 
>the client the error message "no route to host" ?

>I saw that it's possible to configure this on CISCO routers, and I would 
>lke to know it it's possible?

>Best regards,
>saf

