From: Christian Seberino <seberino@spawar.navy.mil>
Subject: how is this stuff getting thru default deny iptables firewall?....
Date: Sat, 22 Jun 2002 10:30:55 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020622103055.B32585@spawar.navy.mil>
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

My firewall *only* forwards SSH stuff to private LAN.

It forwards *everything* _from_ private LAN to Internet however.

How can the private LAN use DNS which it does????

How is DNS server returning the info thru firewall
if it *only* allows SSH??!?!?!?

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

