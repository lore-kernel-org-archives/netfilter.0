From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Restricted Access
Date: Mon, 7 Jul 2003 10:43:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E6D65A6EE5AAD6119DE800B0D03DA0C528970F@MS_LEU1>
References: <001e01c34437$cf18b9a0$b900a8c0@ljhpm.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001e01c34437$cf18b9a0$b900a8c0@ljhpm.com.au>
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

> I have a very basic iptables setup to allow my windows 
> clients to access the net through iptables, What I want to do 
> is allow some clients to have full access the any websites 
> and others to be resticted to certain sites only, Can 
> iptables do this?. Does someone have an example
> or point me in the right direction     

What is your setup ?
Do your clients have fixed IP addresses ?

Example :

FULL="192.168.0/24"
RESTRICTED="192.168.1/24"
ACCESS_SITES="a.b.c.d e.f.g.h ..."

# Full access clients
iptables -A FORWARD -i <if_in> -o <if_out> -s $FULL -j ACCEPT

#Restricted access clients
for IP in $ACCESS_SITES ; do
  iptables -A FORWARD -i <if_in> -o <if_out> -s $RESTRICTED -d $IP -j
ACCEPT
done


Gr,
Rob


