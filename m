From: Eoin Verling <eoin.verling@transas.com>
Subject: iptables and IPCOMP
Date: Wed, 3 Mar 2004 16:28:13 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <C47F458E-6D2F-11D8-9B9B-000A95DAC91E@transas.com>
Mime-Version: 1.0 (Apple Message framework v612)
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

Hi,

I'm relatively new to the iptables world, so apologies in advance ...

I'm running iptables on 2 linux boxes (v1.2.8), in 2 different 
locations (offices). They are firewalls for both offices. I have ipsec 
tunnels between both offices, terminating on these linux boxes.

I am currently trying to install 2 bandwidth expanders (Xpand 4800) on 
both sites. I have the devices _inside_ both firewalls, setup with 
local IP addresses (ie both devices have false IP's, but can see (ping) 
each other through the ipsec tunnel)

I'm told that these devices use IPCOMP to communicate, but currently 
they are not connected. So, I'm trying to find out where the blockage 
is happening! So, my question is, how do I find out where/why the 2 
devices are not connecting. For example, to find out if iptables is the 
problem, I run the:-

# iptables -t <table_name> -L -n

where <table_name> is one of /proc/net/ip_table_names

If nothing there, then can that be ruled out as the blockage of IPCOMP 
getting through?
How do I explicitly allow IPCOMP get through with iptables?

any help would be greatly appreciated

cheers
E


