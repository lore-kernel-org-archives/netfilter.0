From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Unknown error 4294967295
Date: Mon, 06 Feb 2006 19:20:49 -0600
Message-ID: <1139275250.3600.3.camel@davila.nicaraguaopensource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi list!:

Trying to execute this rule

iptables -t mangle -A PREROUTING -s  -j NETMAP --to 192.168.3.0/24

I receive

iptables: Unknown error 4294967295

Someone knows where to look?

The system is Ubuntu 5.10 and iptables 1.3.5

Thanks,

-- 
-----------------------------------------------------------------
Jorge Isaac Davila Lopez
-
sitio web: http://www.nicaraguaopensource.com/
correo-e: davila@nicaraguaopensource.com
-
clave pgp: http://www.nicaraguaopensource.com/claves/nos.asc
huella digital: F8F4 8563 28D2 29E1 E2EA 9EAB CA0F A96F A3EE 6F56
-----------------------------------------------------------------


