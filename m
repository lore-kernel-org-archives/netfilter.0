From: Mark Tessier <mt@open2web.com>
Subject: script particularities
Date: Wed, 10 Jul 2002 14:41:09 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020710144109.5448cc69.mt@open2web.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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

Is there anyone out there who has deployed the choke firewall script found in chapter 6 of R. Ziegler's book "Linux Firewalls". I have been trying to get this script to work with zero success. Furthermore, there are things about this script that don't make sense to me, such as in the section named "# allow outgoing pings to anywhere". In this section you have the following rule:

iptables -A FORWARD -o $DMZ_INTERFACE -p icmp \
         --icmp-type echo-request -s $LAN_ADDRESSES \
         -m state --state NEW -j ACCEPT

My question is, where is the rule for allowing incoming responses to those pings. I've looked around in the script and can't find it, which is not to say that it isn't there.

Second mystery: You find the following at the beginning of the script, where the environment variables are initialized:

CLASS_A="10.0.0.0/8"                 # class A private networks
CLASS_B="172.16.0.0/12"              # class B private networks
CLASS_C="192.168.0.0/16"             # class C private networks

This is all typical of what you'd find in most scripts, but the fact is in this script, that's the last time CLASS_A, CLASS_B, etc are mentioned. In other words, there's no rule specific to denying packets coming from a CLASS_A private network. Why would one initialize a CLASS_A variable if it's never going to be used, I wonder? Is there some other rule used in this script that makes using a rule specifically denying access to packets coming from a CLASS_A private network obsolete? 

Finally, I use the following rule:

iptables -L FORWARD -v -x 

to see where an icmp or tcp packet gets dropped. This way, I at least have a vague idea where to start fixing my script. But in my case, all counters remain steadfastly at zero, no matter how many packets die trying to get through. This makes me wonder whether iptables is working at all, or partially working since maybe I negleted to modprobe certain modules. 

Anyway, I'd be happy to hear from someone who knows this script and its particularities.

Thanks,

Mark

