From: "Brian Muita" <bmuita@strathmore.ac.ke>
Subject: Forwarding IP broadcast traffic using netfilter
Date: Wed, 5 Nov 2003 10:20:54 +0300 (EAT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3331.192.168.11.3.1068016854.squirrel@euclid>
Reply-To: bmuita@strathmore.ac.ke
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hello all,

 I've been searching all over the net for a solution for
this. This issue has also come up on this list on various
occasions but they all yielded non conclusive results. I
am hoping that someone out there has actually found a way
to do this using netfilter.
 Why do I want to forward broadcast traffic? I have two
networks connected via a firewall with proxy arp in use.
These two networks consist of Windows machines and for
browsing purposes I would like the machines on both to
'see' each other.
 I am weighing my options. So far I have bridging and
using wins. I would like to avoid using either of them.
Is it possible to achieve this using netfilter?

Brian G. Muita

