From: Christian Seberino <seberino@spawar.navy.mil>
Subject: Default DROP policy for mangle and nat in iptables necessary/wise?
Date: Mon, 24 Jun 2002 11:45:15 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020624114515.A3324@spawar.navy.mil>
References: <20020624114108.A3305@spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020624114108.A3305@spawar.navy.mil>; from seberino@spawar.navy.mil on Mon, Jun 24, 2002 at 11:41:08AM -0700
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

