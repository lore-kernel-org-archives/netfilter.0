From: Filipe Almeida <filipe@rnl.ist.utl.pt>
Subject: Re: Arbitrary Netmasks
Date: Tue, 28 May 2002 15:07:32 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <5.1.1.2.2.20020528150443.00b9ad58@ns.rnl.ist.utl.pt>
References: <3CF383A9.7000106@mytomorrow.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CF383A9.7000106@mytomorrow.de>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Thomas Heinz <josef.k@mytomorrow.de>
Cc: netfilter-devel@lists.samba.org, netfilter@lists.samba.org

I usually use:

iptables -A FORWARD -s 0.0.0.255/0.0.0.255 -j DROP
iptables -A FORWARD -d 0.0.0.255/0.0.0.255 -j DROP
iptables -A FORWARD -s 0.0.0.0/0.0.0.255 -j DROP
iptables -A FORWARD -d 0.0.0.0/0.0.0.255 -j DROP

to stop routing of broadcasted packets. This works assuming you only have 
256 sized classes.

At 15:18 28-05-2002 +0200, Thomas Heinz wrote:
>Hi
>
>Netfilter supports arbitrary netmasks for IP addresses which is more
>powerful than just those IP/x (0 <= x <= 32) expressions.
>For example one could use IP/255.0.255.255 (IP/23.13.42.0 would also work ;-).
>
>Are masks that cannot be expressed in the IP/x schmeme (at least not in one
>rule) used in practise? Are they used at all in firewall rulesets?
>
>
>Thomas





