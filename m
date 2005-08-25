From: "Christian Bricart" <christian@bricart.de>
Subject: --zero/-Z does not zero built-in chains
Date: Thu, 25 Aug 2005 15:30:16 +0200 (CEST)
Message-ID: <58151.80.87.162.74.1124976616.squirrel@aachalon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I've run into the same that has (only) been postet once (
http://lists.netfilter.org/pipermail/netfilter/2005-July/061667.html ) on
this list.
Somewhere between 1.3.1 and 1.3.2 release something has been changed that
has to do with zeroring chains.

It used to be the case that an

 # iptables -L INPUT -nxZ

set counters on the INPUT chain to 0 right after output (conforms to any
document about --zero/-Z i.e. man page, etc.)

With 1.3.2 (not yet tested on 1.3.3) the counters stay intact.
Alas, this only happens to the built-in chains (INPUT,OUTPUT, FORWARD) -
not to user-defined chains like:

# iptables -N acc_in
# iptables -A acc_in -j RETURN
# iptables -I INPUT -j acc_in
[..let some data flow..]
# iptables -L acc_in -nxZ
[..shows current counters of "acc_in" chain and zeroes it's counters..]

Christian


