From: mick <mick@mohawkplastics.com>
Subject: Ip handling
Date: 18 Jun 2003 09:53:46 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055955226.5963.66.camel@plant1>
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

I have a delema and i'm not sure how to handle it. 
I run a login server on port 5999 that does authentication based on IP
address. So when someone with a dynamic internet connection tries to
login with a differnt IP then the registered one, The login server
rejects them.
I am not good enough with Iptables to know if it is possible or not but
is there some way to make it so all connections to that PORT(5999)
appear to come from my Local network 192.168.0

The other method i thought about was running my authentication/login
server on another machien behind the firewall. but i think i would have
to make all packets coming from the inter net to that port appear to
come from the local network prior to forwarding them to the Other
server. both of which i am unsure how to accomplish. 

The Authentication server is a binary that is not linux/unix nativly so
at this time i can not recode it and remove the IP matching function.
Any help with this problem is greatly appreciated.
Mick


Does anyone know of a way to make say all connections from the outside
going to my outside IP address Appear to be coming from my local lan of
192.168.0.1  







