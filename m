From: "Mike G. Hammonds" <mhammonds@knowledgeinenergy.com>
Subject: Defining Variables
Date: Mon, 8 Jul 2002 16:45:17 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <956DDDA708487D498B43C36EA4DEA4050B5C4F@SFEXCH01>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "Iptables-User-list (E-mail)" <netfilter@lists.samba.org>

How do you define variables in the /etc/sysconfig/iptables file?
Here is what I'm trying to do:
## Variables ##
IPTABLES="/usr/local/sbin/iptables"	## Default IPTables >= v. 1.2.0
#IPTABLES="/usr/local/bin/iptables"	## Default IPTables <= v. 1.1.2

LOOPBACK="lo"			## Loopback Interface
EXTERNAL="eth0"			## External Interface
INTERNAL="eth1"			## Internal Interface
DMZ_IF="eth2"			## DMZ Interface

INTERNAL_NET="10.97.160.0/24"	## Network address for the internal network
DMZ_NET="192.168.11.0/24"	## Network address for the DMZ

## INT_IP="10.97.160.1"	## IP Address of Internal Interface
   INT_IP=`ifconfig eth1 | grep inet | cut -d : -f 2 | cut -d \  -f 1`

## DMZ_IP="192.168.11.1"	## IP Address of DMZ Interface
   DMZ_IP=`ifconfig $DMZ_IF | grep inet | cut -d : -f 2 | cut -d \  -f 1`

   EXT_IP="10.97.170.4"	        ## IP Address of External Interface
	   	
## EXT_IP=`ifconfig $EXTERNAL | grep inet | cut -d : -f 2 | cut -d \  -f 1`

LOG_LEVEL="notice"		## Default log level: kern.notice 

Mike Hammonds
Fellon-McCord & Associates, Inc.
Information Services Manager
Voice (502) 214-6324 Fax (502)426-8800
mhammonds@knowledgeinenergy.com <mailto:mhammonds@knowledgeinenergy.com >
 

