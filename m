From: Camilo Echeverry <phantom@colombianet.net>
Subject: Restrictions + Transparent Proxy
Date: Sat, 15 Mar 2003 09:45:59 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <03031509455901.03553@hosting.colombianet.net>
Reply-To: phantom@colombianet.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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


Hi.
I have an Invalid network which access internet through a linux server with 
iptables,
I've tried many times to do this but isnt working:

Grant complete  access to Internet (-d 0.0.0.0/0.0.0.0) only to some ips in 
the internal network

and restrict access to the rest only to an external subnet  
(-d XX.YY.ZZ.0/255.255.255.0)

And I want all the users in the internal network to pass through a 
transparent proxy in the same box doing this:

/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT 
--to-port 8080 

But when I activate the transparent Proxy, all the people inside the internal 
network can access internet (via web)

What order of ideas must I use ?
I'm using the correct iptables rules ..?

something like:


#Grant complete acces to this IP
/sbin/iptables -A FORWARD --in-interface eth0 -s \
192.168.3.252/255.255.255.255 -d 0.0.0.0/0.0.0.0 --out-interface eth0 -j \
ACCEPT

#permit access to all the internal network to only one subnet
sbin/iptables -A FORWARD --in-interface eth0 -s \192.168.3.0/255.255.255.0 \ 
-d XX.YY.ZZ.0/255.255.255.0 --out-interface eth0 -j ACCEPT

#Block the rest
/sbin/iptables -A FORWARD --in-interface eth0 -s 192.168.3.0/255.255.255.0  \ 
 -d 0.0.0.0/0.0.0.0 -j REJECT

#Then Activate Transparent Proxy
/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT \
--to-port 8080

#Now masquerade packets
/sbin/iptables --table nat --append POSTROUTING --out-interface eth0 -j \
MASQUERADE


Thanks.
Camilo
-- 


_____________________________________________________________________________
Cuando un Arquero dispara gratuitamente .. 
Tiene consigo toda su habilidad ...

                          Proverbio Oriental
_____________________________________________________________________________

