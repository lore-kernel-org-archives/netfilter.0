From: Abraham van der Merwe <abz@frogfoot.net>
Subject: limiting number of concurrent tcp sessions
Date: Mon, 22 Mar 2004 14:59:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040322125944.GA9496@oasis.frogfoot.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: Netfilter Discussions <netfilter@lists.netfilter.org>

Hi!

Is there a way to limit the number of concurrent tcp sessions per host/ip
flowing through a machine in Linux?

There used to be a match for iptables which seems like it may be able to do
the job, but it doesn't seem to exist anymore:

------------< snip <------< snip <------< snip <------------
iplimit v1.2.8 options:
[!] --iplimit-above n           match if the number of existing tcp
connections is (not) above n
 --iplimit-mask n               group hosts using mask
------------< snip <------< snip <------< snip <------------

-- 

Regards
 Abraham

TODAY the Pond!
TOMORROW the World!
                -- Frogs (1972)

___________________________________________________
 Abraham vd Merwe - Frogfoot Networks CC
 1st Floor, Albion Springs, 183 Main Road, Newlands
 Phone: +27 21 689 3873 Cell: +27 82 565 4451
 Http: http://www.frogfoot.net/ Email: abz@frogfoot.net


