From: Christian Seberino <seberino@spawar.navy.mil>
Subject: iptables question - how to securely allow *just* outgoing smtp
Date: Fri, 21 Jun 2002 08:32:28 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020621083228.A21833@spawar.navy.mil>
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

My firewall does *not* need or use any
rules on INPUT and OUTPUT chains
since it just *FORWARD*s packets to/from
private LAN.....

I'd like to install Tripwire on firewall
and have firewall *email* me daily of status.....

How can I securely *open* up firewall rules
to allow me to just email out without
compromising security???

Thanks,

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


