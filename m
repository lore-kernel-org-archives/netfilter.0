From: "Ed Street" <blacknet@simplyaquatics.com>
Subject: RE: Default DROP policy for mangle and nat in iptables necessary/wise?
Date: Mon, 24 Jun 2002 15:02:18 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <001e01c21bb1$a95115a0$0a01a8c0@ed>
References: <20020624114515.A3324@spawar.navy.mil>
Reply-To: <blacknet@simplyaquatics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020624114515.A3324@spawar.navy.mil>
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
To: 'Christian Seberino' <seberino@spawar.navy.mil>, netfilter@lists.samba.org

Hello,

Is there any distinction made between PREROUTING and POSTROUTING for the
drop policy?

Try this.
        "$IPTABLES" -t nat -P PREROUTING DROP
        "$IPTABLES" -t nat -P POSTROUTING DROP

It *DOES* work and it's highly effective.

Ed


-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org] On Behalf Of Christian Seberino
Sent: Monday, June 24, 2002 2:45 PM
To: netfilter@lists.samba.org
Subject: Default DROP policy for mangle and nat in iptables
necessary/wise?

Linux Firewalls book assigns a default drop policy
to mangle and nat tables.

I could not get DROP policy to work on these
tables and I am skeptical this serves any useful
purpose anyway since packets must all traverse
filter table anyway.

Is the author of Linux Firewalls on drugs or is
this really useful somehow?? (assuming you can
get it to work)

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


