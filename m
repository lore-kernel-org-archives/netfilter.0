From: Matthew Cornwell Williams <os@UDel.Edu>
Subject: Update: Masquerading Firewall <--GRE--> Bridging Masquerading
 Firewall?
Date: Mon, 18 Nov 2002 13:40:34 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.SOL.4.44.0211181336420.1104-100000@copland.udel.edu>
References: <Pine.SOL.4.44.0211180847260.29014-100000@copland.udel.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.SOL.4.44.0211180847260.29014-100000@copland.udel.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

So I figured out part of the problem.  The masquerading on 198.168.1.5 was
being done incorrectly---it was doing it for /all/ 198.168.1.0/24 at the
POSTROUTING level (SNAT), so it was mangling more packets than I wanted.
A couple changes to the firewalling rules, and 198.168.1.0/24 and
198.168.2.0/24 can see 192.168.1.1 now.
It also turned out that I misread the output of who -R on my test machine
on 198.168.1.0/24.  198.168.1.5 wasn't making connections from 192.168.1.1
appear to be from 68.x.y.z after all.
Now the only trick is why this damn IRIX box sends *every* packet from
128.d.e.f, regardless of which network it's sending them to.... grrrr....
(ping 192.168.1.1 from shows packets to/from 128.d.e.f in tcpdump and not
192.168.1.50 how it should be!)

Oh, btw, if anybody has any AIX experience, drop me a line ;)

--os (the orange squid)
a.k.a. Matt Williams
os@udel.edu os@os.us.eu.org



