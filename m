From: Patrick Conlin <patrick@wechsler.com>
Subject: mixing static and dynamic mappings
Date: Fri, 07 Jun 2002 21:38:54 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <a7d60cd.60cda7d@wechsler.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
Content-language: en
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

seeking advice...

i have a /29 range of public ips from my isp. all but one of the ip
addresses are taken up by static mappings (servers of various
functions/domains) to addresses on my 10.1.1.0/24 internal network. what
i'd like to do with the remaining public ip address is use it as a sort
of MASQUERADE ip address for all remaining non-server machines on the
network (so the machines on the network that aren't servers can all
share an ip for internet access). i've got a dhcp server set up that's
dishing out internal ips in the 10.1.1.200-240 range only, so i'm
wondering if i could so something like:

iptables -t nat -A POSTROUTING -s 10.1.1.200-10.1.1.240 -j SNAT
--to-source 207.224.76.205

and combine it with state ESTABLISHED

somehow so that just that range of ips gets a pnat-style translation for
basic browsing, etc.

unfortunately the basic iptables command above just gives an error, as
it should. i'm pretty sure i'm going about this the wrong way, so would
greatly appreciate anyone's suggestions!

thanks a lot,

-=p=-


