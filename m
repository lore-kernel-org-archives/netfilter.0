From: Axel Christiansen <axel@zedx.org>
Subject: Re: Problem with bridge+iptables+ulog
Date: Thu, 13 Mar 2003 22:51:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E70FD60.2070009@zedx.org>
References: <078601c2e886$039a49e0$13fcc5cb@Housecall>
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
To: hare ram <hareram@sol.net.in>
Cc: netfilter@lists.samba.org

Hello,
hare ram wrote:
> Hi all
> 
> some one can help i have the following setup
> 
> x.x.x.1/24            x.x.x.2/24
>    +------+                               +------+
>   | Router A |------+ +---------| PC B |
>    +------+              | |              +------+
>                               | |
>                         eth0| | eth1
>                           +-----+
>                             | qos | (br0 =3D x.x.x.3/24)
>                           +-----+
> 
> 
> how can i get the logs from eth0 and eth1
> 


As fare as i know you have to use the FORWARD chain and
will only get passing packet on the bridge interface. The
real interfaces (eth0 ...) only gets hit wehn it has an
ip-address asigned and the packets destination is the
bridge.

You allso need 2 more patche from the bridge project at
sourceforge.

For me the ulog works fine on the bridge. What i never
cared about was in with direction the packets walk through.

Axel

-- 
public key: http://knex.ath.cx:8013/keys/pup_key.txt


