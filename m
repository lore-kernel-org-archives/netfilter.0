From: Christian Seberino <seberino@spawar.navy.mil>
Subject: please explain "--state RELATED/ESTABLISHED" rules in iptables
Date: Fri, 21 Jun 2002 08:33:07 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020621083307.B21833@spawar.navy.mil>
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

My firewall iptables script has rules
to drop lots of packets and only forward
certain packets.....

I've seen lots of iptables scripts that
have rules with "--state RELATED"
and "--state ESTABLISHED".

I know these have to do with TCP packets
related to an existing TCP connection and such.

*What* are these rules good for?  I didn't
use them and couldn't see a need for them.

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

