From: =?GB2312?B?0e67qg==?= <youngh0702@21cn.com>
Subject: clear the ip_conntrack entry
Date: Wed, 25 Jun 2003 10:46:51 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030625103542.38F9.YOUNGH0702@21cn.com>
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

Hi everyone :
	I have notice that many request about how to clear the
/proc/net/ip_conntrack entry , and someone suggest that it have no
resolution except restart the interface .
	I think the answer : send a fake ip packet (with RST set) to
firewall , to let it think the connection terminate .
	By this methode , I have the following script written , it work
well for me.
	To use this script , you must have hping2 installed , it can be
download from http://www.hping.org 
--------- clr_conns start  ------------------
echo
echo "############################"
echo "# Edit by Youngh 2003.06.24 v1.1 "
echo "# Usage : clr_conns IpAddress"
echo "#    	This will clear all connections from this IP_Address"
echo "# Example:/root/clr_conns  10.0.3.3 "
echo "############################"
echo



if [ -z $1 ] ; then 
	exit
fi


grep -E "^tcp .{10,25}ESTABLISHED src=$1 " /proc/net/ip_conntrack | while read line ; do 
	S_IP=`echo $line | awk '{print substr($5,5)}'`
	S_SOCK=`echo $line | awk '{print substr($7,7)}'`
	D_IP=`echo $line | awk '{print substr($6,5)}'`
	D_SOCK=`echo $line | awk '{print substr($8,7)}'`	
	echo "$S_IP:$S_SOCK $D_IP:$D_SOCK"

	hping2 $D_IP -R -s $S_SOCK -p $D_SOCK -a $S_IP -k -c 1 >/dev/null 2>/dev/null &

done	

----------------clr_conns end --------------------------------

