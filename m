From: Christian Seberino <seberino@spawar.navy.mil>
Subject: iptables -F & iptables -X good enough *for all* tables/chains?
Date: Mon, 24 Jun 2002 11:41:08 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020624114108.A3305@spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

iptables -F
iptables -X

These simple 2 lines seem good enough to
nuke *all* rules and *all* user defined chains.....

Yet, in print (like Linux Firewalls book) I often
see people wanting to apply -F and -X to 
*every single table one by one*

(e.g. iptables -t nat    -F
      iptables -t filter -F
      iptables -t mangle -F
 etc.)

Am I missing something? My simple 2 lines above
seem good enough to do the trick.

Chris
-- 
_______________________________________

Dr. Christian Seberino
SPAWAR Systems Center San Diego
Code 2363
53560 Hull Street
San Diego, CA 92152-5001
U.S.A.

Phone: (619) 553-7940
Fax:   (619) 553-2836
Email: seberino@spawar.navy.mil
_______________________________________

